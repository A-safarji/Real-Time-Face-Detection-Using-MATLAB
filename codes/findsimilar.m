function n = findsimilar(img)
clc
similarities = [];
load features
[csd128 ,edge] = calcfeatures(img);
for k = 1:size(names, 1)
    b = pdist([csd128; csd128hist(k, :)]);
    d = ehddist(edge, edges(k, :), 1, 1, 5);
    similarities = [similarities; b d];
end
for k = 1:size(similarities, 2)
    m = mean(similarities(:, k));
    s = std(similarities(:, k));
    similarities(:, k) = (similarities(:, k) - m) ./ s;   
end
similarities(:, 2) = 0.8*similarities(:, 2);
sims = sum(similarities');
[~, I] = sort(sims);
n = names(I(1), :);
end