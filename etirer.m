function [I, maxI, minI, michelson, rms, newMichelson, newRms]=etirer(imgPath, show)
    I = imread(imgPath);
    if (ndims(I)==3) 
        I = rgb2gray(I);
    end
    
    minI = min(I(:));
    maxI = max(I(:));
    
    michelson = (double(maxI - minI) / double(maxI + minI));
    rms = sqrt((1/numel(I)) * sum((I - mean2(I)).^2, 'all'));
    
    if (show) 
        subplot(221)
        imshow(I);
        subplot(222);
        imhist(I);
        title('Original')
    end
    
    for i = 1:size(I, 1)
        for j = 1:size(I, 2)
            I(i,j) = uint8((I(i,j)-minI) * (255 / (maxI-minI)));
        end
    end
    
    newMichelson = (255 - 0) / (255 + 0); %% parce que c'est un etirement
    newRms = sqrt((1/numel(I)) * sum((I - mean2(I)).^2, 'all'));
    
    if (show) 
        subplot(223)
        imshow(I);
        subplot(224);
        imhist(I);
        title('Etiré')
    end
    
    [folder, baseFileNameNoExt, extension] = fileparts(imgPath);
    imwrite(I, baseFileNameNoExt + "_etiré" + extension)
end