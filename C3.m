intensity=input('Enter the intenisity values: ');
intensity_changed=input('Enter the intenisity values to which they should be changed: ');
image=imread('cameraman.tif');
[m,n]=size(image);
[q,p]=size(intensity);
for i=1:n
    for j=1:m
        for k=1:p
            if(image(i,j)==intensity(k))
                image(i,j)=intensity_changed(k);
            end
        end
    end
end
figure(1);
imshow(image);
  
            