
A=[3 2 1];
B = [2 3 1];
Bc = arrayfun(@(ii)B(:,:,ii)/eye(3),reshape(1:size(B,3),1,1,[]),'un',0);

matrix=arrayfun()