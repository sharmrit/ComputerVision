srcFiles = dir('Scene1\*.bmp');  % the folder in which ur images exists
for i = 1 : length(srcFiles)
    filename = strcat('Scene1\',srcFiles(i).name);
    I = im2double(imread(filename));
    img=rgb2gray(I);
    SURFPoints=detectSURFFeatures(img);
    [SURFFeatures,SURFPoints]=extractFeatures(img,SURFPoints);
    figure;imshow(img);
    hold on;
    plot(selectStrongest(SURFPoints,100));
end