function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

% h = prediction equation
% use sigmoid() as a short hand instead of doing 1/(1 + e^-(X*theta))
h = sigmoid(X*theta);

% J is the cost function simplified version that incorporate cost function for
% y = 0 and y = 1
J = (((-y)' * log(h)) - ((1 - y)' * log(1 - h)))/m;

% grad is gradient descent
% will tell how it convery to global min
% will give us the right "slopes" for the sigmoid function to predict/classify items
grad = (X'*(h - y))/m;



% =============================================================

end
