% Shall fix error: An unexpected error occurred during CUDA execution. The
% CUDA error was: cannot set while device is active in this process.
a = gpuArray(1); 
clear a;

% Fix Matlab bug: “dlopen: cannot load any more object with static TLS”
ones(10) * ones(10);

%% ASTRA toolbox
addpath( genpath( '/usr/local/astra/matlab/' ) );
% ASTRA toolbox sample scripts
% When using version from sourceforge
%addpath( [getenv('HOME') '/Software/ASTRA/astra-1.5/samples/' ] );
% When using git version
addpath( [getenv('HOME') '/git/astra-toolbox/samples/matlab' ] );

% SPOT
% new astra version should include ASTRA
%addpath( [getenv('HOME') '/Software/ASTRA/spot-1.2/' ] );

%% NiftyRec toolbox
addpath('/usr/local/niftyrec/matlab/');

%% SPAMS
%matlab $* -singleCompThread -r "addpath('./build/'); addpath('./test_release'); setenv('MKL_NUM_THREADS','1'); setenv('MKL_SERIAL','YES');"
addpath( [ getenv('HOME') '/Software/SPAMS/spams-matlab/build/' ] ) ;
addpath( [ getenv('HOME') '/Software/SPAMS/spams-matlab/test_release/' ] ); 
addpath( [ getenv('HOME') '/Software/SPAMS/spams-matlab/data/' ] ); 
setenv( 'MKL_NUM_THREADS', '1'); 
setenv( 'MKL_SERIAL', 'YES');
setenv( 'MKL_DYNAMIC', 'NO');

%% Aedes
addpath( [getenv('HOME') '/Software/aedes' ] );
addpath( [getenv('HOME') '/Software/aedes/misclib' ] );

%% FreeSurfer
fshome = getenv('FREESURFER_HOME');
fsmatlab = sprintf('%s/matlab',fshome);
if (exist(fsmatlab,'dir') == 7)
    path(path,fsmatlab);
end
clear fshome fsmatlab;

%% FreeSurfer FAST 
fsfasthome = getenv('FSFAST_HOME');
fsfasttoolbox = sprintf('%s/toolbox',fsfasthome);
if (exist(fsfasttoolbox,'dir') == 7)
    path(path,fsfasttoolbox);
end
clear fsfasthome fsfasttoolbox;

%% Set default color map to grayscale instead of jet
set(groot,'DefaultFigureColormap',gray)
close all;

%% DTI code
addpath( genpath( [getenv('HOME') '/Software/DTIcode/dticode/matlab'] ) );

%% Scripts and functions
addpath( genpath( [getenv('HOME') '/matlab'] ) );

%%  Increase MATLAB figure performance by using OpenGL rendering
% unsure if it works, try next time when performance is low
% set(0, 'DefaultFigureRenderer', 'OpenGL');