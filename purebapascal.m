% u = [1 1];
% z = [1 2 1];
% w = conv(u,z);
% 
% m=3;

% % convolution
% 
u = [1 1];
z = [1 1];
n=5;




trianpascal(n-2,u,z);

global mascarapas
num=mascarapas.*reshape(mascarapas,[],1);
mascarapascal=num/sum(num,'all');




function trianpascal(number,s1,s2)

   global mascarapas
    if number==1
        nivelfinal=conv(s1,s2);
        mascarapas=nivelfinal;
    else
        s2=conv(s1,s2);
        trianpascal(number-1,s1,s2);
    end
    
end






% function con=convolu(s1,s2)
% 
% m=length(s1);
% n=length(s2);
% X=[s1,zeros(1,n)];
% H=[s2,zeros(1,m)];
% for i=1:n+m-1
%     Y(i)=0;
%     for j=1:m
%         if(i-j+1>0)
%             Y(i)=Y(i)+X(j)*H(i-j+1);
%         else
%         end
%     end
% end
% con=Y;
% end
