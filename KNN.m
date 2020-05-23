%Função do classificador
%Parâmetros: treino, teste, o(s) k vizinho(s) e a Operação: DTW ou euclidiano

function [resultados] = KNN(treino, teste, k, op)

[ltr,n] = size(treino);
[lts,m] = size(teste);

if strcmp(op,"DTW")
    
    for i = 1:lts
    resultado(i,1)=0;
    resultado(i,2)=0;
    end

    for i = 1:lts
        for j = 1:ltr           
            DD = DTW((teste(i,2:end)),(treino(j,2:end)));
            R(j,:) = treino(j,1);
            RV(j,:) = DD;                                                                                                                                                            
        end
        resultado(i,:) = decisao(R, RV, k);        
    end
    resultados = resultado;
else
    
    for i = 1:lts
    resultado(i,1)=0;
    resultado(i,2)=0;
    end
    
    for i = 1:lts
        for j = 1:ltr
            DE = euclidiano((teste(i,2:end)),(treino(j,2:end)));
            R(j,:) = treino(j,1);
            RV(j,:) = DE;    
        end
        resultado(i,:) = decisao(R, RV, k);       
    end
    resultados = resultado;
end
end