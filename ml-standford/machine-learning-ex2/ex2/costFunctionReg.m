function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters.

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

% predicted category
h = sigmoid(X*theta);

% reg for cost function
% applies it to theta_2 and onwards but not theta_1
regCost = sum(theta(2:end) .^ 2) * lambda / (2 * m);

% regularizaed cost
J = (((-y)' * log(h)) - ((1 - y)' * log(1 - h)))/m + regCost;

% setup for applying reg to all theta except for theta_1
thetaCopy = theta;
thetaCopy(1) = 0;

% reg term for gradient
regGrad = (thetaCopy * lambda)/m;

% regularized gradient
grad = (X'*(h - y))/m + regGrad;





% =============================================================

end
