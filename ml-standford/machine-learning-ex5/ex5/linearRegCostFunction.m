function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the
%   cost of using theta as the parameter for linear regression to fit the
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

% h represents the prediction
h = X * theta;

% don't apply reg on where j = 1
thetaCopy = theta;
thetaCopy(1) = 0;

% Reg for the cost function
JReg = lambda/(2 * m) * sum(thetaCopy.^2);

% putting the cost function and reg together
J = sum((h-y).^2)/(2 * m) + JReg;

% j = 0 and j >= 1 is taken care of for reg because thetaCopy(1) is set to 0 
grad = (X' * (h - y))/m + (lambda/m)*thetaCopy;










% =========================================================================

grad = grad(:);

end
