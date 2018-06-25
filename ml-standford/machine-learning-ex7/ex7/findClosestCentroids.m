function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% number of trainning examples
m = size(X,1);
% looping through the training examples
for i = 1:m
  % placeholder for min distance
  minDist = 1000;
  % loop through centroids
  for k = 1:K
    % get error of the cur point and a centroid
    error = X(i, :) - centroids(k, :);
    dist = error * error';
    % assign x to the closest centroid
    if dist < minDist
      minDist = dist;
      idx(i) = k;
    end
  end
end


% tried to vectorize this 
% didn't work because have to make xMatrix to be [x;x;x;x] according to num of centroids
% don't know how to do this in octave
% m = size(X,1);
% % looping through the training examples
% for i = 1:m
%   % loop through centroids
%   x = X(i, :);
%   xMatrix = [ones(size(centroids),2)]
%   errorMatrix = (xMatrix .- centroids).^2;
%   errors = sum(errorMatrix, 2);
%   [min_val, min_index] = min(errors, [], 1);
%   idx(i) = min_index;
% end




% =============================================================

end
