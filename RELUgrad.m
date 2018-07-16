function g= RELUgrad(z)
g=zeros(size(z));
m = length(z);
for i = 1:m
    if z(i)>0
    g(i) = 1;
    end
end
end
