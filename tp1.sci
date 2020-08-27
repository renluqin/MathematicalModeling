P=[0.7,0.1,0.05,0.05,0.05,0.05,0,0,0,0;0.1,0.6,0.1,0.05,0.05,0.05,0.05,0,0,0;0,0.1,0.6,0.1,0.05,0.05,0.05,0.05,0,0;0,0,0.1,0.6,0.1,0.05,0.05,0.05,0.05,0;0,0,0,0.1,0.6,0.1,0.05,0.05,0.05,0.05;0,0,0,0,0.1,0.6,0.1,0.05,0.05,0.1;0,0,0,0,0,0.1,0.6,0.1,0.05,0.15;0,0,0,0,0,0,0.1,0.6,0.1,0.2;0,0,0,0,0,0,0,0.1,0.6,0.3;0,0,0,0,0,0,0,0,0.1,0.9]

//2
//---------utiliser markov fonction------
//Y=grand(100,'markov',P,1)
function [Z]= markovF(P,n,init)
    Z=zeros(1,n)
    Z(1,1)=init+1
    for i = 2:n
        randx = rand(1)
        sumP = 0
        for j = 1:10
            sumP = sumP + P(Z(1,i-1),j)
            if(randx<=sumP) then
                Z(1,i)=j
                break
            end
        end
    end
    Z=Z-1
endfunction
Z=markovF(P,100,0)
plot(Z)
//3
sumM=0
sumZ=zeros(1,100)
for i=1:1000
    Z=markovF(P,100,0)
    //sumM = sumM + mean(Z) //pour obtenir la somme de moyenne
    sumZ = sumZ + (Z)
    //plot(Y) //les 1000 trajets de Zn
end
plot(sumZ/1000) //le trajet de la moyenne de 1000 Zn
//-------------utiliser markov fonction--------
//function
//plot(Y-1)
//for i=1:1000
  //  Y=grand(100,'markov',P,1)
  //  plot(Y-1)
//end

//4

function [T]= markovT(P,init)
    Z(1,1)=init+1
    i=1
    while Z(1,i)~=1,
        i=i+1
        randx = rand(1)
        sumP = 0
        for j = 1:10
            sumP = sumP + P(Z(1,i-1),j)
            if(randx<=sumP) then
                Z(1,i)=j
                break
            end
        end
    end
    T = i
endfunction
sumT=0
for i=1:2
    T(1,i)=markovT(P,4)
    sumT=sumT+T(1,i)
end
meanT=sumT/100

//5
B = [-1;0;0;0;0;0;0;0;0;0;0]
A = P'-eye(10,10)
A = [ones(1,10);A]
ans = linsolve(A,B)

moyen = 0
moyen2 = 0
for i = 1:10
    moyen = moyen+ans(i,1)*(i-1)
    moyen2 = moyen2+ans(i,1)*(i-1)^2
end
variance = moyen2-moyen^2
