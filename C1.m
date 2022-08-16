intensity=input('Enter the intenisity: ');
image=imread('cameraman.tif');
[m,n]=size(image);
temp=ones(m,n);170

for i=1:n
    for j=1:m
        if(image(i,j)==intensity)
            temp(i,j)=0;
        end
    end
end
figure(1);
imshow(temp);
  
            