function out = mapFeature(X1, X2)
% MAPFEATURE Feature mapping function to polynomial features
%
%   MAPFEATURE(X1, X2) maps the two input features
%   to quadratic features used in the regularization exercise.
%
%   Returns a new feature array with more features, comprising of
%   X1, X2, X1.^2, X2.^2, X1*X2, X1*X2.^2, etc.. in vector form
%
%   Inputs X1, X2 must be the same size
%   X1 is the vector with units of first feature
%   X2 is the vector with units of second feature

degree = 6;
% out is a vector
out = ones(size(X1(:,1)));
for i = 1:degree
    for j = 0:i
        % highly refactored code to calculate complicated polynomial term for each element in vector
        out(:, end+1) = (X1.^(i-j)).*(X2.^j);
    end
end

end
