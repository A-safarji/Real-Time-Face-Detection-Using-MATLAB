function [ output ] = rgb2hmmd( input )
% returns hue, diff, sum

[x y z] = size(input);
output = zeros(size(input));

for k = 1:x
    for m = 1:y
        a = zeros([1 3]);
        a(:) = input(k, m, :);
        r = a(1); g = a(2); b = a(3);
        themax = max([r g b]);
        themin = min([r g b]);
        if (themax == themin)
            hue = 0;
        elseif (themax == r && g >= b)
            hue = 60 * (g -b ) / (themax - themin);
        elseif (themax == r && g < b)
            hue = 360 + 60 * (g - b) / (themax - themin);
        elseif (g == themax)
            hue = 60 * (2.0 + (b - r) / (themax - themin));
        else
            hue = 60 * (4.0 + (r - g) / (themax - themin));
        end
        
        diff = themax - themin;
        sum = (themax + themin) / 2;
        
        output(k, m, 1) = hue;
        output(k, m, 2) = diff;
        output(k, m, 3) = sum;
    end
end

end
