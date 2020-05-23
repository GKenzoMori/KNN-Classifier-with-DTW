%Função que calcula a Validação cruzada em 5 partes
%Parâmetros: dados, o(s) k vizinho(s) e a Operação: DTW ou euclidiano

function VC = ValCruz5(dados, k, op)

    p1 = dados(1:20,:);
    p2 = dados(21:40,:);
    p3 = dados(41:60,:);
    p4 = dados(61:80,:);
    p5 = dados(81:100,:);
    
    for i = 1:11
      p1 = [p1; dados((1+(i*100)):((i*100)+20),:)];  
    end
       
    for i = 1:11
      p2 = [p2; dados((21+(i*100)):((i*100)+40),:)];  
    end
       
    for i = 1:11
      p3 = [p3; dados((41+(i*100)):((i*100)+60),:)];  
    end
     
    for i = 1:11
      p4 = [p4; dados((61+(i*100)):((i*100)+80),:)];  
    end
   
    for i = 1:11
      p5 = [p5; dados((81+(i*100)):((i*100)+100),:)];  
    end
    
    ts1 = p1;
    tr1 = [p2;p3;p4;p5];
    
    ts2 = p2;
    tr2 = [p1;p3;p4;p5];
    
    ts3 = p3;
    tr3 = [p1;p2;p4;p5];
    
    ts4 = p4;
    tr4 = [p1;p2;p3;p5];
    
    ts5 = p5;
    tr5 = [p1;p2;p3;p4];
    
    R1 = KNN(tr1, ts1, k, op);
    R2 = KNN(tr2, ts2, k, op);
    R3 = KNN(tr3, ts3, k, op);
    R4 = KNN(tr4, ts4, k, op);
    R5 = KNN(tr5, ts5, k, op);
    
    H1 = HitRatio(ts1, R1);
    H2 = HitRatio(ts2, R2);
    H3 = HitRatio(ts3, R3);
    H4 = HitRatio(ts4, R4);
    H5 = HitRatio(ts5, R5);
    
    VC = ((H1+H2+H3+H4+H5)/5);
    
end