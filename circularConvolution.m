function [y] = circularConvolution(x,h)
    [rows1, columns1] = size(x);
    [rows2, columns2] = size(h);
    
    % last index of y(n)
    lastIndex = columns1 + columns2 - 1;
    y = zeros(1,columns2);
    for n = 1:lastIndex
        temp = 0;
        for k = 1:columns1
            if n - k  >= 0 && n - k + 1<= columns2
                temp = temp + x(k) * h(n-k+1);
            end
        end
        idx = 1 + rem(n - 1,columns2);
        y(idx) = y(idx) + temp;
    end
end