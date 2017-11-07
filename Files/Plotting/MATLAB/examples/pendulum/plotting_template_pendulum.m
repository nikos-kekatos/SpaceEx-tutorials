% ========================================================================
% INTRODUCTION:
%
% This example illustrates the use of Matlab functions for plotting
% flowpipes obtained with SpaceEx. There are two functions:
%
% (i) `gen_to_mat.m` : save the plot as a .mat file.
%
% (ii) `plot_flowpipe.m` : plot the flowpipe as a sequence of polygons in
% the same pair of axes.
%
% MOTIVATION:
%
% The motivation is that often the for large files, visualization takes a
% lot of time, because SpaceEx produces a flowpipe with a lot of accuracy 
% (huge number of polytopes, maybe hundreds of thousands). But for 
% visualization this is not actually needed, and if we include them, the 
% default plotting in SpaceEx web interface is slow. 
%
% For example, a plot of all polygons in there can take take 45min - 1hr 
% for the examples in the paper synlin. Here we propose to do a sampling 
% of the polygons, which reduces the time to just a couple of minutes.
%
% The difficulty that we have to overcome is that often there are segments 
% when the polygons advance more fast (usually at the beginning), and
% another places (usually at the end), when these accumulate. hence, it is
% best to sample non-uniformly from different portions, based for instance
% in the min-max of the x or y coordinate.
%
% NOTES:
% 
% - Usually for large models, saving gen to mat is the most time consuming 
% part. 
% - The conversion .gen -> .mat needs to be done only once.
%
% TESTS:
%
% Testing the pendulum model (assuming that there is not MAT file)::
%
%     >> example_plotting
%     The total number of lines in the GEN file is 163197. 
% 
%     The total number of polytopes is 9262.0000. 
%     The total elapsed time is 3.4814 seconds. 
% 
% 
%     ans =
% 
%     pend.mat
% 
%     The total number of polytopes is 9262. 
% 
%     The total elapsed time is 0.5294 seconds. 
%
% If we run it for the second time, it runs faster::
%
%     >> close all; clear all; example_plotting
%     The total number of polytopes is 9262. 
% 
%     The total elapsed time is 0.6148 seconds.

% ========================================================================
function plotting_template_pendulum(filename)

if nargin == 0
    % choose file name
    error('Select a GEN file');
end

% if it doesn't exist, generate .mat file containing the flowpipe
filename_mat = strrep(filename, '.gen', '.mat');
if exist(filename_mat, 'file') == 2   
     % file exists
else
    gen_to_mat(filename)
end

% generate the plots : what are good 'jumps' depends on the model
options.verbose = 1;
options.jump = [1 5 40 200 500 1000 2000 2500 3000 3500 5000];
%options.jump = [1 20];
options.color = 'k';
plot_flowpipe(filename_mat, options);

end