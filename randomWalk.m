clc;clear all;close all;

a = [0 1 2 1; 1 0 1 0; 2 1 0 1; 1 0 1 0];
Wi = 0;w1 = 0;w2 = 0;w3 = 0;w4 = 0;
for i = 1:4
    w1 = w1+a(1,i);
    w2 = w2+a(2,i);
    w3 = w3+a(3,i);
    w4 = w4+a(4,i);
    for j = 1:4
        Wi = Wi + a(i,j);
    end
end

disp(['Values of W1, W2, W3, and W4 are ', num2str(w1), ', ', num2str(w2), ', ', num2str(w3), ', ', num2str(w4)]);
%W = sum(Wi)/2
W = Wi/2;
disp(['Value of W is ', num2str(W)]);
 
%miu = Wi/2W
miu = [w1/(2*W) w2/(2*W) w3/(2*W) w4/(2*W)];
miu

%calculating H(Wi/2w)
ent2 = 0;
for k = 1:4
   ent2 = (ent2+miu(k).*log2(miu(k))); 
end
ent2 = ent2*(-1);
disp(['H(Wi/2w) is ',num2str(ent2)]);

%calculating H(Wij/2W)
k=1;
for i = 1:4
    for j = 1:4
        H(k) = [(a(i,j)/Wi)]; %H1(k) means H(Wi/(2*W))
        k=k+1;
    end
end

ent1 = 0;
for k = 1:16
   if H(k)==0  %Since Log2(0) = infinite, so if the value of H1(k) = 0 then it will be illiminated
       continue;
   end
   ent1 = (ent1+H(k).*log2(H(k))); %wi=2w
end
ent1 = ent1*(-1);
disp(['H(Wij/2w) is ',num2str(ent1)]);

Entropy_Rate = ent1 - ent2;
disp(['Entropy rate is ',num2str(Entropy_Rate)]);