function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%
% first layer, gets the inputs
% have to add a bias input node with this syntax
a1 = [ones(m, 1) X];

% second layer (hidden layer)
%  a1 x Theta1 (pre-exisiting) to get z2
% have to tranpose Theta1 to get dimensions to satisfy for multiplication
z2 = a1*Theta1';
% activation on z2
% this syntax will add a bias node for the next layer
% ones(...) will create a matrix of the size of z2 with an extra row for the bias node with default value of 1
a2 = [ones(size(z2, 1), 1) sigmoid(z2)];

% Third layer
%  a1 x Theta1 (pre-exisiting) to get z2
% have to tranpose Theta1 to get dimensions to satisfy for multiplication
z3 = a2*Theta2';
% activation on z3
a3 = sigmoid(z3);

% this is the prediction part, select the max prob for each category to the img
[p_max, p] = max(a3, [], 2);

p_max
p




% =========================================================================


end
