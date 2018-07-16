function g = LeakyRELU(z)

if z>0
    g=z;
else
    g=-0.01*z;
end    

end
