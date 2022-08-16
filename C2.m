intensity=input('Enter the intenisity: ');
image=imread('cameraman.tif');
[m,n]=size(image);

for i=1:n
    for j=1:m
        if(image(i,j)==intensity)
            image(i,j)=intensity/4;
        end
    end
end
figure(2);
imshow(image);
  
            