m=input('Enter four bit message: ');
d1=[1 0 0 0];
d2=[0 1 0 0];
d3=[0 0 1 0];
d4=[0 0 0 1];
p1=d2'+d3'+d4';
p2=d1'+d3'+d4';
p3=d1'+d2'+d4';
G=[p1 p2 p3 d1' d2' d3' d4']
p=[p1,p2,p3];
h=[eye([3 3]) p'];
code_word=mod((m*G),2)
E=mod((h*code_word'),2)
erc=input('Give an errorneous received hamming code word: ');
E=mod((h*erc'),2)
pe=0;
for i=1:7
    if (E==h(:,i))
        pe=i;
    end
end
h
error_pos = pe
if pe~=0
    erc(pe)=xor(erc(pe),1);
end
correction=erc