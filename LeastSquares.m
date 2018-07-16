function J = LeastSquares(htheta, y_matrix, m)
J = (1/m)*sum(sum((htheta-y_matrix).^2));
end