function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

% steps 1: find where admitted/not admitted
% steps 2: plot the data points

% y == 1 means admitted
% y == 0 means not admitted

% gets the index of where y == 1 (y is vector)
pos = find(y == 1);
% gets the index of where y == 0 (y is vector)
neg = find(y == 0);

% plots the admitted
% uses X(pos, 1) to get the exam1 score of addmited students
% uses X(pos, 2) to get the exam2 score of addmited students
% marker is +
% LineWidth is 2
% MarkerSize is set to 7
plot(X(pos,1), X(pos, 2), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
plot(X(neg,1), X(neg, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);











% =========================================================================



hold off;

end
