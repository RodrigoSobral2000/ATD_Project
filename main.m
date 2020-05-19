%%  CLEAR HISTORY
clc;
clear;
close all;
%%  "GLOBAL" VARIABLES
direct=dir("Dataset/");
files=[];
windowID=1;
expID=51;
stepsW=[];
stepsWU=[];
stepsWD=[];

for i=3: length(direct)-1 
    files= [files; direct(i).name];
end

%%  ==================================================================
for i=1: 10
    %%  EX2 ->  IMPORT ALL SIGNALS
    i_database= importdata(strcat('Dataset/',files(i,:)));
    
    %%  EX3 ->  REPRESENT GRAPHICALLY ALL SIGNALS WITH EVERY ACTIVITIES
    label= readLabels(expID);
    expID= expID+1;
    [graphX, graphY, graphZ]= drawAll(i_database, windowID, files(i,:), label);
    windowID=windowID+1;
    
    %%  EX4 ->  CALCULATE DFT (DEFAULT WINDOW)
    [auxStepsW, auxStepsWU, auxStepsWD]= ex4(files(i,:), [graphX, graphY, graphZ], windowID, label, "None");
    stepsW=[stepsW; auxStepsW];
    stepsWU=[stepsWU; auxStepsWU];
    stepsWD=[stepsWD; auxStepsWD];
    windowID=windowID+1;
    
    %%  EX4.1-> CALCULATE DFT OF SEVERAL TYPES OF WINDOWS
    ex4(files(i,:), [graphX, graphY, graphZ], windowID, label, "Blackman");
    windowID=windowID+1;
    ex4(files(i,:), [graphX, graphY, graphZ], windowID, label, "Hamming");
    windowID=windowID+1;
    ex4(files(i,:), [graphX, graphY, graphZ], windowID, label, "Hann");
    windowID=windowID+1;
    
    %%  EX5 ->  CALCULATE DISTRIBUTION TIME-FREQUENCY OF Z-AXIS
    ex5(graphZ, windowID, files(i,:));
    windowID=windowID+1;
end

%%  AVERAGES AND STANDART DEVIATIONS AND RESULTS TABLES
disp("Averages Table");
disp("===============");
disp("Walking:")
averageTable= table(mean(stepsW(:,1)), mean(stepsW(:,2)), mean(stepsW(:,3)));
disp(averageTable);
disp("Walking Upstairs:")
averageTable= table(mean(stepsWU(:,1)), mean(stepsWU(:,2)), mean(stepsWU(:,3)));
disp(averageTable);
disp("Walking Downstairs:")
averageTable= table(mean(stepsWD(:,1)), mean(stepsWD(:,2)), mean(stepsWD(:,3)));
disp(averageTable);
disp("================");
disp("Standart Deviation Table");
disp("===============");
disp("Walking:")
averageTable= table(std(stepsW(:,1)), std(stepsW(:,2)), std(stepsW(:,3)));
disp(averageTable);
disp("Walking Upstairs:")
averageTable= table(std(stepsWU(:,1)), std(stepsWU(:,2)), std(stepsWU(:,3)));
disp(averageTable);
disp("Walking Downstairs:")
averageTable= table(std(stepsWD(:,1)), std(stepsWD(:,2)), std(stepsWD(:,3)));
disp(averageTable);
disp("================");
disp("All Values Table");
disp("===============");
disp("Walking:")
averageTable= table(files(:,:), stepsW(:,1), stepsW(:,2), stepsW(:,3));
disp(averageTable);
disp("Walking Upstairs:")
averageTable= table(files(:,:), stepsWU(:,1), stepsWU(:,2), stepsWU(:,3));
disp(averageTable);
disp("Walking Downstairs:")
averageTable= table(files(:,:), stepsWD(:,1), stepsWD(:,2), stepsWD(:,3));
disp(averageTable);