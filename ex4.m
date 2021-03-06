function [stepsW, stepsWU, stepsWD]=ex4(file_name, graphs, windowID, label, slidingType)
    figure(windowID);
    fs= 50;
    stepsW=[]; 
    stepsWU=[];
    stepsWD=[];
    set(gcf,'position',[10,10,550,400]);

    counter=1;
    for activity_counter=1: 12
        %   LINES OF LABEL WHERE ACTIVITY IS HAPPENING
        lines=find(label(:,1)==activity_counter);
        if (length(lines)~=0)
            activity_name=getActivity(label(lines(1),1));
            for eixo=1: 3
                subplot(12, 3, counter);
                counter=counter+1;
                limitedGraph=[];
                for interval=1: length(lines)
                    %   STARTING AND ENDING OF ACTIVITY
                    starting= label(lines(interval),2);
                    ending= label(lines(interval), 3);
                    limitedGraph= [limitedGraph; graphs([starting: ending], eixo)];
                end
                
                %   ==========  EX  4.1  ==========
                if (slidingType=="None")
                    graphDFT= abs(fftshift(fft(detrend(limitedGraph))));
                elseif (slidingType=="Blackman")
                    graphDFT= abs(fftshift(fft( detrend(limitedGraph.*blackman(numel(limitedGraph))) )));
                elseif (slidingType=="Hamming")
                    graphDFT= abs(fftshift(fft( detrend(limitedGraph.*hamming(numel(limitedGraph))) )));
                elseif (slidingType=="Hann")
                    graphDFT= abs(fftshift(fft( detrend(limitedGraph.*hann(numel(limitedGraph))) )));
                end
                
                N=length(limitedGraph);
                if (mod(N,2)==0)
                    frequencies= -fs/2:fs/N:fs/2-fs/N;
                else 
                    frequencies= -fs/2+fs/(2*N):fs/N:fs/2-fs/(2*N);
                end
                 
                plot(frequencies, graphDFT);
                
                if (eixo==1)
                    title(activity_name+" of "+"ACC_X", "FontSize",5);
                elseif (eixo==2)
                    title(activity_name+" of "+"ACC_Y", "FontSize",5);
                elseif (eixo==3)
                    title(activity_name+" of "+"ACC_Z", "FontSize",5);
                end
                
                %   ==========  EX  4.2  ==========
                if (slidingType=="None" && activity_counter==1)
                    stepsW= [stepsW, ex4_2(graphDFT, limitedGraph)];
                elseif (slidingType=="None" && activity_counter==2)
                    stepsWU= [stepsWU, ex4_2(graphDFT, limitedGraph)];
                elseif (slidingType=="None" && activity_counter==3)
                    stepsWD= [stepsWD, ex4_2(graphDFT, limitedGraph)];
                end
            end
        end
    end
end