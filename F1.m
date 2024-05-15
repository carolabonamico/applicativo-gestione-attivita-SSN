function z = F1(X)
    x = X(1);
    y = X(2);
    
    z = (x^2 + 3*y^2)*exp(1 - x^2 - y^2);
end