
matrix = [2/3, 1/3; 1/3, 2/3];

disp(matrix)

Hp =(-1)*( matrix(1, 1) * log2(matrix(1, 1)) + matrix(1, 2) * log2(matrix(1, 2)));
disp(['Conditional probability H(X) is ', num2str(Hp)]);

C = 1 - Hp;
disp(['Channel Capacity is ', num2str(C)]);