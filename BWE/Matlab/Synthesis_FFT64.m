fclose('all'); close all; clear; clc;

%% Load input and output 
input_location = '';
output_location = '';
parameter_location = '';
mat_extension = '.mat';
txt_extension = '.txt';

% input_clean = 'D:\DB\samsung\NB\clean\test\up_de\';
% input_babble = 'D:\DB\samsung\NB\babble\test\up_de\';
% input_white = 'D:\DB\samsung\NB\white\test\up_de\';
% input_street = 'D:\DB\samsung\NB\street\test\up_de\';
% output = 'D:\projects\2016\�Ｚ����_������(�Ϸ�)\';

normal_norm = fullfile(parameter_location, ['normal_norm_f' mat_extension]);
load(normal_norm, 'normal_mean_f', 'normal_std_f');
class_norm = fullfile(parameter_location, ['class_norm_f_1' mat_extension]);
load(class_norm, 'class_mean_f', 'class_std_f');
over_norm = fullfile(parameter_location, ['over_norm_f_1' mat_extension]);
load(over_norm, 'over_mean_f', 'over_std_f');

%w1_normal = load('MATLAB/FFT64/SYNTHESIS/98_w1.txt');
%w2_normal = load('MATLAB/FFT64/SYNTHESIS/98_w2.txt');
%w3_normal = load('MATLAB/FFT64/SYNTHESIS/98_w3.txt');
% w4_normal = load('MATLAB/FFT64/SYNTHESIS/98_w4.txt');
% b1_normal = load('MATLAB/FFT64/SYNTHESIS/98_b1.txt');
% b2_normal = load('MATLAB/FFT64/SYNTHESIS/98_b2.txt');
% b3_normal = load('MATLAB/FFT64/SYNTHESIS/98_b3.txt');
% b4_normal = load('MATLAB/FFT64/SYNTHESIS/98_b4.txt');

% w1_normal = load('MATLAB/FFT64/SYNTHESIS/Regression1_huber/239_w1.txt');
% w2_normal = load('MATLAB/FFT64/SYNTHESIS/Regression1_huber/239_w2.txt');
% w3_normal = load('MATLAB/FFT64/SYNTHESIS/Regression1_huber/239_w3.txt');
% w4_normal = load('MATLAB/FFT64/SYNTHESIS/Regression1_huber/239_w4.txt');
% b1_normal = load('MATLAB/FFT64/SYNTHESIS/Regression1_huber/239_b1.txt');
% b2_normal = load('MATLAB/FFT64/SYNTHESIS/Regression1_huber/239_b2.txt');
% b3_normal = load('MATLAB/FFT64/SYNTHESIS/Regression1_huber/239_b3.txt');
% b4_normal = load('MATLAB/FFT64/SYNTHESIS/Regression1_huber/239_b4.txt');

w1_normal = load('MATLAB/FFT64/SYNTHESIS/Regression1_mae/292_w1.txt');
w2_normal = load('MATLAB/FFT64/SYNTHESIS/Regression1_mae/292_w2.txt');
w3_normal = load('MATLAB/FFT64/SYNTHESIS/Regression1_mae/292_w3.txt');
w4_normal = load('MATLAB/FFT64/SYNTHESIS/Regression1_mae/292_w4.txt');
b1_normal = load('MATLAB/FFT64/SYNTHESIS/Regression1_mae/292_b1.txt');
b2_normal = load('MATLAB/FFT64/SYNTHESIS/Regression1_mae/292_b2.txt');
b3_normal = load('MATLAB/FFT64/SYNTHESIS/Regression1_mae/292_b3.txt');
b4_normal = load('MATLAB/FFT64/SYNTHESIS/Regression1_mae/292_b4.txt');

% w2_normal = load('MATLAB/FFT64/SYNTHESIS/98_w2.txt');
% w3_normal = load('MATLAB/FFT64/SYNTHESIS/98_w3.txt');
% w4_normal = load('MATLAB/FFT64/SYNTHESIS/98_w4.txt');
% b1_normal = load('MATLAB/FFT64/SYNTHESIS/98_b1.txt');
% b2_normal = load('MATLAB/FFT64/SYNTHESIS/98_b2.txt');
% b3_normal = load('MATLAB/FFT64/SYNTHESIS/98_b3.txt');
% b4_normal = load('MATLAB/FFT64/SYNTHESIS/98_b4.txt');

w1_class = load('MATLAB/FFT64/SYNTHESIS/79_w1.txt');
w2_class = load('MATLAB/FFT64/SYNTHESIS/79_w2.txt');
w3_class = load('MATLAB/FFT64/SYNTHESIS/79_w3.txt');
w4_class = load('MATLAB/FFT64/SYNTHESIS/79_w4.txt');
b1_class = load('MATLAB/FFT64/SYNTHESIS/79_b1.txt');
b2_class = load('MATLAB/FFT64/SYNTHESIS/79_b2.txt');
b3_class = load('MATLAB/FFT64/SYNTHESIS/79_b3.txt');
b4_class = load('MATLAB/FFT64/SYNTHESIS/79_b4.txt');

w1_over = load('MATLAB/FFT64/SYNTHESIS/191_w1.txt');
w2_over = load('MATLAB/FFT64/SYNTHESIS/191_w2.txt');
w3_over = load('MATLAB/FFT64/SYNTHESIS/191_w3.txt');
w4_over = load('MATLAB/FFT64/SYNTHESIS/191_w4.txt');
b1_over = load('MATLAB/FFT64/SYNTHESIS/191_b1.txt');
b2_over = load('MATLAB/FFT64/SYNTHESIS/191_b2.txt');
b3_over = load('MATLAB/FFT64/SYNTHESIS/191_b3.txt');
b4_over = load('MATLAB/FFT64/SYNTHESIS/191_b4.txt');

% load 0814_samsung_etri_ntt\\class_norm_f_2; %classification norm
% w1_class = load('0814_samsung_etri_ntt\\239_w1.txt'); w2_class = load('0814_samsung_etri_ntt\\239_w2.txt'); w3_class = load('0814_samsung_etri_ntt\\239_w3.txt');
% b1_class = load('0814_samsung_etri_ntt\\239_b1.txt'); b2_class = load('0814_samsung_etri_ntt\\239_b2.txt'); b3_class = load('0814_samsung_etri_ntt\\239_b3.txt');
% load 0814_samsung_etri_ntt\\normal_norm_f; %regression1 norm
% w1_normal = load('0814_samsung_etri_ntt\\158_w1.txt'); w2_normal = load('0814_samsung_etri_ntt\\158_w2.txt'); w3_normal = load('0814_samsung_etri_ntt\\158_w3.txt');
% b1_normal = load('0814_samsung_etri_ntt\\158_b1.txt'); b2_normal = load('0814_samsung_etri_ntt\\158_b2.txt'); b3_normal = load('0814_samsung_etri_ntt\\158_b3.txt');
% load 0814_samsung_etri_ntt\\over_norm_f_1; %regression2 norm
% w1_over = load('0814_samsung_etri_ntt\\414_w1.txt'); w2_over = load('0814_samsung_etri_ntt\\414_w2.txt'); w3_over = load('0814_samsung_etri_ntt\\414_w3.txt');
% b1_over = load('0814_samsung_etri_ntt\\414_b1.txt'); b2_over = load('0814_samsung_etri_ntt\\414_b2.txt'); b3_over = load('0814_samsung_etri_ntt\\414_b3.txt');

ch_tbl = [2 2; 3 3; 4 4; 5 5; 6 7; 8 9; 10 12; 13 16];
min_energy = 0.0625;
vm_tbl = [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 7, 7, 7, 8, 8, 9, 9, ...
    10, 10, 11, 12, 12, 13, 13, 14, 15, 15, 16, 17, 17, 18, 19, 20, 20, 21, 22, 23, 24, 24, ...
    25, 26, 27, 28, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 37, 38, 39, 40, 41, 42, 43, 44, ...
    45, 46, 47, 48, 49, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50];
fs = 16000; framelen = 32; overlap = 32; nfft = 64;
Deno = 0.5 / overlap;
for c1 = 1 : overlap
    f_tmp = sin(pi * ((c1 - 1) + 0.5) * Deno);
    window(c1, 1) = f_tmp * f_tmp;
end
for c1 = (overlap + 1) : framelen
    window(c1, 1) = 1.0;
end
for c1 = (framelen + 1) : (framelen + overlap)
    f_tmp = sin(pi * (((c1 - 1) - framelen + overlap) + 0.5) * Deno);
    window(c1, 1) = f_tmp * f_tmp;
end
for c1 = (framelen + overlap + 1) : nfft
    window(c1, 1) = 0;
end

hiss_thld(2) = 10 ^ (50 / 20);
hiss_thld(3) = 10 ^ (44 / 20);
for fb = 4 : 32
    hiss_thld(fb) = 10 ^ ((44 - 0.2069 * (fb - 3)) / 20);
end

for n = (1:1800)
    disp(n);
%     a = [input_clean sprintf('up_de_25dB_ss_test_%04d.raw', n)];
%     b = [output sprintf('2016_clean_%d.raw', n)];
%     a = [input_babble sprintf('up_de_babble_25dB_ss_test_%04d.raw', n)];
%     b = [output sprintf('2016_babble_%d.raw', n)];
    a = [input_location sprintf('LPF_UP_RAW_test--%d.raw', n)];
    b = [output_location sprintf('output_%d.raw', n)];

    fid = fopen(a, 'rb');
    signal = fread(fid, inf, 'short');
    fclose(fid);
    
    Sph_Out = zeros(framelen, 1);
    Sph_Prev = zeros(nfft, 1);
    Sph_FE_Out = zeros(length(signal), 1);
    prev_est_lps1 = zeros(1, 64);
    ch_energy = zeros(1, 8);
    silence = 40;
    voice = 0;
    silence_clean = 20;
    silence_noisy = 20;
    Framenum = floor(length(signal) / framelen);
    vm_result = zeros(Framenum, 1);
    vm_sum = zeros(Framenum, 1);
    VAD = zeros(Framenum, 1);
    energy_result = zeros(Framenum, 1);
    energy_sum = zeros(Framenum, 1);
    nbfeatures = zeros(1, 75);
    nbfeatures_new = zeros(1, 55);
    
    for i = 1 : Framenum
        Sph_Frm = zeros(64, 1);
        if(i > 1)
            Sph_Frm(1 : overlap) = signal((i - 1) * framelen - overlap  + 1 : (i - 1) * framelen);
        end
        Sph_Frm(overlap + 1 : overlap + framelen) = signal((i - 1) * framelen + 1 : i * framelen);
        Sph_Frm = Sph_Frm .* window;
        
        nbfft = fft(Sph_Frm, 64);
        
        if i > 1
            alpha_ch = 0.55;
        else
            alpha_ch = 1;
        end
        
        vm = 0;
        for ch = 1 : 8
            j1 = ch_tbl(ch, 1); j2 = ch_tbl(ch, 2);
            energy = 0;
            for jj = j1 : j2
                energy = energy + abs(nbfft(jj)).^2;
            end
            energy = energy / (j2 - j1 + 1);
            ch_energy(ch) = max((1 - alpha_ch) * ch_energy(ch) + alpha_ch * energy, min_energy);
            if i < 21
                noise_energy(ch) = max(ch_energy(ch), 8);
            end
            snr(ch) = round(10 * log10((ch_energy(ch) / noise_energy(ch)) / 0.375));
            jj = max(min(snr(ch), 90), 1);
            vm = vm + vm_tbl(jj);
        end
        
        vm_result(i) = vm;
        if i > 20
            vm_sum(i) = vm_sum(i-1) - vm_result(i - 20) + vm_result(i);
        elseif i > 1
            vm_sum(i) = vm_sum(i-1) + vm_result(i);
        else
            vm_sum(i) = vm_result(i);
        end
        
        nbfeature = abs(nbfft(1 : 33, 1)).^2;
        
        if min(nbfeature) ~= 0
            
            nbfeature_new = Features(Sph_Frm, nbfeature(1 : 17), nfft);
            
            nbfeatures = [nbfeatures(1, 16 : 75) log(nbfeature(2 : 16, 1).')];
            nbfeatures_new = [nbfeatures_new(1, 12 : 55) nbfeature_new];
            
            nbphase = angle(nbfft);
            
            if i > 8
                feature=[nbfeatures nbfeatures_new prev_est_lps1];
                
                buf1 = bsxfun(@minus, feature, class_mean_f);
                data = bsxfun(@rdivide, buf1, class_std_f);
                w1probs = max((data * w1_class + b1_class.'), 0);
                w2probs = max((w1probs * w2_class + b2_class.'), 0);
                w3probs = max((w2probs * w3_class + b3_class.'), 0);
                wclass(i, :) = exp(w3probs * w4_class + b4_class.');
                wclass(i, :) = wclass(i, :) ./ repmat(sum(wclass(i,:), 2), 1, size(wclass(i, :), 2));
                
                buf1 = bsxfun(@minus, nbfeatures, normal_mean_f);
                data = bsxfun(@rdivide, buf1, normal_std_f);
                w1probs = max((data * w1_normal + b1_normal.'), 0);
                w2probs = max((w1probs * w2_normal + b2_normal.'), 0);
                w3probs = max((w2probs * w3_normal + b3_normal.'), 0);
                est_lps1 = w3probs * w4_normal + b4_normal.';
                
                prev_est_lps1 = [prev_est_lps1(1, 17 : 64) est_lps1];
                
                buf1 = bsxfun(@minus, nbfeatures, over_mean_f);
                data = bsxfun(@rdivide, buf1, over_std_f);
                w1probs = max((data * w1_over + b1_over.'), 0);
                w2probs = max((w1probs * w2_over + b2_over.'), 0);
                w3probs = max((w2probs * w3_over + b3_over.'), 0);
                est_lps2 = w3probs * w4_over + b4_over.';
                
                est_lps = est_lps1 * wclass(i, 1) + est_lps2 * wclass(i, 2);
            else
                buf1 = bsxfun(@minus, nbfeatures, normal_mean_f);
                data = bsxfun(@rdivide, buf1, normal_std_f);
                w1probs = max((data * w1_normal + b1_normal.'), 0);
                w2probs = max((w1probs * w2_normal + b2_normal.'), 0);
                w3probs = max((w2probs * w3_normal + b3_normal.'), 0);
                est_lps1 = w3probs * w4_normal + b4_normal.';
                
                prev_est_lps1 = [prev_est_lps1(1, 17 : 64) est_lps1];
                
                est_lps = est_lps1;
            end
            
            est_wbmag_l = [log(nbfeature(1 : 16).') est_lps log(nbfeature(33).')];
            est_wbmag_l = exp(0.5 * est_wbmag_l);
            
            if i > 20
                if vm_sum(i) > 413
                    voice = voice + 1;
                    if voice > 5
                        VAD(i) = 1;
                        silence = 0;
                    else
                        VAD(i) = 0;
                    end
                else
                    silence = silence + 1;
                    if silence > 10
                        VAD(i) = 0;
                        voice = 0;
                    else
                        VAD(i) = 1;
                    end
                end
            end
            
            energy_result(i) = sum(est_wbmag_l(2:16).^2);
            if i > 20
                energy_sum(i) = energy_sum(i-1) - energy_result(i - 20) + energy_result(i);
            elseif i > 1
                energy_sum(i) = energy_sum(i-1) + energy_result(i);
            else
                energy_sum(i) = energy_result(i);
            end
            
            if VAD(i) == 0
                if energy_sum(i) > 4.2548e+06
                    silence_clean = 0;
                    silence_noisy = silence_noisy + 1;
                    est_wbmag_l(17 : 32) = est_wbmag_l(17 : 32) * exp(-2.7726 / 10 * silence_noisy);
                else
                    silence_clean = silence_clean + 1;
                    silence_noisy = 0;
                    est_wbmag_l(2 : 16) = est_wbmag_l(2 : 16) * 2 * exp(-2.7726 / 20 * silence_clean);
                    est_wbmag_l(17 : 32) = est_wbmag_l(17 : 32) * exp(-2.7726 / 10 * silence_clean);
                end
            else
                for fb = 17 : 32
                    if est_wbmag_l(fb) < hiss_thld(fb)
                        est_wbmag_l(fb) = est_wbmag_l(fb) / 10 ^ (12 / 20);
                    end
                end
            end
            
            est_wbmag_r = fliplr(est_wbmag_l(1, 2 : 32));
            est_wbmag = [est_wbmag_l est_wbmag_r];
            
            wbphase_l = [nbphase(1 : 17, 1).' -nbphase(16 : -1 : 1, 1).'];
            wbphase_r = fliplr(wbphase_l(1, 2 : 32));
            wbphase = [wbphase_l -wbphase_r];
            
            Sph_FFT = est_wbmag.' .* exp(1i * wbphase.');
        else
            Sph_FFT = log((abs(nbfft) .^ 2)) .* exp(1i * angle(nbfft));
        end
        
        Sph_IFFT = real(ifft(Sph_FFT, nfft));
        Sph_Out(1 : nfft - framelen) = Sph_IFFT(1 : nfft - framelen) + Sph_Prev(1 + framelen : nfft);
        Sph_Out(nfft - framelen + 1 : framelen) = Sph_IFFT(nfft - framelen + 1 : framelen);
        Sph_Prev = Sph_IFFT;
        Sph_FE_Out((i - 1) * framelen + 1 : i * framelen) = Sph_Out(1 : framelen);
    end
    
    fid2 = fopen(b, 'wb');
    fwrite(fid2, Sph_FE_Out, 'short');
    fclose(fid2);
end

fclose('all');