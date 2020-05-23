%Função do que faz O DTW
%Parâmetros: teste e treino

function [DD] = DTW(ts,tr)
i=1;
j=1;
lts=0;
ltr=0;

while (i<164 && ts(1,i) ~= 150)
    lts = lts+1;
    i = i+1;
end

while (j<164 && tr(1,j) ~= 150) 
    ltr = ltr+1;
    j = j+1;
end
 
matriz = zeros(lts+1,ltr+1);

for i = 1:lts
    matriz(i,1) = inf;
end
for i = 1:ltr
    matriz(1,i) = inf;
end

matriz(1,1)=0; 

for i = 2:lts+1
    for j = 2:ltr+1
        matriz(i,j) = sqrt((ts(1,i-1)-tr(1,j-1))^2) + min(min(matriz(i-1,j), matriz(i,j-1)), matriz(i-1,j-1));
    end
end

DD = matriz(lts,ltr);

end