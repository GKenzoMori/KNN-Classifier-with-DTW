%Função que decide o resultado, verifica e decide se tiver empate
%Parâmetros: O resultado R, o valor do resultado RV e o(s) k vizinho(s) 

function [resultado] = decisao(mov, dists, k)
    
    [lin, col] = size(dists);
    
    menor = inf;
    R=0;
    RV=0;
    menorI = inf;
    menorJ = inf;
    menorIR = inf;
    menorJR = inf;
    
    for i = 1:12
        p(i)=0;
    end
    
    for i = 1:k
        for j = 1:lin
           if dists(j,1) < menor                                                     
                menor = dists(j,1);
                mmenor = mov(j,1);
                flag = j;
           end             
        end
        RV(i,1) = menor;
        R(i,1) = mmenor;
        menor = inf;
        dists(flag,1) = inf;
    end

    v12 = 1:13;
    
    for i = 1:13
        v12(2,i)=0;
    end
    
    for i = 1:k
        if(v12(2,R(i,1)) == 0)
           p(R(i,1))=0;
           v12(2,R(i,1)) = v12(2,R(i,1))+1;
           v12(3,R(i,1)) = RV(i,1); 
           
           p(R(i,1)) = p(R(i,1))+1;

        else
        
        v12(2,R(i,1)) = v12(2,R(i,1))+1;
        v12(3+p(R(i,1)),R(i,1)) = RV(i,1);
        p(R(i,1)) = p(R(i,1))+1;
        end
        
    end
    
    for i = 1:12
        j = (i+1);
        
        while(j<14)         
            if(v12(2,i) ~= 0 && v12(2,i) == max(v12(2,:)) && v12(2,i) == v12(2,j))
               for z = 1:v12(2,i)               
                   if(v12(z+2,i)<menorI)
                        menorI = v12(z+2,i);
                   end
               end                
               for z = 1:v12(2,j)               
                   if(v12(z+2,j)<menorJ)
                        menorJ = v12(z+2,j);
                   end
               end
               
               if(menorI<menorIR)
                   menorIR = menorI;
               end
                   
               if (menorJ<menorJR)
                   menorJR = menorJ;
               end
               
               if(menorIR < menorJR)
                   resultado = [i,menorIR];                 
               else
                   resultado = [j,menorJR];
               end
               
            end
            j = j+1;
        end
    end
    
    if(menorI == inf && menorJ == inf)   
        m = inf;              
        for i = 1:12
            if(v12(2,i)==max(v12(2,:)))
                for z = 1:max(v12(2,:))               
                    if(v12(z+2,i)<m)
                        m = v12(z+2,i);
                    end
                end
                resultado = [v12(1,i), m]; 
            end
        end                        
    end 
end