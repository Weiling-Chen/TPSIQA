%demo
clc
clear all
load model
load ranSeleFeatures %selected features
addpath('..\ContourletToolbox2.0')
%% parameter
nlevels = [0, 1, 2] ;        % Decomposition level
pfilter = 'pkva' ;              % Pyramidal filter
dfilter = 'pkva' ;              % Directional filter
n = 30;                         % Quantization step of histogram
%% feature extraction
img=imread('ref.bmp');
imgDis=imread('dis.bmp');
%% sending end
f_ori = feature_SRSIQA(img, nlevels, pfilter, dfilter, n);  
%% receiving end
Q = recSR_SIQA(f_ori, imgDis, nlevels, pfilter, dfilter, n, model, feature_group)
