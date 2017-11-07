% ========================================================================
% This example illustrates the use of Matlab functions for plotting
% flowpipes obtained with SpaceEx. There are two functions:
%
% USAGE:
%
% >> addpath('../../src/')
% >> plotting_template_bball('bball_timed.gen')
% ========================================================================
function plotting_template_bball(filename)

if nargin == 0
    % choose file name
    error('Select a GEN file');
end

[filename_mat,options] = gen_to_mat(filename);

% generate the plots : what are good 'jumps' depends on the model
options.jump=[2]; % plot one every two polygons

plot_flowpipe(filename_mat, options);

end