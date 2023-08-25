function r4=mutdif(filhos,fit,vetMutacao,nJogadas)  %[r1,r2,r3,r4]
    
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
   
    % Retorno da funcao
        r4 =filhosMut;
end