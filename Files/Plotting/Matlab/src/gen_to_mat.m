function fname_mat = gen_to_mat(fname, options)
% GEN_TO_MAT Export a 2D flowpipe in .gen format into a matlab .mat file.
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
%   "varargout" - the name of the file that was written.
%
% ALGORITHM:
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
% See also: plot_flowpipe

% =========================================================================

tic

if nargin == 0    
    error('Filename not specified.');
elseif nargin == 1    % options not specified
    options.verbose = 1;
end

if ~isfield(options, 'verbose')
    options.verbose = 1;
end

if ~isfield(options, 'save')
    options.save = 1;
end

if ~isfield(options, 'jump')
    options.jump = 1;
end

if ~isfield(options, 'max_x')
    options.max_x = 20;
end

if ~isfield(options, 'max_y')
    options.max_y = 20;
end

if ~isfield(options, 'estimate_number_polygons')
    options.estimate_number_polygons = 1e3;
end

if options.verbose
    fid=fopen(fname,'rt');
    fseek(fid, 0, 'eof');
    chunksize = ftell(fid);
    fseek(fid, 0, 'bof');
    ch = fread(fid, chunksize, '*uchar');
    nol = sum(ch == sprintf('\n')); % number of lines
    fprintf('The total number of lines in the GEN file is %i. \r\n',nol);
    fclose(fid);
end

fid = fopen(fname,'rt');

num_polygons = 0;

polygons_list = cell(options.estimate_number_polygons, 1);

if fid~=-1
    X=zeros(options.max_x,1);
    Y=zeros(options.max_y,1);
    i=1;
   
    while ~feof(fid)
        tline = fgetl(fid);
       
        if (~strcmp(tline,'') && ~feof(fid))
            d = sscanf(tline,'%g');
            X(i) = d(1);
            Y(i) = d(2);
            i=i+1;

        else
            num_polygons = num_polygons + 1;
            
            clear p
            p.x = X(1:i-1); p.y = Y(1:i-1);
            
            polygons_list{num_polygons} = p;
            
            X=zeros(options.max_x,1);
            Y=zeros(options.max_y,1);
            
            i=1;
            
        end
    end
end

fname_mat = strrep(fname, '.gen', '.mat');
save(fname_mat, 'polygons_list');
fclose(fid);

fprintf('The total number of polytopes is %.4f. \n', num_polygons);
fprintf('The total elapsed time is %.4f seconds. \r\n',toc)

end    % -- end of gen_to_mat