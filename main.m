% CHANGE THE PATHS!!!!
landscape  = "/home/pedro/Documents/MATLAB/PL1/data/landscape.bmp";
lyrics = "/home/pedro/Documents/MATLAB/PL1/data/lyrics.txt";
audio = "/home/pedro/Documents/MATLAB/PL1/data/soundMono.wav";
MRI =  "/home/pedro/Documents/MATLAB/PL1/data/MRI.bmp";
MRIbin =  "/home/pedro/Documents/MATLAB/PL1/data/MRIbin.bmp";

% #### Histograms ####
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

fprintf("Landscape Entropy :  %f\n",e1);
fprintf("Text Entropy :  %f\n",e2);
fprintf("Audio Entropy: %f\n",e3);
fprintf("MRI Entropy: %f\n",e4);
fprintf("MRIbin Entropy: %f\n",e5);
