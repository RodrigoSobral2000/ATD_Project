function result= readLabels(file)
    label = importdata("Dataset/labels.txt");
    expID= label(:,1);
    activityID= label(:,3);
    startPoints= label(:,4);
    endPoints= label(:, 5);
    
    col1= find(expID==file);

    col3=activityID(col1(1):col1(end));
    col4=startPoints(col1(1):col1(end));
    col5=endPoints(col1(1):col1(end));
    result=[col3 col4 col5];
end
