function [ hist ] = colordescriptor( hmmdimage, map )
[x y z] = size(hmmdimage);
hist = zeros([1 size(map, 1)]);
for i = 1:x
    for j = 1:y
        gotten = zeros([size(map, 1) 1]);

        for i2 = 1:8
            for j2 = 1:8
                if (i + i2 <= x && j + j2 <= y)
                    gotten(hmmdimage(i+i2, j+j2) + 1) = 1;
                end
            end
        end
        for g = 1:size(map,1)
            if (gotten(g) == 1)
                hist(g) = hist(g) + 1;
            end
        end
    end
end
end
