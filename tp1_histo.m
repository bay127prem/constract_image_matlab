function [A, B] = tp1_histo(imgPath, show)
    I = imread(imgPath);
    if (ndims(I)==3) 
        I = rgb2gray(I);
    end
    
    if (show)
        figure
        imhist(I);
        figure
        imshow(I);
    end

    A = zeros(256, 1);

    for i=1:size(I, 1)
        for j=1:size(I, 2)
            A(I(i, j)+1, 1) = A(I(i, j)+1, 1) + 1;
        end
    end

    if (show)
        figure
        bar(A);
    end

    B = zeros(256, 1);
    B(1, 1) = A(1, 1);

    for i=2:256
        B(i, 1) = A(i, 1) + B(i-1, 1);
    end
    
    if (show)
        figure
        bar(B);
    end
end