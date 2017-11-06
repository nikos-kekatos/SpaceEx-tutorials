function plot_flowpipe(fname, options)
% PLOT_FLOWPIPE Approximate plot of a large sequence of polygons by
% sampling.
%
% INPUT:
%
%   "fname" - gen file name if it is in the same folder of this script,
%             or the full path otherwise.
%
%   "options" - see the code.
%
% EXAMPLES:
%
% Export the gen data to a mat file:
%   >> gen_to_mat(...)
%
% Plot the resulting MAT file, with the standard options:
%   >> plot_flowpipe(fname, []);
%
% See also: gen_to_mat

% =========================================================================

tic
if nargin == 0
    error('Filename not specified.');
end

if nargin == 1
    options.verbose = 1;
    options.jump = 1;
    options.color = 'b'; % blue
end

got_gen = false; got_mat = false;

if ~isempty(strfind(fname, '.gen'))
    got_gen = true;
elseif ~isempty(strfind(fname, '.mat'))
    got_mat = true;
else
    error('Input file type not recognised, try with .gen or .mat')
end

if got_mat
    data = load(fname);
    fp = data.polygons_list;
    num_polygons = size(fp, 1);
else
    error('Got gen file, but it is recommended to use mat files. Try using `gen_to_mat.m`')
end

if options.verbose
    fprintf('The total number of polytopes is %i. \r\n', num_polygons);
end

if ~isfield(options, 'save')
    options.save = 1;
end

% call the plotting function
plot_sampling(fname, data, fp, num_polygons, options);

end    % -- end of plot_flowpipe

function [varargout] = plot_sampling(fname, data, fp, num_polygons, options)
% PLOT_SAMPLING Plot a sequence of polygons by sampling the given flowpipe.
%
% INPUT:
%
%   "fname" - gen file name if it is in the same folder of this script,
%             or the full path otherwise.
%
%   "options" - see the code.
%
% OUTPUT:
%
%   "varargout" - variable number of arguments: name of the figure that 
%   was generated; handle of the figure h1 (not used).
%
% ALGORITHM:
%
% The key parameter is options.jump, and it is interpreted in the following
% way:
%    - if `jump` is a scalar, as in `options.jump = c`, then only multiples 
%      of this value are plotted.
%    - if `jump` is a vector, as in `options.jump = [c1 c2 c3]`, then a 
%      non-uniform separation is specified. Lengths different than 3 are
%      acceptable.
%
% Non-uniform separations are interpreted as follows. If there are N 
% polytopes, then roughly the first third floor(N/3) are plotted with 
% sparsity c1, the second third with c2, and the other piece with c3. 
% here, options.
%
% NOTES:
%
% The idea is to do this only once, and then for plotting go directly the .mat file and plot_flowpipe_mat.
% The contents of the file "fname", which must be a two-column list of vertices separated by empty lines:
%    x11 y11
%    x12 y12
%    ...
%    x1n1 y1n1
%
%    x21 y21
%    x22 y22
%    ...
%    x2n2 y2n2
%
%    ...
%
% Each sequence of vertices defines a polygon. When an empty line is
% encountered, a new polygon is started.
%
% EXAMPLES:
%
% Export the gen data to a mat file:
%   >> gen_to_mat(...)
%
% Plot the resulting MAT file, with the standard options:
%   >> plot_fp_mat(fname, []);
%
% TODO:
%
% - Add option field to export with custom file name or format.

% =========================================================================

figure;

chunks = length(options.jump);

if chunks == 1
    for i = 1:num_polygons
        if mod(i, options.jump) == 0
            try
                if options.draw
                    h1=patch(fp{i}.x, fp{i}.y, options.color);
                    drawnow;
                    
                else
                    h1=patch(fp{i}.x, fp{i}.y, options.color);
                end
            catch
                warning('problem with "data" size. Extra check is needed.')
            end
        end
    end
else
    size_chunks = floor(num_polygons/chunks); % we may miss at most one polygon
    
    for k = 1:chunks-1
        ind_min = (k-1)*size_chunks + 1;
        ind_max = k*size_chunks;
        for i = ind_min:ind_max
            if mod(i, options.jump(k)) == 0
                patch(fp{i}.x, fp{i}.y, options.color);
            end
        end
    end
end

fprintf('The total elapsed time is %.4f seconds. \r\n',toc)

varargout = {};
if options.save
    filename_png = strrep(fname, '.mat', '.png');
    saveas(gcf, filename_png)
    
    varargout{length(varargout)+1} = filename_png;
end
%varargout{length(varargout)+1} = h1;

end % -- end of plot_sampling
