srcFiles = dir('Scene2\*.jpg');  % the folder in which ur images exists
for i = 1 : length(srcFiles)
    filename = strcat('Scene2\',srcFiles(i).name);
    I = im2double(imread(filename));
    img=I;
    SURFPoints=detectSURFFeatures(img);
    [SURFFeatures,SURFPoints]=extractFeatures(img,SURFPoints);
    figure;imshow(img);
    hold on;
    plot(selectStrongest(SURFPoints,100));
end