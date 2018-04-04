clc; clear; close all;
N=4;
k=2;
T=10;
L= pi;
h1=T/N;
h2=L/N;
D = 0.1;
r=D*h1/(2*h2^2);
A= zeros(N,N);
for c=1:N
    for z=1:N
        if z==c
            A(z,c)= 1+2*r;
        elseif abs(z-c) ==1
            A(z,c) =-r;
        else
            A(z,c)=0;
        end
    end
end
A;
F= zeros(N,1);
for d= 1:N
    if d==1 
        F(d,1)= (1-2*r)*sin(k*(L/N)) + r*sin(k*(2*(L/N)));
    else
        F(d,1)= r*sin(k*(d-1)*(L/N))+(1-2*r)*sin(k*d*(L/N))+ r*sin(k*(d+1)*(L/N));
    end
end
F;
F_1= F(1:N-1,1);
A_1= A(1:N-1,1:N-1);
U1= A_1\F_1;
U1= [U1;0];
F_2= [(1-2*r)*U1(1)+r*U1(2); r*U1(1)+ (1-2*r)*U1(2)+ r*U1(3); r*U1(2)+(1-2*r)*U1(3); r*U1(3)];
U2= A\F_2;
F_3= [(1-2*r)*U2(1)+r*U2(2); r*U2(1)+ (1-2*r)*U2(2)+ r*U2(3); r*U2(2)+(1-2*r)*U2(3); r*U2(3)];
U3=A\F_3;
F_4= [(1-2*r)*U3(1)+r*U3(2); r*U3(1)+ (1-2*r)*U3(2)+ r*U3(3); r*U3(2)+(1-2*r)*U3(3); r*U3(3)];
U4= A\F_4;
x= h2:h2:pi;
u1= exp(-D*k^2*2.5)*sin(k*x);
u1=u1';
u2=exp(-D*k^2*5)*sin(k*x);
u2=u2';
u3=exp(-D*k^2*7.5)*sin(k*x);
u3=u3';
u4=exp(-D*k^2*10)*sin(k*x);
u4=u4';
error1= (1/N)*(abs((u1(1)-U1(1))/u1(1)) + abs((u1(2)-U1(2))/u1(2)) +abs((u1(3)-U1(3))/u1(3))+ abs((u1(4)-U1(4))/u1(4)))
error2= (1/N)*(abs((u2(1)-U2(1))/u2(1)) + abs((u2(2)-U2(2))/u2(2)) +abs((u2(3)-U2(3))/u2(3))+ abs((u2(4)-U2(4))/u2(4)))
error3= (1/N)*(abs((u3(1)-U3(1))/u3(1)) + abs((u3(2)-U3(2))/u3(2)) +abs((u3(3)-U3(3))/u3(3))+ abs((u3(4)-U3(4))/u3(4)))
error4= (1/N)*(abs((u4(1)-U4(1))/u4(1)) + abs((u4(2)-U4(2))/u4(2)) +abs((u4(3)-U4(3))/u4(3))+ abs((u4(4)-U4(4))/u4(4)))
figure(1)
subplot(2,2,1)
plot(x,u1,x,U1)
title('4 Nodes @ T=2.5')
subplot(2,2,2)
plot(x,u2,x,U2)
title('4 Nodes @ T=5')
subplot(2,2,3)
plot(x,u3,x,U3)
title('4 Nodes @ T=7.5')
subplot(2,2,4)
plot(x,u4,x,U4)
title('4 Nodes @ T=10')