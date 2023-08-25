function [x , y] = aptidao(ultimo,var)

   nCromossomos= size(var);
   %id=ultimo(end-1)-ultimo(end);
   varOrd=sort(var);
    %if(id<0)
     %   varOrd=wrev(varOrd);
    %end
   elementos(1:nCromossomos(2))=0;
   pV(1:nCromossomos(2))=0;
   
   
   for (i=1:nCromossomos(2))
       for (j= 1:nCromossomos(2))
           if (varOrd(i)==var(j))
               elementos(i)=ultimo(j);
           end
       end
       if (varOrd(i)<0) varOrd(i)=varOrd(i).*(-1); end
   end
   pV(1)=varOrd(1);
   
   for (i=2:nCromossomos(2))
        pV(i)=varOrd(i)+pV(i-1);
   end
   sPv=sum(pV);
   for (i=1:nCromossomos(2))
       fit(i)= pV(i)/sPv;
   end
   
    % Retorno da funcao
    x = elementos;
    y = fit;
end

