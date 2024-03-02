clc;
clear all;
close all;
M =[1 0 1 0 1];
L = length(M);
g = [ 1 1 1 1;1  1 0 1];
m=2;n=2
x = zeros(n,L+m)
for j = 1:n
    for i = 1:(L+m)
        for k = 1:i
            if(i-k+1)<=L
                mess = M(i-k+1);
            else
               mess = 0;
            end
            if k>length(g(j,:))
                g(j,k)=0;
            end
            x(j,i) = x(j,i) + g(j,k) * mess;
        end
        x(j,i) = mod(x(j,i),2);
    end
end
x(:,:)
conv_code =[];
for i = 1:(L+m)
    conv_code = strcat(conv_code,num2str(x(1,i)),num2str(x(2,i)));
end
conv_code