function [ image, table ] = rgb2quanthmmd( rgbimage, numbins )
if numbins == 32
    table = hmmdquanttable32();
    image = rgb2ind(rgb2hmmd(rgbimage)/255, table/255);
elseif numbins == 128
    table = hmmdquanttable128();
    image = rgb2ind(rgb2hmmd(rgbimage)/255, table/255);
else
    error('numbins must be either 32 or 128');
end

end
