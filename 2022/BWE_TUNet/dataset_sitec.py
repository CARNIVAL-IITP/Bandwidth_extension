import torch

import os, random, librosa

import numpy as np

from numpy.random import default_rng
from sklearn.model_selection import train_test_split
from torch.utils.data import Dataset
from utils.utils import decimate, frame

from config_folder.SITEC_TUNet import CONFIG
from config_folder.SITEC_TUNet_realtime import CONFIG
from config_folder.SITEC_TUNet_realtime_atafilm import CONFIG


rng = default_rng()

def pad(sig, length):
    if len(sig) < length:
        pad = length - len(sig)
        sig = np.hstack((sig, np.zeros(pad) + 0.1))
    else:
        start = random.randint(0, len(sig) - length)
        sig = sig[start:start + length]
    return sig


def mask_input(sig):
    sig = np.reshape(sig, (-1, CONFIG.TASK.mask_chunk))
    mask = np.ones(len(sig))
    mask[:int(CONFIG.TASK.mask_ratio * len(mask))] = 0
    np.random.shuffle(mask)
    sig *= mask[:, np.newaxis]
    sig = np.reshape(sig, -1)
    return sig


class CustomDataset_sitec(Dataset):
    def __init__(self, mode='train'):
        data_dir = CONFIG.DATA.data_dir
        name = CONFIG.DATA.dataset

        self.target_root = data_dir[name]['root']
        if mode == 'test':
            txt_list = data_dir[name]['test']
        elif mode == 'train':
            txt_list = data_dir[name]['train']
        elif mode == 'val':
            txt_list = data_dir[name]['val']
        self.data_list = self.load_txt(txt_list)

        self.mode = mode
        self.sr = CONFIG.DATA.sr
        self.down_rate = CONFIG.DATA.ratio
        self.window = CONFIG.DATA.window_size
        self.stride = CONFIG.DATA.stride
        self.task = CONFIG.TASK.task
        self.downsampling = CONFIG.TASK.downsampling

    def __len__(self):
        return len(self.data_list)

    @staticmethod
    def collate_fn(batch):
        data = torch.cat([item[0] for item in batch], dim=0).float()
        target = torch.cat([item[1] for item in batch], dim=0).float()
        return [data, target]

    def load_txt(self, txt_list):
        target = []
        with open(txt_list) as f:
            for line in f:
                target.append(os.path.join(self.target_root, line.strip('\n')))
        target = list(set(target))
        target.sort()
        return target

    def lowpass(self, sig):
        low_sr = self.sr // self.down_rate
        if self.downsampling == 'augment':

            n = random.choice(CONFIG.TASK.orders)
            ripple = random.choice(CONFIG.TASK.ripples)

            sig = decimate(sig, self.down_rate, n=n, ripple=ripple)
            sig = librosa.resample(sig, low_sr, self.sr)
        elif self.downsampling == 'cheby':
            sig = decimate(sig, self.down_rate)
            sig = librosa.resample(sig, low_sr, self.sr)
        else:
            sig = librosa.resample(sig, self.sr, low_sr, res_type=self.downsampling)
            sig = librosa.resample(sig, low_sr, self.sr)
        return sig

    def __getitem__(self, index):
        np.random.seed(index)
        sig, sr = librosa.load(self.data_list[index], sr=self.sr)

        if len(sig) < self.window:
            sig = pad(sig, self.window)
        batches = int((len(sig) - self.stride) / self.stride)
        sig = sig[0: int(batches * self.stride + self.stride)]
        target = sig.copy()

        low_sig = self.lowpass(sig)
        if len(target) != len(low_sig):
            low_sig = pad(low_sig, len(target))

        if self.task == 'msm':
            target = low_sig.copy()
            low_sig = mask_input(low_sig)
        
        if self.task == 'nae':
            target = low_sig.copy()
        
        if self.task == 'nb_bwe':
            target = low_sig.copy()
            low_sig = self.lowpass(low_sig)
            if len(target) != len(low_sig):
                low_sig = pad(low_sig, len(target))
        
        if self.task == 'msm+nb_bwe':
            target = low_sig.copy()
            low_sig = self.lowpass(low_sig)
            if len(target) != len(low_sig):
                low_sig = pad(low_sig, len(target))
            low_sig = mask_input(low_sig)

        X = frame(low_sig, self.window, self.stride)[:, np.newaxis, :]
        if self.mode == 'test':
            return X, target, low_sig

        y = frame(target, self.window, self.stride)[:, np.newaxis, :]
        return torch.tensor(X), torch.tensor(y)