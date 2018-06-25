function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

% looping through the number of clusters
for k = 1:K
  % number of points in the cluster
  num = 0;
  % vector to store features of the data points
  acc = zeros(n,1);
  % loop through the training examples
  for i = 1:m
    % if the data point is assigned to the current cluster accumulate the features
    if (idx(i) == k)
      % have to transpose the datapoint to meet the dimensions
      acc = acc + X(i, :)';
      % update num of points accordingly
      num = num + 1;
    end
  end
  % cal new location( mean of features) for current centroid 
  centroids(k, :) = (acc/num)';
end






% =============================================================


end
