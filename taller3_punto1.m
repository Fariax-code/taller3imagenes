%Taller 3 
%Integrantes: Santiago Farias- Gabriela Rojas
I = imread('img1.png');
IG = rgb2gray(I);

IGm=padarray(IG,[5 5],0,'both');

ar=double(IGm(:,:,1));
s=size(IGm);
arc=IGm*0;


n=9;
mascara = ones(n);
gauss= [1 4 7 4 1,4 16 26 16 4, 7 26 41 26 7, 4 16 26 16 4,1 4 7 4 1]/273;




for i=5:s(1)-4
    for j= 5:s(2)-4
    ventana=ar(i-4:i+4, j-4:j+4);
    prod=ventana .* (mascara/81);
    pix=sum(sum(prod));
    arc(i,j)=pix;
    end
end


figure(1)
subplot(1,2,1)
imshow(IG);
subplot(1,2,2)
imshow(arc);



% IG2=IGm(1:3,1:3);
% IG2=double(IG2);
% IG3= IG2.* mascara;
% C=sum(IG3,'all');

% IG4(1,1)=C;
% 
% [z,y] = find(IGm==53);

% filtro = arrayfun(@(x1)calfiltro(x1), IGm);

% function v=calfiltro(x)
% 
% % 
% % v=x+150;
% 
% % z=unit8(b);
% if x ~= 0
% 
% [fila,colum] = find(x);
% 
%   m(1,1)= x(fila-1+z,colum-1+z);
%   m(1,2)= x(fila-1+z,colum+z);
%   m(1,3)= x(fila-1+z,colum+1+z);
%   
%   m(2,1)= x(fila+z,colum-1+z);
%   m(2,2)= x(fila+z,colum+z);
%   m(2,3)= x(fila+z,colum+1+z);
%   
%   m(3,1)= x(fila+1+z,colum-1+z);
%   m(3,2)= x(fila+1+z,colum+z);
%   m(3,3)= x(fila+1+z,colum+1+z);
%   
%   multi=m.*mascara;
%   
%   suma=sum(multi,'all');
%  
%   v=suma;
% else
%     v=x;
% end
% 
% % if IGr ~= 0
% %   [z,y] = find(IGr);
% %   M(1,1)=x(z+1,y+1);
% % end
% 
% end

