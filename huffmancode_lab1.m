clc;
clear all;
close all;
s=['A' 'B' 'C' 'D' 'E'];
p=[0.2, 0.4, 0.1, 0.1, 0.2];
if length(s)~= length(p)
    error('wrong entry.. enter again')
end
[p idx] = sort(p,'descend');
%sp=p;
%s=s(idx);
pos = 1:length(p);
ps=pos(idx);
w=length(p);
cnt = w+1;
for i=1:w-2
    for j=1:(w-i+1)
        flow(i,j)=j
    end
end
i=1
codebook(i,w)={'1'}
codebook(i,w-1)={'0'}
while(length(p)>2)
    tempsum = p(length(p)) + p(length(p)-1)
    p = [p(1:length(p)-2),tempsum]
    prb=p
    ps = ps(1:length(p))
    ps(length(p))= cnt
    cnt = cnt+1
    [prb idx] = sort(prb,'descend')
    ps = ps(idx)
    idx = find(prb==p(length(p)))
    tp = ps(idx)
    tp = sort(tp,'descend');
    ps(idx)=tp
    idx=find(cnt-1==ps)
    w1=idx
    flow(i,length(p))=w1
    flow(i,length(p)+1)=w1
    if w1~=length(p)
        for j=w1:length(p)-1
            flow(i,j)=j+1
        end
    end
    i=i+1
    codebook(i,length(p))={'1'}
    codebook(i,length(p)-1)={'0'}
end
code(1:w)={''}
for i = 1:w
    m=i
    code(i)=codebook(1,i)
    for j = 1:w-2
        m=flow(j,m)
        code(i)=strcat(codebook(j+1,m),code(i))
    end
    code(i)=strcat(s(i),' = ',code(i))
end
for i=1:w
    disp(code(i))
end
   
    
