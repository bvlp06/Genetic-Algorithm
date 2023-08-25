function vari = calVariacao(filhos,x)
    tam=size(filhos);
    filhosMut=sort(filhos);
    pp(1:tam(2),1:tam(2))=0;
    for i=1:tam(2)
        pp(i,1)=(x-filhosMut(i))/x;
        pp(i,2)=(x-filhosMut(i))/x;
       if pp(i,2)<0
            pp(i,1)=pp(i,1)*(-1);
       end
    end
    %tP=sum(pp);
    %for i=1:tam(2)
     %   vA(i)=(pp(i)/tP)*100;
    %end
    vari=pp;
end