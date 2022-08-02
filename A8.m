m=input('Enter number of rows: ');
n=input('Enter number of columns: ');
A=ones(m,n);
for i=1:n
    for j=1:m
        temp1=floor((i-1)/(m/2));
        temp2=floor((j-1)/(n/2));
        if (rem(temp1,2)==0 && rem(temp2,2)==1)||(rem(temp1,2)==1 && rem(temp2,2)==0)
            A(i,j)=0;
        end
    end
end
imshow(A);