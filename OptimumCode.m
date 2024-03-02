
x =   {'a' 'b' 'c' 'd' 'e'};
frequency = [25 25 20 15 15];
    
if length(frequency)~=length(x)
    disp('Equal length is expected ')
else
    probability_x = frequency/sum(frequency);
    s = sort(probability_x, 'descend');
    dictionary  = huffmandict(x,s);
    
    disp('Huffman codes: ')
    inequity = 0;
    for i=1:length(x)
        disp(dictionary{i,1})     %represent symbol
        disp(dictionary{i,2})       %represent codeword
        Li =  length(dictionary{i,2}); %find code length of each sysmbol
        inequity = inequity + 2 ^ (-Li); %find inequality
    end
     
    disp('Inequity: ')
    disp(inequity)
    
    if inequity<=1
        disp('This is optimal code.')
    else
        disp('Not optimal.')
    end
end

