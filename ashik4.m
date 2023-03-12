clc;
clear all;
close all;
a=45;
t=0:2*pi/50:2*pi;
x=a*sin(t);
l=length(x);
plot(x,'r');
delta=4.5;
hold on
xn=0;
for i=1:l;
if x(i)>xn(i)
d(i)=1;
xn(i+1)=xn(i)+delta;
else
d(i)=0; xn(i+1)=xn(i)-delta;
end
end
stairs(xn) %Modulation part
hold on
for i=1:d
if d(i)>xn(i)
d(i)=0;
xn(i+1)=xn(i)-delta;
else
d(i)=1; xn(i+1)=xn(i)+delta; %demodulation part
end
end
plot(xn,'c'); %plot delta graph