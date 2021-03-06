%% This program creates parameters for training and testing, not those
%% for the network, which are set in setup.met.m

%% data configuration
% data input dimension: size * size * num_channels
size_patch = 16;
num_channels = 6;

%% training configuration
% number of epochs
num_epochs = 15;

% number of batches in one epoch
num_batches = 10;

% number of repeatance of given labels in one batch in training set
num_reps = 2495;

% labels in training set
train_known_labels = [ 1 2 3 4 5 ];

%% testing configuration

% number of inputs of given labels in testing set
test_num_reps = 100;

% maximal number of repeatance of given labels in testing set
% test_num_reserve + size_epoch should not exceed the size of any classes
test_num_reserve = 24927;

% labels in testing set
test_known_labels = [ 1 2 3 4 5 ];
test_names_labels = {'city' 'field' 'forest' 'grass' 'street'};

% number of labels in testing set
test_num_labels = length(test_known_labels);

% number of all labels
num_all_labels = 5;

% do test after the number of epochs
test_cycle = 1;

%% configuration of image labeling
% the resolution of the final labeled image
% 1 means to label and print every pixel
stride_print = 4;

%% quick check configuration
%quick_check=0
if (exist('quick_check', 'var') && quick_check == 1)
    num_epochs = 1;
    num_batches = 1;
    num_reps = 1;
    test_num_reps = 1;
    test_num_reserve = 1;
    stride_print = 100;
end

%% Don't change anything below unless you know what you are doing

% number of labels in traing set
num_labels = length(train_known_labels);

% calculate mini-batch size for trainging set
size_batch = num_reps * num_labels;

% calculate mini-batch size for testing set
test_size_batch = test_num_reps * test_num_labels;

% calculate epoch size
size_epoch = num_reps * num_batches;

% number of tests will be done over epochs
test_num = ceil(num_epochs / test_cycle) + 1;

%save 'data\params.mat'