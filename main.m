%%  CLEAR HISTORY
clc;
clear;
close all;
%%  EX2 ->  IMPORT ALL SIGNALS
direct=dir("Dataset/");
files=[];
windowID=1;
for i=3: length(direct)-1 
    files= [files; direct(i).name];
end
database1= importdata(strcat('Dataset/',files(1,:)));
database2= importdata(strcat('Dataset/',files(2,:)));
database3= importdata(strcat('Dataset/',files(3,:)));
database4= importdata(strcat('Dataset/',files(4,:)));
database5= importdata(strcat('Dataset/',files(5,:)));
database6= importdata(strcat('Dataset/',files(6,:)));
database7= importdata(strcat('Dataset/',files(7,:)));
database8= importdata(strcat('Dataset/',files(8,:)));
database9= importdata(strcat('Dataset/',files(9,:)));
database10= importdata(strcat('Dataset/',files(10,:)));

%%  EX3 ->  REPRESENT GRAPHICALLY ALL SIGNALS WITH EVERY ACTIVITIES
label= readLabels(1);
[graphX, graphY, graphZ]= drawAll(database1, windowID, files(1,:), label);
windowID=windowID+1;

%%  EX4 ->  CALCULATE DFT OF SEVERAL TYPES OF WINDOWS
ex4(files(1,:), [graphX, graphY, graphZ], windowID, label, "None");
windowID=windowID+1;
ex4(files(1,:), [graphX, graphY, graphZ], windowID, label, "Blackman");
windowID=windowID+1;
ex4(files(1,:), [graphX, graphY, graphZ], windowID, label, "Hamming");
windowID=windowID+1;
ex4(files(1,:), [graphX, graphY, graphZ], windowID, label, "Hann");
windowID=windowID+1;

%%  EX5 ->  CALCULATE DISTRIBUTIONS TIME-FREQUENCY OF Z-AXIS
ex5(graphZ, windowID, files(1,:));
windowID=windowID+1;
