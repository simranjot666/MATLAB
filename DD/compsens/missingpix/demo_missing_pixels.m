% ************************************************************************
% Reconstructing Images from Random Subsets of Pixels 
% Using Compressed Sensing (l_1 Minimization)
%
%     code by Jarvis Haupt and Robert Nowak, 2010
% ***********************************************************************
% 
% The images generated by this code appeared in the article
% "Fill in the Blanks: Using Math to Turn 
%  Lo-Res Datasets Into Hi-Res Samples" 
%      by Jordan Ellenberg, Wired Magazine, March 2010
% http://www.wired.com/magazine/2010/02/ff_algorithm/
%
% The following Matlab packages are required:
% 
% 1) Gradient Projection for Sparse Reconstruction (GPSR) 
%     available at http://www.lx.it.pt/~mtf/GPSR/
% 2) Rice Wavelet Toolbox
%     available at http://dsp.rice.edu/software/rice-wavelet-toolbox
% 
% A suitable test image can be downloaded from:
% http://commons.wikimedia.org/wiki/File:Obama_portrait_crop.jpg
%   (rename file to 'obama.jpg' for use here)
%

% Clear the variable space and close all windows
close all
clear all
%
% Seed the random number generators for repeatability
rand('seed',2)
randn('seed',2)


% ******************************
% USER-SPECIFIED TASK PARAMETERS
% ******************************
%
% Image Name
% **********
%
% Should be a color jpeg file
im_name = ['obama.jpg'];
%
%
% Image Parameters
% ****************
%
% m = desired number of rows in image to process (in pixels)
% n = desired number of columns in image to process (in pixels)
%   (Note: must be of the form c*2^d where c and d are integers)
% 
% The image will be *rescaled* to achieve the row dimension, and then
%   *cropped* to achieve the column dimension (to maintain aspect ratio)
%   (Wired article simulations used m=512, n=384) 
m = 512;
n = 384;
%
%
% Pixel Deletion Fraction
% ***********************
%
% Fraction of pixels to randomly delete
%   (Wired article simulations used p=0.7)
p = 0.7;
%
%
% Recovery Task Selection
% ***********************
%
% Choose the recovery task
%  1 = Recover a color image by reconstructing RGB planes
%  2 = Recover a black & white image by reconstructing intensity plane only
%   (Wired article simulations used task = 1)
task = 1;
%
%
% Wavelet Transform Parameter Selection
% *************************************
%
% Length of wavelet scaling and wavelet filters
%   (Wired article simulations used filt_len = 8)
filt_len = 8;
%
% Number of levels in transform
%   (Wired article simulations used levels = 3; 
%      for full wavelet decomposition, set levels = -1)
levels = 3;
%
%
% GPSR Reconstruction Algorithm Parameters
% ****************************************
%
% Regularization parameter -- see GPSR code for details
%   (Wired article simulations used tau = 2)
tau = 2;
%
% Debias option -- see GPSR code for details
%   (Wired article simulations used DEBIAS = 1)
DEBIAS = 1;
%
% Tolerance parameter -- see GPSR code for details
% Larger values of tolA correspond to "incomplete" solution paths, for 
%   which the output is one (of the many possible) intermediate solution(s)
%   (Wired article simulations used tolA = 1e-5 for full reconstruction,
%        and tolA = 1e-1, 1e-2, and 5e-3 for intermediate reconstructions)
tolA = 1e-5;
%
%
% Figure Output Parameters
% ************************
%
% Automatic contrast/level adjustment for reconstructed image
%  0 = No automatic contrast/level adjustment
%  1 = Auto-adjust levels
auto_adjust = 1;
%
% Fraction of upper and lower extreme amplitude values to saturate
%  if auto-adjusting levels
%  (use frac ~ 0.02 for RGB, and frac ~ 0.01 for B&W)
frac = 0.02;
%
% ********************************
% END OF USER-SPECIFIED PARAMETERS
% ********************************



% *******************
% Subsample Selection
% *******************
%
% Randomly select the locations of pixels to keep
rand_temp = rand(m*n,1);
[srtd,inx] = sort(rand_temp);
indices = inx(1:round(m*n*(1-p)));



% ****************************
% Function Handle Declarations
% ****************************
%
% Set up the function handles to perform the operations of 
% pixel sub-sampling, and its adjoint
R = @(x) pixel_subsampling(x,indices);
RT = @(x) pixel_upsampling(x,m,n,indices);
%
% Set up the function handles for the discrete wavelet transform
wav_filt = daubcqf(filt_len);
if levels ~= -1
    W = @(x) midwt(x,wav_filt,levels);
    WT = @(x) mdwt(x,wav_filt,levels);
else
    W = @(x) midwt(x,wav_filt);
    WT = @(x) mdwt(x,wav_filt);
end
%
% Set up function handles for the composite downsampling/wavelet transform
% operation and its transpose
A = @(x) R(W(x));
AT = @(x) WT(RT(x));



% *****************
% Obtain Test Image 
% *****************
%
% Read and resize the original image
image_orig = imread(im_name);
image_resized = imresize(image_orig,[NaN,n]);
im = double(image_resized(1:m,:,:));
%
% Obtain image planes
if task == 1
    % RGB planes
    num_planes = 3;
    P = im;
    disp('Recover by reconstructing RGB planes...');
else
    % Intensity only (B&W)
    num_planes = 1;
    P = rgb2hsv(im);
    P=P(:,:,3);
    disp('Recover by reconstructing B&W plane only...');
end
P_write = P;
%
% Save this version of the original, undecimated image in bitmap format
% (Need to scale each plane so that the entries are in [0,1] for imwrite)
Original = zeros(m,n,num_planes);
for i=1:num_planes
    cur_plane = P_write(:,:,i);
    Original(:,:,i) = scale_values(cur_plane,0,1);
end
imwrite(Original,'Original.bmp');



% ******************
% Random Subsampling
% ******************
%
P_sub = zeros(length(indices),num_planes);
P_full = zeros(size(P));
for i=1:num_planes
    % Subsample each plane
    cur_plane = P(:,:,i);
    P_sub(:,i) = R(cur_plane);
    %
    % Full-size versions of each sampled plane
    P_full(:,:,i) = RT(P_sub(:,i));
end
P_write = P_full;
%
% Save the subsampled image in bitmap format
SubSamp = zeros(m,n,num_planes);
for i=1:num_planes
    % Write each full-sized plane
    SubSamp(:,:,i) = scale_values(P_write(:,:,i),0,1);
end
imwrite(SubSamp,'SubSamp.bmp');



% **************
% Reconstruction
% **************
% 
% Reconstruct each plane using GPSR with the parameters specified above
P_est = zeros(size(P));
for i=1:num_planes
    disp(['Recovering plane ', num2str(i), '/', num2str(num_planes),'.']);
    tic;
    cur_samples = P_sub(:,i);
    [Rec,Rec_debias,obj_GPSR_Basic, times_GPSR_Basic, debias_s,...
        mses_GPSR_Basic] = GPSR_Basic(cur_samples,A,tau,...
	     'Debias',DEBIAS,...
	     'AT',AT,...
	     'Initialization',AT(cur_samples),...
	     'StopCriterion',2,...
	     'ToleranceA',tolA,...
         'Verbose',0);
    T=toc;
    disp(['Plane ', num2str(i), ' recovered in ',num2str(T),' seconds.']);
    if prod(size(Rec_debias))~=0
        P_est(:,:,i) = W(Rec_debias);
    else
        P_est(:,:,i) = W(Rec);
    end
end
%
% Save the reconstructed image
Recon = zeros(m,n,num_planes);
for i=1:num_planes
    % Write each full-sized plane
    Recon(:,:,i) = scale_values(P_est(:,:,i),0,1);
    % Auto-adjust contrast/levels, if specified
    if (auto_adjust)
        Recon(:,:,i) = level_adjust(Recon(:,:,i),frac);
    end
end
imwrite(Recon,'Recon.bmp');

