function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and
%   sigma. You should complete this function to return the optimal C and
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example,
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using
%        mean(double(predictions ~= yval))
%
% values for C
C_vec = [0.01 0.03 0.1 0.3 1 3 10 30]';

% values for sigma
sigma_vec = [0.01 0.03 0.1 0.3 1 3 10 30]';

% initialize arbitary error number for checking cv error
minError = 1000;

% loop vector of C values
for c = 1:length(C_vec),

  % get cur C value
  curC = C_vec(c);

  % loop vector of Sigma values
  for s = 1:length(sigma_vec),
    % get cur sigma value
    curS = sigma_vec(s);

    % get a svm + gaussiankernel model
    model = svmTrain(X, y, curC, @(x1, x2) gaussianKernel(x1, x2, curS));

    % get predictions of the model of the Xvals
    predictions = svmPredict(model, Xval);

    % error of the model
    error = mean(double(predictions ~= yval));

    % if we get lower error than the min, set c, sigma, minError to the current values
    if (error < minError),
      % just for us to know the alg is working correctly 
      fprintf('\nPrediction error is %f with C %f and sigma %f', error, curC, curS);
      minError = error;
      C = curC;
      sigma = curS;
    end
  end
end





% =========================================================================

end
