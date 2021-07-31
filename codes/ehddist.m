function [ dist ] = ehddist( a, b, l, n, g )
% Calculates the distance measure between two EHD histograms.
% The histogram is expected to be in the order local, neighbor, global.
% Parameters:
% a - the ehd of the first image
% b - the ehd of the second image
% l - the local weight
% n - the neighbor weight
% g - the global weight

dist = 0;

for i = 1:80
    dist = dist + l*abs(a(i) - b(i));
end

for i = 81:145
    dist = dist + n*abs(a(i) - b(i));
end

for i = 146:150
    dist = dist + g*abs(a(i) - b(i));
end

end
