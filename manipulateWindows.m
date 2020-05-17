function manipulateWindows(file_name, aux_activity, windowID, graph)
    f=linspace(-25,25,numel(activityLabel));
    ixp=find(f>=0);
    f=f(ixp);
    discrete_fourier_transform=dFT(detrend(activityLabel).*hamming(numel(activityLabel)));
    dft = dFT(activityLabel);
    
    figure(windowID);
    if (graph==1) 
        title(file_name, "ACC_X");
    elseif (graph==1) 
        title(file_name, "ACC_Y");
    elseif (graph==1) 
        title(file_name, "ACC_Z");
    end
    for eixo=1: size(activities)
        subplot(2,2,1);
        plot(f,abs(dft(ixp)));
        x=sprintf('[%s] DFT %s', tipo, texto);
        title(x);
        
        subplot(2,2,2);
        plot(f,abs(discrete_fourier_transform(ixp)));
        x=sprintf('[%s]Janela de Hamming %s', tipo, texto);
        title(x);
    
        subplot(2,2,3);
        discrete_fourier_transform=dFT(activityLabel.*hann(numel(activityLabel)));
        plot(f,abs(discrete_fourier_transform(ixp)));
        x=sprintf('[%s] Janela de Hann %s', tipo, texto);
        title(x);
    
        subplot(2,2,4);
        discrete_fourier_transform=dFT(activityLabel.*blackman(numel(activityLabel)));
        plot(f,abs(discrete_fourier_transform(ixp)));
        x=sprintf('[%s] Janela de Blackman %s', tipo, texto);
        title(x);
    end
end