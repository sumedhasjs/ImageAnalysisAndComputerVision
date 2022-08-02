%BW
m=input('Enter number of rows: ');
n=input('Enter number of columns: ');
A=ones(m,n);
for i=1:n
    for j=1:m/2
        A(i,j)=0;
    end
end
imshow(A);