function result= readLabels(file)
    label = importdata("Dataset/labels.txt");
    experiment_numberID= label(:,1);
    user_numberID= label(:,2);
    activity_number_ID= label(:,3);
    Label_startPoint= label(:,4);
    Label_endPoint= label(:, 5);
    
    col1= find(experiment_numberID==file);

    col2=user_numberID(col1(1):col1(end));
    col3=activity_number_ID(col1(1):col1(end));
    col4=Label_startPoint(col1(1):col1(end));
    col5=Label_endPoint(col1(1):col1(end));
    result=[col3 col4 col5];
end
