function [ hist128, edge ] = calcfeatures( img )
[hmmd, map] = rgb2quanthmmd(img, 128);
hist128 = colordescriptor(hmmd, map);
edge = ehd(img, 0.10);
end
