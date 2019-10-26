query = "/home/pedro/Documents/MATLAB/PL1/data/mi_data/query.bmp";
%###################################################################################
target1 = "/home/pedro/Documents/MATLAB/PL1/data/mi_data/target1.bmp";
target2 = "/home/pedro/Documents/MATLAB/PL1/data/mi_data/target2.bmp";
target3 = "/home/pedro/Documents/MATLAB/PL1/data/mi_data/target3.bmp";
target4 = "/home/pedro/Documents/MATLAB/PL1/data/mi_data/target4.bmp";
%###################################################################################
target_inverted = "/home/pedro/Documents/MATLAB/PL1/data/mi_data/target_inverted.bmp";
target_lightning_contrast= "/home/pedro/Documents/MATLAB/PL1/data/mi_data/target_lightning_contrast.bmp";
target_noise = "/home/pedro/Documents/MATLAB/PL1/data/mi_data/target_noise.bmp";
target_original =  "/home/pedro/Documents/MATLAB/PL1/data/mi_data/target_original.bmp";
%###################################################################################

%Clear console
clc

% UNCOMENT TO CALC FOR THE FIRST TIME!!!!

query = imread(query);
[query_width, query_height] = size(query);
step = 15;

q = imread(target_inverted);
if exist("mutual_1","var") == 0
    mutual_1 = imgMutualInformation(query,qur,step);
    [max_1,line_1,column_1] = maxMutualInfo(mutual_1,step);
end

%############# target_inverted #################

targ_1 = imread(target_inverted);
if exist("mutual_1","var") == 0
    mutual_1 = imgMutualInformation(query,targ_1,step);
    [max_1,line_1,column_1] = maxMutualInfo(mutual_1,step);
end


%############# target_lightning_contrast #################

targ_2 = imread(target_lightning_contrast);
if exist("mutual_2","var") == 0
    mutual_2 = imgMutualInformation(query,targ_2,step);
    [max_2,line_2,column_2] = maxMutualInfo(mutual_2,step);
end

%############# target_noise #################

targ_3 = imread(target_noise);
if exist("mutual_3","var") == 0
    mutual_3 = imgMutualInformation(query,targ_3,step);
    [max_3,line_3,column_3] = maxMutualInfo(mutual_3,step);
end

%############# target_original #################

targ_4 = imread(target_original);
if exist("mutual_4","var") == 0
    mutual_4 = imgMutualInformation(query,targ_4,step);
    [max_4,line_4,column_4] = maxMutualInfo(mutual_4,step);
end

%############# target1 #################

targ1 = imread(target1);
if exist("mutual1","var") == 0
    mutual1 = imgMutualInformation(query,targ1,step);
    [max1,line1,column1] = maxMutualInfo(mutual1,step);
end

%############# target2 #################

targ2 = imread(target2);
if exist("mutual2","var") == 0
    mutual2 = imgMutualInformation(query,targ2,step);
    [max2,line2,column2] = maxMutualInfo(mutual2,step);
end

%############# target3 #################

targ3 = imread(target3);
if exist("mutual3","var") == 0
    mutual3 = imgMutualInformation(query,targ3,step);
    [max3,line3,column3] = maxMutualInfo(mutual3,step);
end

%############# target4 #################

targ4 = imread(target4);
if exist("mutual4","var") == 0
    mutual4 = imgMutualInformation(query,targ4,step);
    [max4,line4,column4] = maxMutualInfo(mutual4,step);
end

%############ PRINT ALL###################
fprintf("Target_inverted:\n mutualMax = %f\n(x,y) = (%d,%d)\n\n",max_1,line_1,column_1);
fprintf("Target_lightning_contrast:\n mutualMax = %f\n(x,y) = (%d,%d)\n\n",max_2,line_2,column_2);
fprintf("Target_noise:\n mutualMax = %f\n(x,y) = (%d,%d)\n\n",max_3,line_3,column_3);
fprintf("Target_original:\n mutualMax = %f\n(x,y) = (%d,%d)\n\n",max_4,line_4,column_4);
fprintf("-----------------------------------------------------------------------------\n");
fprintf("Target1: \nmutualMax = %f\n(x,y) = (%d,%d)\n\n",max1,line1,column1);
fprintf("Target2: \nmutualMax = %f\n(x,y) = (%d,%d)\n\n",max2,line2,column2);
fprintf("Target3: \n \nmutualMax = %f\n(x,y) = (%d,%d)\n\n",max3,line3,column3);
fprintf("Target4: \nmutualMax = %f\n(x,y) = (%d,%d)\n\n",max4,line4,column4);

%########### Draw rectangle and display image ################

figure(1);
imshow(targ1);
rectangle("Position",[ line1 column1 query_width query_height],"LineWidth",2,"LineStyle","--","EdgeColor","r");

figure(2);
imshow(targ2);
rectangle("Position",[line2 column2 query_width query_height],"LineWidth",2,"LineStyle","--","EdgeColor","r");


figure(3);
imshow(targ3);
rectangle("Position",[line3 column3 query_width query_height],"LineWidth",2,"LineStyle","--","EdgeColor","r");


figure(4);
imshow(targ4);
rectangle("Position",[line4 column4 query_width query_height],"LineWidth",2,"LineStyle","--","EdgeColor","r");

figure(5);
imshow(targ_1);
rectangle("Position",[line_1 column_1 query_width query_height],"LineWidth",2,"LineStyle","--","EdgeColor","r");

figure(6);
imshow(targ_2);
rectangle("Position",[line_1 column_1 query_width query_height],"LineWidth",2,"LineStyle","--","EdgeColor","r");

figure(7);
imshow(targ_3);
rectangle("Position",[line_1 column_1 query_width query_height],"LineWidth",2,"LineStyle","--","EdgeColor","r");

figure(8);
imshow(targ_4);
rectangle("Position",[line_1 column_1 query_width query_height],"LineWidth",2,"LineStyle","--","EdgeColor","r");


