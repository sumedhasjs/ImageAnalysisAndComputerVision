user_input=input('Enter the constant to be added: ');

image1=imread('cameraman.tif');
figure(1);
imshow(image1);

constant=int8(user_input);
[m,n]=size(image1);
image2=ones(m,n);
for i=1:n
    for j=1:m
        image2(i,j)=constant;
    end
end
image2=cast(image2,'uint8');
figure(2);
imshow(image2);

final=imadd(image1,image2);

for i=1:n
    for j=1:m
        final(i,j)=image1(i,j)*image2(i,j);
        if(final(i,j)>255)
            final(i,j)=255;
        end
    end
end
final=cast(final,'uint8');
figure(3);
imshow(final);