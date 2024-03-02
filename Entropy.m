clc;
clear all;
close all;
input = [1/8 1/16 1/32 1/32; 1/16 1/8 1/32 1/32;1/16 1/16 1/16 1/16; 1/4 0 0 0];

% Marginal Distribution of x and y and calculation of H(X) and H(Y)
for i = 1:4
    MargX(i) = sum(input(:,i));
    MargY(i) = sum(input(i,:));
    Hx(i)    = (-1) * (MargX(i) * log2(MargX(i)));
    Hy(i)    = (-1) * (MargY(i) * log2(MargY(i)));
end

disp(['Marginal Distribution of X is   ', num2str(MargX)]);
disp(['Marginal Distribution of Y is   ', num2str(MargY)]);
disp(['H(X) is ', num2str(sum(Hx))]);
disp(['H(Y) is ', num2str(sum(Hy))]);

%H(X|Y)
for i = 1:4
    for j = 1:4
        temp(i,j) = input(i,j) / MargY(i);
        if temp(i,j) ~= 0
            tem(i,j) = (-1)*(temp(i,j) * log2( temp(i,j)));
        else
            tem(i,j) = 0; % Handle the case when temp(i,j) is 0 to avoid NaN
        end
    end
    XgivenY(i) = sum(tem(i,:)) * MargY(i); % Summing the conditional entropy values
end
XgivenY = sum(XgivenY);
disp(['H(X|Y) = ', num2str(XgivenY)]);

%H(Y|X)
for i = 1:4
    for j = 1:4
        temp(i,j) = input(j,i) / MargX(i); % Calculate conditional probability
        if temp(i,j) ~= 0   
            tem(i,j) = (-1)*(temp(i,j) * log2(temp(i,j))); % Compute conditional entropy
        else
            tem(i,j) = 0; % Handle the case when temp(i,j) is 0 to avoid NaN
        end
    end
    YgivenX(i) = sum(tem(i,:)) * sum(MargX(i)); % Summing the conditional entropy values
end
YgivenX = sum(YgivenX); % Total conditional entropy

disp(['H(Y|X) = ', num2str(YgivenX)]);


disp('Join probabilty : ');
JP =sum(Hy) +XgivenY;
disp(JP);
