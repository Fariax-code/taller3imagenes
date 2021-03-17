%Taller 3 
%Integrantes: Santiago Farias- Gabriela Rojas
I = imread('img1.png');
IG = rgb2gray(I);

imshow(IG);

n=3;

mascara = ones(n);

IGm=padarray(IG,[1 1],0,'both');


IG2=IGm(1:3,1:3);

IG2=double(IG2);

IG3= IG2.* mascara;

C=sum(IG3,'all');

IG4(1,1)=C;

[z,y] = find(IGm==53);

filtro=arrayfun(@(x) calfiltro(IGm),IGm);



function calfiltro(IGr)

if IGr ~= 0
  [z,y] = find(IGr);
  M(1,1)=x(z+1,y+1);
end

end

