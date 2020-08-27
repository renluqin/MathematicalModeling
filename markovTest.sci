p=[0.1,0.7,0.8,0.85,0.9,0.95,1]
function [c]=test(T)
    n=1
    c=zeros(1,T)
    c(1,n)=1
    while n<=T 
        u1=rand()
        i=1 
        while i<=7
            if u1<=p(i) then
                c(1,n+1)=c(1,n)+i-1
                break
            else
                i=i+1
            end
        end
        if c(1,n+1) > 10 then
            c(1,n+1) = 10
        end
        if c(1,n+1) < 1 then
            c(1,n+1) = 1
        end
        c(1,n+1) = c(1,n+1) -1
        n=n+1
    end
endfunction
function [somme]=MulTest(T,N)
    i=1
    somme=0
    while i<=N
        C=test(T)
        //plot(C)
        somme=somme+C
        i=i+1
    end
endfunction
//Z=MulTest(100,1000)
//mean=Z/1000
//plot(mean)
//moyenne=sum(mean)/100
C=test(100)
plot(C)

