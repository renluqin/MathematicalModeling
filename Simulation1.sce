m = [1;2;3];
K = [2,1,3;1,4,-2;3,-2,8];
C = chol(K)';
Z = zeros(3,1);
i=1;
while i<4
    U1 = rand();
    U2 = rand();
    Z(i,1) = sqrt(-2*log(U2))*cos(2*%pi*U1);
    i=i+1;
    if (i<3) then
        Z(i,1) = sqrt(-2*log(U2))*sin(2*%pi*U1);
        i=i+1;
    end
end
X = C*Z+m;
