%% Function Name: img_biarize(img, threshold)
% Object: Image Binarization
% Input: img(the image should be grayscale), threshold(for binarization)
% Output: the binarized image
% Date: 2017/2/8

%% Main Function

function y = img_binarize(img, threshold)
[size_x, size_y] = size(img);
img_bin = img;
for i = 1 : 1 : size_x
    for j = 1 : 1 : size_y
          if img(i,j) > threshold
             img_bin(i,j)=256;
          else
             img_bin(i,j)=1;
          end
    end
end

y = img_bin;

end