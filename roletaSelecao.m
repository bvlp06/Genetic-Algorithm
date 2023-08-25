function [x , y]= roletaSelecao(populacao,fit,nJogadas)
tam=size(fit);
for i=(1:tam(2))
    aux(i)=fit(i);
    if (aux(i)<0)
        aux(i)=(aux(i))*(-1);
    end
end
sfit=sum(aux);
porcRol(1:(tam(2)))= ((aux(1:(tam(2))))./sfit);

clear aux
% Intervalo de cada area
intervalo(1:tam(2),2)=0;
intervalo(1,1)= 0;
intervalo(1,2)= porcRol(1);
for i=2:tam(2)
intervalo(i,1)= intervalo(i-1,2);
intervalo(i,2)=intervalo(i,1)+ porcRol(i);;
end

% Frequencia dos resultados em cada area
freq(1:tam(2))=0;

% Numero de jogadas a realizar
%r = randi([fix(min(fit)),fix(max(fit(i)))],1,nJogadas);
%s=rand(1,nJogadas);
%giroRol=r+s;
giroRol=rand(1,nJogadas);
pais(1:nJogadas)=0;

    for i=1:nJogadas
        j=1; 
            while((giroRol(i))>(intervalo(j,2)))
                j=j+1;
            end
            if ((giroRol(i) >= intervalo(j,1)) && (giroRol(i) < intervalo(j,2)))
                pais(i)=populacao(j);
                freq(j)=freq(j)+1;
            end
        j=0;
    end
% Mostrando o resultado
x = pais;
y = freq;
end