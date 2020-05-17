function [graphX, graphY, graphZ]= drawAll(database, windowID, nome, label)
    figure(windowID);
    graphX= drawOne(database, 1, "ACC_X", label);
    title(nome);
    graphY= drawOne(database, 2, "ACC_Y", label);
    graphZ= drawOne(database, 3, "ACC_Z", label);
end

function aux= drawOne(database, windowID, eixo, label)
    aux= database(:,windowID);
    subplot(3,1,windowID);
    hold on
    instant=0:7/(numel(aux)-1):7;
    
    for i=1:length(label)
        activity= getActivity(label(i,1));
        starting_activity= label(i,2);
        ending_activity= label(i,3);
        if (i==1); before= instant(1,1);
        else; before=label(i-1,3);
        end
        if starting_activity~=before+1
            aux_activity= aux(before+1:(starting_activity-1),:);
            activity_in_t=instant(1,before+1:(starting_activity-1)); 
            plot(activity_in_t, aux_activity, 'k');
        end
        if mod(i,2)~=0; text(instant(1,starting_activity),min(aux),activity,'Color','k','FontSize',5);
        else; text(instant(1,starting_activity),max(aux),activity,'Color','k','FontSize',5);
        end
        aux_activity= aux(starting_activity:ending_activity,:);
        activity_in_t=instant(1,starting_activity:ending_activity);
        plot(activity_in_t, aux_activity);
    end
    %   IF ENDING IS NOT DEFINED, ENDING INTERVAL GETS BLACK
    if instant(1,length(instant))~=ending_activity 
        aux_activity=aux(ending_activity+1:length(instant),:);
        activity_in_t=instant(1,ending_activity+1:length(instant)); 
        plot(activity_in_t, aux_activity, 'k');
    end
    hold off
    ylabel(eixo);
    xlabel("Time (min)");
end