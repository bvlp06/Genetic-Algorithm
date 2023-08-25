function [f, x] = geracao(ultimo,var,tmut,nCromossomos)
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
%vFt=calVariacao(filhosT,ultimo(1));

f = [freq1;freq2; freq3; freq4; freq5; freq6; freq7; freq8; freq9; freq10; freq11; freq12; freq13; freq14; freq15;freq16;freq17;freq18];%

clear pais19  freq19 pais18  freq18 pais17  freq17 pais16  freq16
clear pais24  freq24 pais23  freq23 pais22  freq22 pais21  freq21 pais20  freq20
clear filhos16 filhos17 filhos18 filhos19 filhos20 filhos21 filhos22 filhos23
clear vFM16 vFM17 vFM18 vFM19 vFM20 vFM21 vFM22 vFM23 vFM24 filhos16Mut filhos17Mut filhos18Mut filhos19Mut filhos20Mut filhos21Mut filhos22Mut filhos23Mut filhos24Mut filhos24
clear fitNt x fitP eE1 eE2 eE3 eE4 fitNovo1 fitNovo2 fitNovo3 fitNovo4 vFM5 vFM6 vFM7
clear filhos1Mut filhos2Mut filhos3Mut filhos4Mut vFM1 vFM2 vFM3 vFM4 vFM8 vFM9 vFM10 vFM11 vFM12 vFM13 vFM14 vFM15
clear pais1 pais2 pais3 pais4 %freq1 freq2 freq3 freq4 freq5 freq6 freq7 freq8 freq9
%clear %freq10 freq11 freq12 freq13 freq14 freq15%
clear pais5 pais6 pais7 pais8 pais9 pais10
clear pais11 pais12 pais13 pais14 pais15 filhos5Mut filhos6Mut filhos7Mut
clear filhos8Mut filhos9Mut filhos10Mut filhos11Mut filhos12Mut filhos13Mut filhos14Mut filhos15Mut
clear filhos1 filhos2 filhos3 filhos4 filhos5 filhos6 filhos7 filhos8 filhos9 filhos10
clear filhos11 filhos12 filhos13 filhos14 filhos15

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%MUTA��O
ultComparar(1:11)=0;
vetMutacao(1:5)=0;
for i=1:(19)  %MUDA COM O NUMERO DE CROMOSSOMOS
ultComparar(i) = ultimo(i);

  %  if i<=5
       % vetMutacao(i)=B{i+1,2};
   % end
end
%ultComparar=wrev(ultComparar);
vetMutacao(1:5)=elementos((end-4):end);

[filhosM,fz]= mutacao(filhosT, vetMutacao,ultimo(i),tmut);
%filhosMt=[filhos1Mut filhos2Mut filhos3Mut filhos4Mut filhos5Mut filhos6Mut filhos7Mut filhos8Mut filhos9Mut filhos10Mut filhos11Mut filhos12Mut filhos13Mut filhos14Mut filhos15Mut filhos16Mut filhos17Mut filhos18Mut filhos19Mut filhos20Mut filhos21Mut filhos22Mut filhos23Mut filhos24Mut];
%vFMt=[vFM1 vFM2 vFM3 vFM4 vFM5 vFM6 vFM7 vFM8 vFM9 vFM10 vFM11 vFM12 vFM13 vFM14 vFM15 vFM16 vFM17 vFM18 vFM19 vFM20 vFM21 vFM22 vFM23 vFM24];

%vFt=calVariacao(filhosM);

%[eEt fitNt]= aptidao(filhosM,vFt);

%disp(eEt);

%[filhosM fitZ]= aptidao(filhosM,fz);

x=filhosM(end) + tmut*0.5;
%melhorFs1(1:(nJogadas/2))=eEt(1:(nJogadas/2));
%x=m(end);


end
