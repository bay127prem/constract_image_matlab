function [I, maxI, minI, michelson, rms, newMichelson, newRms]=egaliser(imgPath, show)
    I = imread(imgPath);
    if (ndims(I)==3) 
        I = rgb2gray(I);
    end
    
    minI = min(I(:));
    maxI = max(I(:));
    
    michelson = (double(maxI - minI) / double(maxI + minI));
    rms = sqrt((1/numel(I)) * sum((I - mean2(I)).^2, 'all'));
    [h, H] = histo(I);

    if (show) 
        subplot(231)
        imshow(I);
        subplot(232);
        bar(h)
        title('Original')
        subplot(233)
        bar(H)
    end
    
    for i = 1:size(I, 1)
        for j = 1:size(I, 2)
            I(i,j) = (255 / numel(I)) * H(I(i, j) + 1);
        end
    end
    
    minI = min(I(:));
    maxI = max(I(:));
    
    newMichelson = (double(maxI - minI) / double(maxI + minI));
    newRms = sqrt((1/numel(I)) * sum((I - mean2(I)).^2, 'all'));
    
    [h, H] = histo(I);

    if (show) 
        subplot(234)
        imshow(I);
        subplot(235);
        bar(h)
        title('Etiré')
        subplot(236)
        bar(H)
    end
    
    [folder, baseFileNameNoExt, extension] = fileparts(imgPath);
    imwrite(I, baseFileNameNoExt + "_egalisé" + extension)
end