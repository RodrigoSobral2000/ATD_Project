function averageSteps=ex4_2(graphDFT, limitedGraph)
    frequencies=linspace(-25,25,numel(limitedGraph));
    aux=find(frequencies>=0);
    frequencies=frequencies(aux);
    
    maximo=max(abs(graphDFT(aux)));
    [vetor_picos,locs] = findpeaks(abs(graphDFT(aux)),'MinPeakHeight',maximo*0.4);
    frequency=frequencies(locs(1));
    
    averageSteps = frequency*60;
end