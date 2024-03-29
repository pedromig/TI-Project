query = "/home/pedro/Documents/MATLAB/TI-Project/data/mi_data/query.bmp";
%###################################################################################
target1 = "/home/pedro/Documents/MATLAB/TI-Project/data/mi_data/target1.bmp";
target2 = "/home/pedro/Documents/MATLAB/TI-Project/data/mi_data/target2.bmp";
target3 = "/home/pedro/Documents/MATLAB/TI-Project/data/mi_data/target3.bmp";
target4 = "/home/pedro/Documents/MATLAB/TI-Project/data/mi_data/target4.bmp";
%###################################################################################
target_inverted = "/home/pedro/Documents/MATLAB/TI-Project/data/mi_data/target_inverted.bmp";
target_lightning_contrast= "/home/pedro/Documents/MATLAB/TI-Project/data/mi_data/target_lightning_contrast.bmp";
target_noise = "/home/pedro/Documents/MATLAB/TI-Project/data/mi_data/target_noise.bmp";
target_original =  "/home/pedro/Documents/MATLAB/TI-Project/data/mi_data/target_original.bmp";
%###################################################################################

%Clear console
clc

query = imread(query);
[query_width, query_height] = size(query);
step = 15;

%############# target_inverted #################

targ_1 = imread(target_inverted);
if exist("mutual_1","var") == 0
    mutual_1 = imgMutualInformation(query,targ_1,step);
end
[max_1,line_1,column_1] = maxMutualInfo(mutual_1,step);
var_1 = varMutualInfo(mutual_1);


%############# target_lightning_contrast #################

targ_2 = imread(target_lightning_contrast);
if exist("mutual_2","var") == 0
    mutual_2 = imgMutualInformation(query,targ_2,step);
end
[max_2,line_2,column_2] = maxMutualInfo(mutual_2,step);
var_2 = varMutualInfo(mutual_2);

%############# target_noise #################

targ_3 = imread(target_noise);
if exist("mutual_3","var") == 0
    mutual_3 = imgMutualInformation(query,targ_3,step);
end
[max_3,line_3,column_3] = maxMutualInfo(mutual_3,step);
var_3 = varMutualInfo(mutual_3);

%############# target_original #################

targ_4 = imread(target_original);
if exist("mutual_4","var") == 0
    mutual_4 = imgMutualInformation(query,targ_4,step);
end
[max_4,line_4,column_4] = maxMutualInfo(mutual_4,step);
var_4 = varMutualInfo(mutual_4);

%############# target1 #################

targ1 = imread(target1);
if exist("mutual1","var") == 0
    mutual1 = imgMutualInformation(query,targ1,step);
end
[max1,line1,column1] = maxMutualInfo(mutual1,step);
var1 = varMutualInfo(mutual1);

%############# target2 #################

targ2 = imread(target2);
if exist("mutual2","var") == 0
    mutual2 = imgMutualInformation(query,targ2,step);
end
[max2,line2,column2] = maxMutualInfo(mutual2,step);
 var2 = varMutualInfo(mutual2);

%############# target3 #################

targ3 = imread(target3);
if exist("mutual3","var") == 0
    mutual3 = imgMutualInformation(query,targ3,step);  
end
 [max3,line3,column3] = maxMutualInfo(mutual3,step);
var3 = varMutualInfo(mutual3);

%############# target4 #################

targ4 = imread(target4);
if exist("mutual4","var") == 0
    mutual4 = imgMutualInformation(query,targ4,step);
end
[max4,line4,column4] = maxMutualInfo(mutual4,step);
var4 = varMutualInfo(mutual4);

%############ PRINT ALL###################
fprintf("Target_inverted:\n mutualMax = %f\nvariance = %f\n (x,y) = (%d,%d)\n\n",max_1,var_1,line_1,column_1);
fprintf("Target_lightning_contrast:\n mutualMax = %f\nvariance = %f\n (x,y) = (%d,%d)\n\n",max_2,var_2,line_2,column_2);
fprintf("Target_noise:\n mutualMax = %f\nvariance = %f\n (x,y) = (%d,%d)\n\n",max_3,var_3,line_3,column_3);
fprintf("Target_original:\n mutualMax = %f\nvariance = %f\n (x,y) = (%d,%d)\n\n",max_4,var_4,line_4,column_4);
fprintf("-----------------------------------------------------------------------------\n");
fprintf("Target1: \nmutualMax = %f\nvariance = %f\n (x,y) = (%d,%d)\n\n",max1,var1,line1,column1);
fprintf("Target2: \nmutualMax = %f\nvariance = %f\n (x,y) = (%d,%d)\n\n",max2,var2,line2,column2);
fprintf("Target3: \n \nmutualMax = %f\nvariance = %f\n (x,y) = (%d,%d)\n\n",max3,var3,line3,column3);
fprintf("Target4: \nmutualMax = %f\nvariance = %f\n (x,y) = (%d,%d)\n\n",max4,var4,line4,column4);

%########### Draw rectangle and display image ################

figure(1);
imshow(query);
title("query.bmp");

figure(2); 

subplot(2,2,1);
imshow(targ1);
rectangle("Position",[ line1 column1 query_width query_height],"LineWidth",2,"LineStyle","--","EdgeColor","r");
title("target1.bmp");


subplot(2,2,2);
imshow(targ2);
rectangle("Position",[line2 column2 query_width query_height],"LineWidth",2,"LineStyle","--","EdgeColor","r");
title("target2bmp");


subplot(2,2,3);
imshow(targ3);
rectangle("Position",[line3 column3 query_width query_height],"LineWidth",2,"LineStyle","--","EdgeColor","r");
title("target3.bmp");

subplot(2,2,4);
imshow(targ4);
rectangle("Position",[line4 column4 query_width query_height],"LineWidth",2,"LineStyle","--","EdgeColor","r");
title("target4.bmp");

figure(3);

subplot(2,2,1);
imshow(targ_1);
rectangle("Position",[line_1 column_1 query_width query_height],"LineWidth",2,"LineStyle","--","EdgeColor","r");
title("target inverted.bmp");


subplot(2,2,2);
imshow(targ_2);
rectangle("Position",[line_1 column_1 query_width query_height],"LineWidth",2,"LineStyle","--","EdgeColor","r");
title("target lightning contrast.bmp");


subplot(2,2,3);
imshow(targ_3);
rectangle("Position",[line_1 column_1 query_width query_height],"LineWidth",2,"LineStyle","--","EdgeColor","r");
title("target noise.bmp");


subplot(2,2,4);
imshow(targ_4);
rectangle("Position",[line_1 column_1 query_width query_height],"LineWidth",2,"LineStyle","--","EdgeColor","r");
title("target original.bmp");

