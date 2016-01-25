sceneImage = im2double(imread('Scene2\scene2.jpg'));
scenePoints=detectSURFFeatures(sceneImage);
[sceneFeatures,scenePoints]=extractFeatures(sceneImage,scenePoints);
srcFiles = dir('Scene2\*.jpg');  % the folder in which ur images exists
for i = 1 : length(srcFiles)
    filename = strcat('Scene2\',srcFiles(i).name);
    boxImage=im2double(imread(filename));
    boxPoints=detectSURFFeatures(boxImage);
    [boxFeatures,boxPoints]=extractFeatures(boxImage,boxPoints);
   %% boxPairs=matchFeatures(boxFeatures,sceneFeatures);
    boxPairs=matchFeatures(boxFeatures,sceneFeatures,'MatchThreshold',2,'MaxRatio',0.9);
    figure;
    showMatchedFeatures(boxImage, sceneImage, boxPoints(boxPairs(:, 1), :),scenePoints(boxPairs(:, 2), :), 'montage');
end