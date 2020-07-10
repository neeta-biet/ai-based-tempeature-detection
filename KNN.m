clc;     
clear all
close all
% %accessing Input file
load('Data.mat');

%seperating Input & Output
ip1=data(2:end,1:2:end);
ip2=data(2:end,2:2:end);
op1=[]
cnt=1;
for i=1:2:215
    n=data(1,i) ;
    if n==1
        op1(:,cnt)=[1];
        cnt=cnt+1;
    end
    if n==2
        op1(:,cnt)=[2];
        cnt=cnt+1;
    end
    if n==3
        op1(:,cnt)=[3];
        cnt=cnt+1;
    end
    
end

op2=[];
cnt=1;
  for i=2:2:215
    n=data(1,i) ;
     if n==1
        op2(:,cnt)=[1];
        cnt=cnt+1;
    end
    if n==2
        op2(:,cnt)=[2];
        cnt=cnt+1;
    end
    if n==3
        op2(:,cnt)=[3];
        cnt=cnt+1;
    end
  end
  

%Matching knnclassify conditions
a=ip1';
b=ip2';
o=op1';
o1=op2';
%Finding nearest neighour
Class = knnclassify(b,a,o,1);
%Class = fitcknn(b,a,o,1);
C=confusionmat(o1,Class);
acc_of_knn=sum(diag(C))/sum(C(:));

%Finding Accuracy
fprintf('KNN Classifier Accuracy: %.2f%%\n',100*acc_of_knn )

