function p = predict(theta, X)
%PREDICT Predict whether the label is 0 or 1 using learned logistic
%regression parameters theta
%   p = PREDICT(theta, X) computes the predictions for X using a
%   threshold at 0.5 (i.e., if sigmoid(theta'*x) >= 0.5, predict 1)
% used to predict a large set of data 
m = size(X, 1); % Number of training examples

% You need to return the following variables correctly
p = zeros(m, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters.
%               You should set p to a vector of 0's and 1's
%

% this gets the probability x is admitted based on X* theta
% x * theta is the formula to classify the students
prob = sigmoid(X*theta)

% finds the position in X where the probability is greater than 0.5
pos = find(prob >= 0.5);

% sets those position in p to be 1
p(pos) = 1;

% doesn't need to set position in p to be 0, because initialized as 0

pause;




% =========================================================================


end
