%https://www.mathworks.com/matlabcentral/fileexchange/30806-find-and-mark-lines-using-hough-transform
% https://stackoverflow.com/questions/9916253/hough-transform-in-matlab-without-using-hough-function
% https://dsp.stackexchange.com/questions/1883/how-to-do-de-houghing-of-a-hough-transformed-image/2602#2602
% https://www.youtube.com/watch?v=kMK8DjdGtZo
% https://www.youtube.com/watch?v=o-n7NoLArcs&t=2s

I = rgb2gray(imread('lines.jpg'));
imge = edge(I,'canny');

[H,theta,rho ] = hough( imge);

%% Find Peaks
peaks = findpeaks(H, 6); 

%% Draw Lines
findlines(imge, peaks,rho,theta);
