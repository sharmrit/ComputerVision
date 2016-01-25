sceneImage = rgb2gray(im2double(imread('Scene3\scene3.jpg')));
scenePoints=detectSURFFeatures(sceneImage);
[sceneFeatures,scenePoints]=extractFeatures(sceneImage,scenePoints);
srcFiles = dir('Scene3\*.jpg');  % the folder in which ur images exists
for i = 1 : length(srcFiles)
    filename = strcat('Scene3\',srcFiles(i).name);
    check=strcmp(srcFiles(i).name,'scene3.jpg');
    boxImage=rgb2gray(im2double(imread(filename)));
    boxPoints=detectSURFFeatures(boxImage);
    [boxFeatures,boxPoints]=extractFeatures(boxImage,boxPoints);
    boxPairs=matchFeatures(boxFeatures,sceneFeatures,'MatchThreshold',2,'MaxRatio',0.9);
    figure;
    showMatchedFeatures(boxImage, sceneImage, boxPoints(boxPairs(:, 1), :),scenePoints(boxPairs(:, 2), :), 'montage');
end