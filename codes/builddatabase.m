function builddatabase( )
clc
% Generates a database of features based on the images in the db/ folder.
d = dir('database/*.jpg');
names = [];
csd128hist = [];
edges = [];
h = waitbar(0,'Plz wait Training is underprocess...!!','name','SCANNING IS IN PROGRESS');
for k = 1:size(d, 1)
    waitbar(k/size(d,1),h,['Training '  d(k).name ' of ' num2str(length(d)) ' images.']);
    names = strvcat(names, d(k).name);
    img = imread(['database/' d(k).name]);
    [hist128, edge] = calcfeatures(img); %subroutine called for feature extraction
    csd128hist = [csd128hist; hist128];
    edges = [edges; edge];
end
save features names csd128hist edges
close(h)
end
