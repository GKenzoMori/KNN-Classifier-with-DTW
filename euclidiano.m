%Função do que faz a Distância euclidiana
%Parâmetros: teste e treino

function [DE] = euclidiano(ts,tr)

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

s = 0;
if lts<ltr
    for i = 1:lts
        s = s + ((ts(1,i)-tr(1,i))^2);
        DE = sqrt(s);
    end
else
    for i = 1:ltr
        s = s + ((ts(1,i)-tr(1,i))^2);
        DE = sqrt(s);
    end
end

end