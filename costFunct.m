function [J, grad, htheta] = costFunct(X, y_matrix, nntheta, lambda,funct, functgrad,hidden_layers,t_rows,t_cols,ts, CostFunction)
%cost function performs L2 regularization
%reshape the first theta
theta{1} = reshape(nntheta(1:t_rows(1)* t_cols(1)), [t_rows(1), t_cols(1)]);
%reshape the remaining thetas
for i=2:ts
%[sum(t_rows(1:i-1).*t_cols(1:i-1))+1,sum(t_rows(1:i).*t_cols(1:i)),i]
size(nntheta(sum(t_rows(1:i-1).*t_cols(1:i-1))+1:sum(sum(t_rows(1:i-1).*t_cols(1:i-1)) ...
+(t_rows(i)* t_cols(i)))));
%[t_rows(i), t_cols(i),t_rows(i)*t_cols(i)]
    theta{i} = reshape(nntheta(sum(t_rows(1:i-1).*t_cols(1:i-1))+1:sum(sum(t_rows(1:i-1).*t_cols(1:i-1)) ...
    +(t_rows(i)* t_cols(i)))), [t_rows(i), t_cols(i)]);

end

%feedforward

[htheta,a,z] = feedforward(X,theta,funct,ts);

m =  size(X,1);   
%(87360x26)*(
J = CostFunction(htheta, y_matrix, m);
    
    [b, ts] = size(theta);
total = 0;
    for i = 1:ts
        temp = theta{i};
        tempsum = sum(sum(temp.^2));
        total = total+tempsum;
    end
    
    reg = (lambda/m).*total;
    
    J = J+reg;
%back prop

[ar,ac] = size(a);

% %Backprop
% d{ac+1} = htheta-y_matrix;
% d{ac} = d{ac+1}*theta{ac-1};
% for i = 1:ac-2
% d{ac-i} = d{ac-i+1}(:,2:end)*theta{ac-i};
% end

%blabla = 0


d{ac+1} = htheta - y_matrix; %error in the end
d{ac} =  (d{ac+1}*theta{ac}).*[ones(size(z{ac},1),1) functgrad(z{ac})];
for i = 1:ac-2
d{ac-i} =  (d{ac-i+1}(:,2:end)*theta{ac-i}).* [ones(size(z{ac-i},1),1) functgrad(z{ac-i})];
end

for i = 1:ac-1
    D{i} = d{i+1}(:,2:end)'*a{i};
end
D{ac} = d{ac+1}'*a{ac};
for i=1:ac
Thetagrad{i} = (1/m) * D{i};
end

%unroll the grads and ts
grad = [];
nntheta = [];
for i = 1:ac
grad = [grad; Thetagrad{i}(:)];
nntheta = [nntheta; theta{i}(:)];
end

end