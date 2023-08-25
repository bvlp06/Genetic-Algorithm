%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
data1 = fopen('PETR4pp.csv');  %abre o csv IBMpp EQTL3p PETR4pp
A = textscan(data1,'%s','Delimiter',' ');  %%ler o csv
nCromossomos = 19;
nGenes=7;
data2 = fopen('PETR4cc.csv');  %% EQTL3c   IBMcc PETR4cc
C = textscan(data2,'%s','Delimiter',' ');  %%ler o csv
fclose(data1);
fclose(data2);

%%%%%% ORGANIZANDO OS DADOS %%%%%
for i=1:(nCromossomos+1)
    for j=1:nGenes
        B{i,j}= A{1,1}{(nGenes*(i-1)+j),1};
        if (j>=2 && j<6)
            B{i,j}=str2double(B{i,j});
        end
        if (j==7) B{i,j}=str2double(B{i,j}); end
    end
end

B{1,1}='Data'; B{1,2}='Ultimo'; B{1,4}='Maxima'; B{1,3}='Abertura';
B{1,5}='Minima';B{1,7}='Variacao'; B{1,6}='Volume';
clear A i j data1 % DADOS ORGANIZADOS na cell B , limpando o resto das variaveis%%

for i=1:(12)
    for j=1:nGenes
        D{i,j}= C{1,1}{(nGenes*(i-1)+j),1};
        if (j>=2 && j<6)
            D{i,j}=str2double(D{i,j});
        end
        if (j==7) D{i,j}=str2double(D{i,j}); end
    end
end

D{1,1}='Data'; D{1,2}='Ultimo'; D{1,4}='Maxima'; D{1,3}='Abertura';
D{1,5}='Minima';D{1,7}='Variacao'; D{1,6}='Volume';
clear C i j data2 % DADOS ORGANIZADOS na cell B , limpando o resto das variaveis%%

%PASSANDO OS VALORES DO FECHAMENTO PARA UM VETOR%
for i=1:(nCromossomos)
ultimo(i) = B{i+1,2};
var(i)=B{i+1,7};
end

res(1:11)=0;

y=max(var);
h=min(var);
b=sum(var);

if(b<0)
    tmut = (h+y);%*(-1);
end 
if (b>0)
   tmut = (y-h); 
   if (tmut>2)
       tmut = (y+h);
   end
end

for i=1:11
    [f,x]=geracao(ultimo,var,tmut,nCromossomos);
    res(i)=x;
    aux(1:nCromossomos+i)=0;
    aux(2:nCromossomos+i)=ultimo(1:end);
    aux(1)=x;
    ultimo=aux;
    
    vaux(1:nCromossomos+i)=0;
    vaux(2:nCromossomos+i)=var(1:end);
    vaux(1)=ultimo(1)-ultimo(2);
    if vaux(1)<0 
        vaux(1)=vaux(1)*(-1) ;
    end
    var=vaux;
end

res=wrev(res);

k=0;
for i=1:(11)
%    matrizPredicao(nCromossomos+i,2)= fitNt(i);
    matrizComparacao(i,1)= D{i+1,2};
    matrizComparacao(i,2)= res(i);
    matrizComparacao(i,3)= matrizComparacao(i,2)- matrizComparacao(i,1);
   if ((matrizComparacao(i,3)<=1) && (matrizComparacao(i,3)>= -1))
        k=k+1;
 %    disp(i)
   end
end

for i=2:(12)
         D{i,8}=matrizComparacao(i-1,2);
         D{i,9}=matrizComparacao(i-1,3);
end
D{1,8}='ValorPredicao';D{1,9}='DiferencaVPUltimo';
disp(k);



