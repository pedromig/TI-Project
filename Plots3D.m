% CHANGE THE PATHS!!!!
%###################################################################################
lyrics = "/home/pedro/Documents/MATLAB/TI-Project/data/lyrics.txt";
landscape  = "/home/pedro/Documents/MATLAB/TI-Project/data/landscape.bmp";
audio = "/home/pedro/Documents/MATLAB/TI-Project/data/soundMono.wav";
MRI =  "/home/pedro/Documents/MATLAB/TI-Project/data/MRI.bmp";
MRIbin =  "/home/pedro/Documents/MATLAB/TI-Project/data/MRIbin.bmp";
%###################################################################################


figure(1);
histPlot3D(lyrics);
figure(2);
histPlot3D(landscape);
figure(3);
histPlot3D(MRI)
figure(4);
histPlot3D(MRIbin);
%figure(5);
%histPlot3D(audio);

