function [htheta,a,z] = feedforward(X,theta,funct,ts)

%X is the input vector where each row is a feature vector
%theta is a cell array where each entry is a matrix that is theta1, theta2, etc
%nodes is a vector where each entry corrosponds to the number of nodes in
%each subsequent hidden layer
%class is the number of classes and hence the number of nodes in the ouput
%layer



%run the first layer
[r,c] = size(X);
a{1} = [ones(r, 1) X]; %(87360x785);
z{2} = (a{1}*theta{1}'); %*(4x785)*(785x87360) = 4x87360;

z{1} = [];

%run the rest of the layers and store to cell array
for i = 2:ts

a{i} = [ones(size(z{2},1),1) funct(z{2})];
    %[size(theta{i-1}), size(a{i-1}')]
z{i+1} = (a{i}*theta{i}');
    %[r,c] = size(z{i});
    %a{i} = [ones(r, 1) funct(z{i})];
end

% a1 = [ones(r,1) X];
% z2 = (a1*theta{1}');
% a2 = [ones(size(z2,1),1) sigmoid(z2)];
% z3 = (a2*theta{2}');
% h3theta = sigmoid(z3);

%a3 = [ones(size(z3,1),1) sigmoid(z3)];
%h3_theta = sigmoid(a3*theta{3}');

%z{ts+1} = (theta{ts}*a{ts}')';
%store result of the last layer to htheta
%[h,zs] = size(z);
%[r,c] = size(z{ts});
htheta = funct(a{ts}*theta{ts}');

end
