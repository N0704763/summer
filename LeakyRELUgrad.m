function g = LeakyRELUgrad(z)
g = zeros(size(z));
m = length(z);
for i = 1:m
if z(i)>0
    g(i)=1;
elseif z(i)==0
    g(i)=1;
else
    g(i)=0.01;
end

end