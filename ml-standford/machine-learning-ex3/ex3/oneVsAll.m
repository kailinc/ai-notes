function [all_theta] = oneVsAll(X, y, num_labels, lambda)
%ONEVSALL trains multiple logistic regression classifiers and returns all
%the classifiers in a matrix all_theta, where the i-th row of all_theta
%corresponds to the classifier for label i
%   [all_theta] = ONEVSALL(X, y, num_labels, lambda) trains num_labels
%   logistic regression classifiers and returns each of these classifiers
%   in a matrix all_theta, where the i-th row of all_theta corresponds
%   to the classifier for label i

% Some useful variables
m = size(X, 1);
n = size(X, 2);

% You need to return the following variables correctly
all_theta = zeros(num_labels, n + 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the following code to train num_labels
%               logistic regression classifiers with regularization
%               parameter lambda.
%
% Hint: theta(:) will return a column vector.
%
% Hint: You can use y == c to obtain a vector of 1's and 0's that tell you
%       whether the ground truth is true/false for this class.
%
% Note: For this assignment, we recommend using fmincg to optimize the cost
%       function. It is okay to use a for-loop (for c = 1:num_labels) to
%       loop over the different classes.
%
%       fmincg works similarly to fminunc, but is more efficient when we
%       are dealing with large number of parameters.
%
% Example Code for fmincg:
%
%     % Set Initial theta
%     initial_theta = zeros(n + 1, 1);
%
%     % Set options for fminunc
%     options = optimset('GradObj', 'on', 'MaxIter', 50);
%
%     % Run fmincg to obtain the optimal theta
%     % This function will return theta and the cost
%     [theta] = ...
%         fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)), ...
%                 initial_theta, options);
%

% make an initial theta for each category (1-10)
initial_theta = zeros(n + 1, 1);

% options for fmincg
% let it return the gradients, and the max iteration for applying the cost function is 50
options = optimset('GradObj', 'on', 'MaxIter', 50);

% loop through each category
for i = 1:num_labels,
  % use fmincg to train classifier for each category
  % pass in X, which is picture
  % (y == i), is a vector for each category, returns a vector with 1 in the catgory, 0 in the rest of the category
  % (y == i) is a sugar sytanx
  % pass in lambda, initial_theta, which is vector of 0
  % pass in options for fmincg
  % trains the classifier for each category at a time with 400 img
  % each row represents the learned logistic regression parameter
  % another works each row represents the learned theta for the category
  % this way the ai is making the best theta for prediciting img to be of that category 
  all_theta(i, :) = fmincg(@(t)(lrCostFunction(t, X, (y == i), lambda)), initial_theta, options);
end
all_theta










% =========================================================================


end
