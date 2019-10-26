% CHANGE THE PATHS!!!!
%###################################################################################
landscape  = "/home/pedro/Documents/MATLAB/PL1/data/landscape.bmp";
lyrics = "/home/pedro/Documents/MATLAB/PL1/data/lyrics.txt";
audio = "/home/pedro/Documents/MATLAB/PL1/data/soundMono.wav";
MRI =  "/home/pedro/Documents/MATLAB/PL1/data/MRI.bmp";
MRIbin =  "/home/pedro/Documents/MATLAB/PL1/data/MRIbin.bmp";
%###################################################################################
query = "/home/pedro/Documents/MATLAB/PL1/data/mi_data/query.bmp";
%###################################################################################
target1 = "/home/pedro/Documents/MATLAB/PL1/data/mi_data/target1.bmp";
target2 = "/home/pedro/Documents/MATLAB/PL1/data/mi_data/target2.bmp";
target3 = "/home/pedro/Documents/MATLAB/PL1/data/mi_data/target3.bmp";
target4 = "/home/pedro/Documents/MATLAB/PL1/data/mi_data/target4.bmp";
%###################################################################################
target_inverted = "/home/pedro/Documents/MATLAB/PL1/data/mi_data/target_inverted.bmp";
target_lightning_contrast= "/home/pedro/Documents/MATLAB/PL1/data/mi_data/target_lightning_contrast.bmp";
target3_noise = "/home/pedro/Documents/MATLAB/PL1/data/mi_data/target_noise.bmp";
target4_original =  "/home/pedro/Documents/MATLAB/PL1/data/mi_data/target_original.bmp";
%###################################################################################

%Clear the console
clc 

% #### Histograms ####
figure(1);
h1 = histPlot(lyrics);
figure(2);
h2 = histPlot(landscape);
figure(3);
h3 = histPlot(audio);
figure(4);
h4 = histPlot(MRI);
figure(5)
h5 = histPlot(MRIbin);

% #### Entropy ####
e1 = entropy(landscape);
e2 = entropy(lyrics);
e3 = entropy(audio);
e4 = entropy(MRI);
e5 = entropy(MRIbin);

%#### Entropy Display ####
fprintf("########### Entropies ##########\n\n");
fprintf("Landscape Entropy :  %f\n",e1);
fprintf("Text Entropy :  %f\n",e2);
fprintf("Audio Entropy: %f\n",e3);
fprintf("MRI Entropy: %f\n",e4);
fprintf("MRIbin Entropy: %f\n\n",e5);

%#### Average Number of bits using Huffman and variance ####
[hl1,var1] = HufflenStatistic(landscape);
[hl2,var2] = HufflenStatistic(lyrics);
[hl3,var3] = HufflenStatistic(audio);
[hl4,var4] = HufflenStatistic(MRI);
[hl5,var5] = HufflenStatistic(MRIbin);

%#### Average Number of bits using Huffman and variance display ####
fprintf("\n######## Average number of bits using Huffman codes #########\n\n")
fprintf("Landscape average number of bits using Huffman codes :  %f\n",hl1);
fprintf("Text average number of bits using Huffman codes :  %f\n",hl2);
fprintf("Audio average number of bits using Huffman codes %f\n",hl3);
fprintf("MRI average number of bits using Huffman codes: %f\n",hl4);
fprintf("MRIbin average number of bits using Huffman codes: %f\n\n",hl5);

fprintf("\n########Variance of the number of bits using Huffman codes #########\n\n")
fprintf("Landscape variance of the number of bits using Huffman codes :  %f\n",var1);
fprintf("Text  variance of the number of bits using Huffman codes : %f\n ",var2);
fprintf("Audio variance of the number of bits using Huffman codes : %f\n ",var3);
fprintf("MRIvariance of the number of bits using Huffman codes : %f\n ",var4);
fprintf("MRIbin variance of the number of bits using Huffman codes : %f\n ",var5);

% #### Histograms with grouping ####
var = 2;
figure(6);
hg1 = histPlot(lyrics,"group",var);
figure(7);
hg2 = histPlot(landscape,"group",var);
figure(8);
hg3 = histPlot(audio,"group",var);
figure(9);
hg4 = histPlot(MRI,"group",var);
figure(10)
hg5 = histPlot(MRIbin,"group",var);

% #### Entropy with grouping####
e1 = entropy(landscape,"group",var);
e2 = entropy(lyrics,"group",var);
e3 = entropy(audio,"group",var);
e4 = entropy(MRI,"group",var);
e5 = entropy(MRIbin,"group",var);

%#### Entropy Display with grouping ####
fprintf("\n########### Entropies with grouping ##########\n\n");
fprintf("Landscape Entropy :  %f\n",e1);
fprintf("Text Entropy :  %f\n",e2);
fprintf("Audio Entropy: %f\n",e3);
fprintf("MRI Entropy: %f\n",e4);
fprintf("MRIbin Entropy: %f\n\n",e5);
