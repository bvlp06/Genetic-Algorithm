function [r4,f] = mutacao(filhos,vetMutacao,x,tmut)  %[r1,r2,r3,r4]
    
    aux = false;
    G=0;
    %[elm ap]=aptidao(filhos,fit);
   % mF(1:(4*nJogadas))=elm(1:(4*nJogadas));
    filhosMut=sort(filhos) ;%mF;
    tam=size(filhosMut);
    matrizMut(1:tam(2),1:tam(2))=-1;
   
   while(aux == false)
       G=G+1;
      % disp(G)
        for i=1:tam(2)
            for j=i+1:tam(2)
                if(filhosMut(i)==filhosMut(j))
                    matrizMut(i,j)=1;
                    matrizMut(j,i)=1;
                end
            end
        end
        a=0;
        for i=1:tam(2)
            for j=i+1:tam(2)
                if(matrizMut(i,j)==1)
                    a=1;
                    break
                end
            end
            if(a==1) 
                break
            end
        end
        if(a==0) 
            aux = true; 
        end
        
        if(aux==false)
            for i=1:tam(2)
                for j=i+1:tam(2)
                    if(matrizMut(i,j)==1)
                        matrizMut(i,j)=0;
                        matrizMut(j,i)=0;
                        matrizMut(i,i)=0;
                        filhosMut(j)=((filhosMut(j)+sum(vetMutacao))./6);
                        if (rem(j,2)==0)
                             filhosMut(j)=filhosMut(j)+rand();
                         else 
                            filhosMut(j)=filhosMut(j)-rand();
                        end
                    end
                filhosMut(i)=filhos(i);    
                end
            end
        end
      %  if G>25000
       %         r1 =filhosMut;
       % end
       % if G>50000
       %     r2=filhosMut;
       % end
       % if G>75000
       %     r3=filhosMut;
       % end
       if G>1500
            break
       end
   end

     fit=calVariacao(filhosMut,x);
    
    %aux = false;
    G=0;
    %[elm ap]=aptidao(filhos,fit);
   % mF(1:(4*nJogadas))=elm(1:(4*nJogadas));
    %filhosMut=sort(filhos) ;%mF;
    tam=size(filhosMut);
    %filhosMut=filhos;
    %matrizMut(1:tam(2),1:tam(2))=-1;
    for i=1:tam(2)
        while(fit(i,1)>0.1)
            G=G+1;
            
            if(tmut<0)
                if(fit(i,2)<0)
                    filhosMut(i)=filhosMut(i)-tmut*0.5;%rand();
                else 
                    filhosMut(i)=filhosMut(i)+tmut*0.5;%rand();
                end
            end
            
            if(tmut>0)
                if(fit(i,2)<0)
                    filhosMut(i)=filhosMut(i)+tmut*0.5;%rand();
                else 
                    filhosMut(i)=filhosMut(i)-tmut*0.5;%rand();
                end
            end
            
            fit(i,1)=(x-filhosMut(i))/x;
            fit(i,2)=(x-filhosMut(i))/x;
            if fit(i,1)<0
                fit(i,1)=fit(i,1)*(-1);      
            end
            if G>1500
                break
            end    
        end
    end
   
    % Retorno da funcao
    
    r4 =filhosMut;
    f=fit;
end