function [A, B] = histo(I)

    A = zeros(256, 1);

    for i=1:size(I, 1)
        for j=1:size(I, 2)
            A(I(i, j)+1, 1) = A(I(i, j)+1, 1) + 1;
        end
    end
    
    B = zeros(256, 1);
    B(1, 1) = A(1, 1);

    for i=2:256
        B(i, 1) = A(i, 1) + B(i-1, 1);
    end

end