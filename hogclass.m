fd = imageSet('verific\resized','recursive');
dd = imageSet('images\dataset','recursive');
num = dd.Count + fd.Count;
trainingFeatures = zeros(num,4680);
count = 1;
for i = 1:fd.Count
    img = readimage(fd, i);
%     img = rgb2gray(img);
%     img = imbinarize(img);
    trainingFeatures(i,:) = extractHOGFeatures(img);
%     imshow(img);
    count = count + 1;
end
for i = 1:dd.Count
    img = readimage(dd, i);
%     img = rgb2gray(img);
%     img = imbinarize(img);
%     imshow(img);
    trainingFeatures(count,:) = extractHOGFeatures(img);
    count = count + 1;
end
trainingLabels = zeros(num,1);
for i = 1:num
    if i < 22
        trainingLabels(i) = 1;
    end
end
save('classifier.mat','trainingFeatures','trainingLabels');
% classifier = fitcecoc(trainingFeatures, trainingLabels);
% q = imread('images\att_faces\s1\1.pgm');
% qf = extractHOGFeatures(q);
% pl = predict(classifier,qf);
% disp(pl);