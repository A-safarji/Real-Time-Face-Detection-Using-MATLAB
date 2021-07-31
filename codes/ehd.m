function H = ehd(Img, Threshold)  
[oldx ,oldy, z] = size(Img);
x = oldx/4;
y = oldy/4;
if mod(x, 2) ~= 0
    x = x + 1;
end
if mod(y, 2) ~= 0
    y = y + 1;
end
Img2 = uint8(zeros([x*4 y*4 z]));
Img2(1:oldx, 1:oldy, 1:z) = Img(1:oldx, 1:oldy, 1:z);
Img = Img2;
Image = rgb2gray(im2double(Img));
H = [];
 HorizontalMask = [1 1 1;0 0 0;-1 -1 -1];
 VerticalMask   = [1 0 -1;1 0 -1;1 0 -1];
 DiagonalMask   = [0 1 1;-1 0 1;-1 -1 0];
 AntiDiagMask   = [1 1 0;1 0 -1;0 -1 -1];
HImage = imfilter(Image, HorizontalMask,'replicate');
VImage = imfilter(Image, VerticalMask,'replicate');
DImage = imfilter(Image, DiagonalMask,'replicate');
AImage = imfilter(Image, AntiDiagMask,'replicate');
%NImage = imfilter(Image, NonDirectionalMask,'replicate');
% Determine the size of each subimage dynamically
m = size(Image, 1)/4; % Number of rows per subimage.
n = size(Image, 2)/4; % Number of columns per subimage.
column = 1;row = 1;counter = 1; % Variable initialization

for k = 1:16 % Loop through every subimage
   if counter > 4
       column = 1;
       row = row + m;
       counter = 1;
   end
   subImgH(k).img = subim(HImage, m, n, row, column);  % Get subimage for H
   subImgV(k).img = subim(VImage, m, n, row, column);  % Get subimage for V
   subImgD(k).img = subim(DImage, m, n, row, column);  % Get subimage for D
   subImgA(k).img = subim(AImage, m, n, row, column);  % Get subimage for A
  % subImgN(i).img = subim(NImage, m, n, row, column);  % Get subimage for A
   column = column + n;
   counter = counter + 1;
end

% To verify subimages can use the following code:
% figure;
% for i=1:16
%    hold on
%    subplot(4,4,i)
%    imshow(subImgA(i).img,[])
% end
% Compute the blocks and histograms
try
    for k = 1:16 % All subimages
        HLocal(k,1:5) = 0;
        row = 1;
        column = 1;
        for m = 1:ceil(size(subImgH(k).img,1)*size(subImgH(k).img,2)/4)  % All 2x2 blocks
            if column > size(subImgH(k).img,2)
                column = 1;
                row = row + 2;
            end
            % Determine the max edge of the averages in a 2x2 area
            [M, I] = max([sum(sum(abs(subImgH(k).img(row:row+1,column:column+1))))/4 ...
                sum(sum(abs(subImgV(k).img(row:row+1,column:column+1))))/4 ...
                sum(sum(abs(subImgD(k).img(row:row+1,column:column+1))))/4 ...
                sum(sum(abs(subImgA(k).img(row:row+1,column:column+1))))/4 ...                
                Threshold]);
            %sum(sum(abs(subImgN(i).img(row:row+1,column:column+1))))/4 ...
            
            IndexedSub(k).img((row + 1)/2,(column + 1)/2) = I; %
          %  if I ~= 5
                HLocal(k,I) = HLocal(k,I) + 1;
               % IndexedSub(i).img((row + 1)/2,(column + 1)/2) = I; % Used for displaying edges
         %   end
            column = column + 2;
        end
        HLocal(k,:) = HLocal(k,:)./(ceil(size(subImgH(k).img,1)*size(subImgH(k).img,2)/4));
    end
catch
    error('Issue with subimages having odd rows and columns, block error.')
end

%Uncomment to save or display the edge images used in the report.
% IS = [IndexedSub(1).img IndexedSub(2).img IndexedSub(3).img IndexedSub(4).img; ...
%     IndexedSub(5).img IndexedSub(6).img IndexedSub(7).img IndexedSub(8).img; ...
%     IndexedSub(9).img IndexedSub(10).img IndexedSub(11).img IndexedSub(12).img; ...
%     IndexedSub(13).img IndexedSub(14).img IndexedSub(15).img IndexedSub(16).img];


% mymap = [1 0 0; 0 1 0; 0 0 1; 1 1 0; 1 1 1];
% figure; imshow(IS, mymap);
%imwrite(ind2rgb(IS,mymap),strcat('Threshold',num2str(Threshold),'\', name));

% Create the main edge histogram to return.
for k=1:16
    H = cat(2,H,HLocal(k,:));
end
% Add vertical groups
for k=1:4
    H = cat(2, H, sum(HLocal(k:4:16,:))./4);
end
% Add Horizontal Groups
for k=0:3
    H = cat(2, H, sum(HLocal(k*4+1:k*4+4,:))./4);
end
% Add neighbor groups
H = cat(2, H, sum(HLocal([1 2 5 6],:))./4);
H = cat(2, H, sum(HLocal([3 4 7 8],:))./4);
H = cat(2, H, sum(HLocal([9 10 13 14],:))./4);
H = cat(2, H, sum(HLocal([11 12 15 16],:))./4);
H = cat(2, H, sum(HLocal([6 7 10 11],:))./4);
% Add global group
H = cat(2, H, sum(HLocal(:,:))./16);
% figure; bar (H)








function s = subim(f, m, n, rx, cy)
%SUBIM Extracts a subimage, s, from a given image, f.
%   The subimage is of size m-by-n, and the coordinates of its top, left
%   corner are (rx, cy).

s = zeros(m, n);
rowhigh = rx + m - 1;
colhigh = cy + n - 1;
xcount = 0;
for r = rx:rowhigh
    xcount = xcount + 1;
    ycount = 0;
    for c = cy:colhigh
        ycount = ycount + 1;
        s(xcount, ycount) = f(r, c);
    end
end