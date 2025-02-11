function [CSA,CSWA]=KCenter(A,WA,num)
% num is the number of chosen points
% seqNo is the sequence array of the num chosen points
Num=size(A,2);% the number of points in set A
iniNo=randi(Num);% the first number
cluNo=ones(1,Num);
disMat=sum(bsxfun(@minus,A,A(:,iniNo)).^2,1);
for i=2:num
    [~,curNo]=max(disMat);
    tmpMat=sum(bsxfun(@minus,A,A(:,curNo)).^2,1);
    [disMat,tmpSeq]=min([disMat;tmpMat],[],1);
    cluNo(tmpSeq==2)=i;
end
dim=size(A,1);
CSA=zeros(dim,num);
CSWA=zeros(1,num);
for i=1:num
    ithNo=(cluNo==i);
    CSWA(i)=sum(WA(ithNo));
    CSA(:,i)=sum(bsxfun(@times,WA(ithNo)/CSWA(i),A(:,ithNo)),2);
end