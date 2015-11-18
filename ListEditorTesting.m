%% List Editor Testing
% testing the GUI for the list editor

%% Startup
DIR1 = './Text Files';
DIR2 = genpath('./util');
addpath(DIR1,DIR2);

% feature('DefaultCharacterSet','UTF-8');
feature('DefaultCharacterSet','Shift_JIS');

%% run the program
f = EditListInterface(1,DIR1);

%% Cleanup
uiwait(f);
rmpath(DIR1,DIR2);