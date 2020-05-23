clear all
close all
clc

%-------------------------------------------------------------------------------------------------------------------
    % Guilherme Kenzo Mori
    % Para executar o programa, clicar no play Verde escrito RUN no menu de
    % cima, além de abrir a pasta que contém "base de dados.txt" no current
    % folder no menu à esquerda.
%-------------------------------------------------------------------------------------------------------------------

%Carregando os dados;
opts = detectImportOptions('base de dados.txt');
opts.Delimiter = ' ';
opts.DataLines = [1,inf];
opts.VariableOptions.EmptyFieldRule = 'auto';
opts.VariableNames = 'classe';
base = readtable('base de dados.txt',opts);

celldados = table2array(base(:,:));
dados = str2double(table2array(base(:,:)));

dados(isnan(str2double(table2array(base(:,:))))) = 150;

%-------------------------------------------------------------------------------------------------------------------
%Digite quantas linhas você deseja para teste e treino de cada movimento 
%OBS: 100 linhas para cada respectivo movimento de 1 a 12;

%linhasTreino = 10;
%linhasTeste = 1;

%treino = dados(1:linhasTreino,:);
%teste = dados(linhasTreino+1:(linhasTreino+linhasTeste),:);

%for i = 1:11
%      treino = [treino; dados((1+(i*100)):((i*100)+(linhasTreino)),:)];  
%end

%for i = 1:11
%      teste = [teste; dados((linhasTreino+1+(i*100)):((i*100)+(linhasTreino+linhasTeste)),:)];  
%end
  
%%teste = [dados(1,:);dados(2,:);dados(101,:);dados(102,:)];
%%treino = [dados(3,:);dados(4,:);dados(5,:);dados(103,:)];
%-------------------------------------------------------------------------------------------------------------------
%Parâmetros: treino, teste, o(s) k vizinho(s) e a Operação: DTW ou euclidiano
%%resultadoD = KNN(treino, teste, 3, "DTW");
%%resultadoE = KNN(treino, teste, 3, "euclidiano");

%%HRD = HitRatio(teste, resultadoD);
%%HRE = HitRatio(teste, resultadoE);

%%l,c] = size(teste);

%%for i = 1:l
    %%fprintf('Resultado do teste %d (%d) --> %d - com distância euclidiana: %.2f\n', i,teste(i,1),resultadoE(i,1),resultadoE(i,2));
    %%fprintf('Resultado do teste %d (%d) --> %d - com distância DTW: %.2f\n', i,teste(i,1),resultadoD(i,1),resultadoD(i,2));
%%end
 
%%fprintf('Hit Ratio com Euclidiano --> %.2f por cento \n', (HRE*100));
%%fprintf('Hit Ratio com DTW --> %.2f por cento \n', (HRD*100));
    
%VCK1D = ValCruz5(dados, 1, "DTW");
%VCK3D = ValCruz5(dados, 3, "DTW");
%VCK5D = ValCruz5(dados, 5, "DTW");
%VCK10D = ValCruz5(dados, 10, "DTW");

%fprintf('Validação cruzada para DTW com 1 vizinho --> %.2f por cento\n', (VCK1D*100));
%fprintf('Validação cruzada para DTW com 3 vizinhos --> %.2f por cento\n', (VCK3D*100));
%fprintf('Validação cruzada para DTW com 5 vizinhos --> %.2f por cento\n', (VCK5D*100));
%fprintf('Validação cruzada para DTW com 10 vizinhos --> %.2f por cento\n', (VCK10D*100));

VCK1E = ValCruz5(dados, 1, "euclidiano");
VCK3E = ValCruz5(dados, 3, "euclidiano");
VCK5E = ValCruz5(dados, 5, "euclidiano");
VCK10E = ValCruz5(dados, 10, "euclidiano");

fprintf('Validação cruzada para euclidiano com 1 vizinho --> %.2f por cento\n', (VCK1E*100));
fprintf('Validação cruzada para euclidiano com 3 vizinhos --> %.2f por cento\n', (VCK3E*100));
fprintf('Validação cruzada para euclidiano com 5 vizinhos --> %.2f por cento\n', (VCK5E*100));
fprintf('Validação cruzada para euclidiano com 10 vizinhos --> %.2f por cento\n', (VCK10E*100));

