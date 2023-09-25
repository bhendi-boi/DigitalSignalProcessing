function [y, nForPlot] = convolution(x, xStart, h, hStart)
    [rows1, columns1] = size(x);
    [rows2, columns2] = size(h);

    % last index of y(n) in MATLAB representation
    lastIndex = columns1 + columns2 - 1;
    y = zeros(1, lastIndex);

    for n = 1:lastIndex

        temp = 0;

        for k = 1:columns1

            if n - k >= 0 && n - k + 1 <= columns2
                temp = temp + x(k) * h(n - k + 1);
            end

        end

        y(n) = temp;
    end

    startIndex = xStart + hStart;
    nForPlot = startIndex:1:startIndex + lastIndex -1;
end
