addpath toolbox/;
addpath toolbox/minFunc/;

% Load feature file
load feats/train.mat;

numCategories = 5;  % 5 emotion categories

% Parameters
trainParams.lambda = 0.1;          % Regularization parameter
trainParams.maxIter = 500;         % Maximum number of iterations
trainParams.f = @tanh;             % Function to use in the neural network activations
trainParams.f_prime = @tanh_prime; % Derivative of f

% Initialize actual weights
disp('Initializing parameters');
[ theta, decodeInfo ] = initializeParameters(size(X, 1), numCategories);
trainParams.decodeInfo = decodeInfo;

dataToUse.feats = X;
dataToUse.categories = Y;
theta = trainLBFGS(trainParams, dataToUse, theta);

save('params.mat', 'theta', 'decodeInfo');