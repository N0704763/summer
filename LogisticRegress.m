function J = LogisticRegress(htheta, y_matrix, m)

J = (1/m).*(-sum(sum(y_matrix.*log(htheta))) - sum(sum((1-y_matrix).*(log(1-htheta)))));

end