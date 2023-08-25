function result=crossover(pais)
    tam =size(pais);
    filhos(1:tam(2)/2)=0;
    if(mod(tam(2),2)==0)       
            filhos(1:tam(2)/2)= (pais(2*(1:tam(2)/2))+ pais(2.*(1:tam(2)/2)-1))./2;
    end
  result =filhos;
end