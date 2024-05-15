function [norm1, norm2, normInf] = NORM(x)

[n m]=size(x)
norm1=0;
norm2=0;
normInf=0;

for i=1:m
    norm1=norm1+ abs(x(i));
    if nargout > 1
        norm2= norm2 + (x(i))^2;
        if nargout > 2
            normInf= max(normInf,x(i));
        end
    end
end
if nargout > 2
    norm2= sqrt(norm2);
end


    