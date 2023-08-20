function [b,c,d,e] = statsMath(a)
    b = sum(a(2,:));
    c = mean(a(:));
    d = std(a(:));
    e = var(a(:));
end