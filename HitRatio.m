%Função que calcula o Hit Ratio
%Parâmetros: teste e o resultado

function [HR] = HitRatio(teste, resultadoD)

    [l,c] = size(teste);
    acerto = 0;
    
    for i = 1:l
       
        if(teste(i,1) == resultadoD(i,1))
           acerto = acerto + 1; 
        end
    end
    
    HR = (acerto/l);
    
end