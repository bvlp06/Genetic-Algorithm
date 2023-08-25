%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
data1 = fopen('IBMpredi03.csv');  %abre o csv
A = textscan(data1,'%s','Delimiter',' ');  %%ler o csv
nCromossomos = 21;
nGenes=7;
data2 = fopen('IBMcomp14.csv');
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

%%CALCULANDO A PREDI��O DOS 43 INDIVIDUOS %%
%%% o valor da predi��o por media movel de 25 dias � determinado com base
%%% na media dos 25 pre�os de fechamento, anteriores ao pre�o de fechamento
%%% corrente. Esse tipo de media movel foi escolhido pois faz parte do escopo,
%segundo especialistas, � o indicador mais utilizado em tendencias 
%%do mercado acionario.%%
[elementos fit]= aptidao(ultimo,var);

for i=1:nCromossomos
    matrizPredicao(i,1)= elementos(i);
    matrizPredicao(i,2)= fit(i);
end

%%%% SELECIONANDO OS PAIS
nJogadas=42;
pais1(1:nJogadas)=0;
freq1(1:nCromossomos)=0;
pais2(1:nJogadas)=0;
freq2(1:nCromossomos)=0;
pais3(1:nJogadas)=0;
freq3(1:nCromossomos)=0;
pais4(1:nJogadas)=0;
freq4(1:nCromossomos)=0;
pais5(1:nJogadas)=0;
freq5(1:nCromossomos)=0;
pais6(1:nJogadas)=0;
freq6(1:nCromossomos)=0;
pais7(1:nJogadas)=0;
freq7(1:nCromossomos)=0;
pais8(1:nJogadas)=0;
freq8(1:nCromossomos)=0;
pais9(1:nJogadas)=0;
freq9(1:nCromossomos)=0;
pais10(1:nJogadas)=0;
freq10(1:nCromossomos)=0;
pais11(1:nJogadas)=0;
freq11(1:nCromossomos)=0;
pais12(1:nJogadas)=0;
freq12(1:nCromossomos)=0;
pais13(1:nJogadas)=0;
freq13(1:nCromossomos)=0;
pais14(1:nJogadas)=0;
freq14(1:nCromossomos)=0;
 pais15(1:nJogadas)=0;
 freq15(1:nCromossomos)=0;
 pais16(1:nJogadas)=0;
 freq16(1:nCromossomos)=0;
 pais17(1:nJogadas)=0;
 freq17(1:nCromossomos)=0;
 pais18(1:nJogadas)=0;
 freq18(1:nCromossomos)=0;
% pais19(1:nJogadas)=0;
% freq19(1:nCromossomos)=0;
% pais20(1:nJogadas)=0;
% freq20(1:nCromossomos)=0;
%pais21(1:nJogadas)=0;
%freq21(1:nCromossomos)=0;
%pais22(1:nJogadas)=0;
%freq22(1:nCromossomos)=0;
%pais23(1:nJogadas)=0;
%freq23(1:nCromossomos)=0;
%pais24(1:nJogadas)=0;
%freq24(1:nCromossomos)=0;


[pais1  freq1] = roletaSelecao(elementos,fit,nJogadas);
[pais2  freq2] = roletaSelecao(elementos,fit,nJogadas);
[pais3  freq3] = roletaSelecao(elementos,fit,nJogadas);
[pais4  freq4] = roletaSelecao(elementos,fit,nJogadas);
[pais5  freq5] = roletaSelecao(elementos,fit,nJogadas);
[pais6  freq6] = roletaSelecao(elementos,fit,nJogadas);
[pais7  freq7] = roletaSelecao(elementos,fit,nJogadas);
[pais8  freq8] = roletaSelecao(elementos,fit,nJogadas);
[pais9  freq9] = roletaSelecao(elementos,fit,nJogadas);
[pais10  freq10] = roletaSelecao(elementos,fit,nJogadas);
[pais11 freq11] = roletaSelecao(elementos,fit,nJogadas);
[pais12  freq12] = roletaSelecao(elementos,fit,nJogadas);
[pais13  freq13] = roletaSelecao(elementos, fit,nJogadas);
[pais14  freq14] = roletaSelecao(elementos, fit,nJogadas);
[pais15  freq15] = roletaSelecao(elementos, fit,nJogadas);
[pais16  freq16] = roletaSelecao(elementos, fit,nJogadas);
[pais17  freq17] = roletaSelecao(elementos, fit,nJogadas);
[pais18  freq18] = roletaSelecao(elementos, fit,nJogadas);
% [pais19  freq19] = roletaSelecao(elementos, fit,nJogadas);
% [pais20  freq20]= roletaSelecao(elementos, fit,nJogadas);
% [pais21  freq21] = roletaSelecao(elementos, fit,nJogadas);
% [pais22  freq22]= roletaSelecao(elementos, fit,nJogadas);
% [pais23  freq23] = roletaSelecao(elementos, fit,nJogadas);
% [pais24  freq24]= roletaSelecao(elementos, fit,nJogadas);

%%%%CRUZAMENTO
filhos1= crossover(pais1);
filhos2= crossover(pais2);
filhos3= crossover(pais3);
filhos4= crossover(pais4);
filhos5= crossover(pais5);
filhos6= crossover(pais6);
filhos7= crossover(pais7);
filhos8= crossover(pais8);
filhos9= crossover(pais9);
filhos10= crossover(pais10);
filhos11= crossover(pais11);
filhos12= crossover(pais12);
filhos13= crossover(pais13);
filhos14= crossover(pais14);
 filhos15= crossover(pais15);
 filhos16= crossover(pais16);
 filhos17= crossover(pais17);
 filhos18= crossover(pais18);
% filhos19= crossover(pais19);
% filhos20= crossover(pais20);
% filhos21= crossover(pais21);
% filhos22= crossover(pais22);
% filhos23= crossover(pais23);
% filhos24= crossover(pais24);


filhosT=[filhos1 filhos2 filhos3 filhos4 filhos5 filhos6 filhos7 filhos8 filhos9 filhos10 filhos11 filhos12 filhos13 filhos14 filhos15 filhos16 filhos17 filhos18];% filhos19 filhos20 filhos21 filhos22 filhos23 filhos24];
vFt=calVariacao(filhosT);

clear pais19  freq19 pais18  freq18 pais17  freq17 pais16  freq16
clear pais24  freq24 pais23  freq23 pais22  freq22 pais21  freq21 pais20  freq20
clear filhos16 filhos17 filhos18 filhos19 filhos20 filhos21 filhos22 filhos23
clear vFM16 vFM17 vFM18 vFM19 vFM20 vFM21 vFM22 vFM23 vFM24 filhos16Mut filhos17Mut filhos18Mut filhos19Mut filhos20Mut filhos21Mut filhos22Mut filhos23Mut filhos24Mut filhos24
clear fitNt x fitP eE1 eE2 eE3 eE4 fitNovo1 fitNovo2 fitNovo3 fitNovo4 vFM5 vFM6 vFM7
clear filhos1Mut filhos2Mut filhos3Mut filhos4Mut vFM1 vFM2 vFM3 vFM4 vFM8 vFM9 vFM10 vFM11 vFM12 vFM13 vFM14 vFM15
clear pais1 pais2 pais3 pais4 freq1 freq2 freq3 freq4 freq5 freq6 freq7 freq8 freq9
clear freq10 freq11 freq12 freq13 freq14 freq15 pais5 pais6 pais7 pais8 pais9 pais10
clear pais11 pais12 pais13 pais14 pais15 filhos5Mut filhos6Mut filhos7Mut
clear filhos8Mut filhos9Mut filhos10Mut filhos11Mut filhos12Mut filhos13Mut filhos14Mut filhos15Mut
clear filhos1 filhos2 filhos3 filhos4 filhos5 filhos6 filhos7 filhos8 filhos9 filhos10
clear filhos11 filhos12 filhos13 filhos14 filhos15

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%MUTA��O
ultComparar(1:11)=0;
vetMutacao(1:5)=0;
for i=1:(11)
ultComparar(i) = D{i+1,2};

  %  if i<=5
       % vetMutacao(i)=B{i+1,2};
   % end
end
%ultComparar=wrev(ultComparar);
vetMutacao(1:5)=ultComparar(1:5);

filhosM= mutacao(filhosT, vFt, vetMutacao,nJogadas);

%filhosMt=[filhos1Mut filhos2Mut filhos3Mut filhos4Mut filhos5Mut filhos6Mut filhos7Mut filhos8Mut filhos9Mut filhos10Mut filhos11Mut filhos12Mut filhos13Mut filhos14Mut filhos15Mut filhos16Mut filhos17Mut filhos18Mut filhos19Mut filhos20Mut filhos21Mut filhos22Mut filhos23Mut filhos24Mut];
%vFMt=[vFM1 vFM2 vFM3 vFM4 vFM5 vFM6 vFM7 vFM8 vFM9 vFM10 vFM11 vFM12 vFM13 vFM14 vFM15 vFM16 vFM17 vFM18 vFM19 vFM20 vFM21 vFM22 vFM23 vFM24];

%vFt=calVariacao(filhosM);

%[eEt fitNt]= aptidao(filhosM,vFt);

%disp(eEt);
m=filhosM;
%melhorFs1(1:(nJogadas/2))=eEt(1:(nJogadas/2));
melhorF=m((end-11):end);
res=melhorF;%wrev((eEt((end-(end-12)):end)));
%varN(1:11)=wrev(fitNt(end-(end-10):end));
k=0;
for i=1:(11)
    matrizPredicao(nCromossomos+i,1)= res(i);
%    matrizPredicao(nCromossomos+i,2)= fitNt(i);
    matrizComparacao(i,1)= ultComparar(i);
    matrizComparacao(i,2)= res(i);
    matrizComparacao(i,3)= matrizComparacao(i,2)- matrizComparacao(i,1);
   if ((matrizComparacao(i,3)<=1) && (matrizComparacao(i,3)>= -1))
        k=k+1;
 %    disp(i)
   end
end


clear nGenes nCromossomos fit elementos ans nJogadas vetMutacao


disp(k);
for i=2:(12)
         D{i,8}=matrizComparacao(i-1,2);
         D{i,9}=matrizComparacao(i-1,3);
end
D{1,8}='ValorPredicao';D{1,9}='DiferencaVPUltimo';
nm=num2str(clock);
%if k>=10
    % Convert cell to a table and use first row as variable names
 %   T = cell2table(D(2:end,:),'VariableNames',D(1,:))
 
    % Write the table to a CSV file
  %  writetable(T,nm.csv)
%    csvwrite(nm.csv,D)
%end

clear melhorFs melhorFs1 melhorFs2 varN varN1 varN2 i k fitFs1 ultimo var eEt filhosMt vFMt
