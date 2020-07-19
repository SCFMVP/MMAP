clc;
clear all;
%% ��֪����
z=[-5 -2 0]';
p=[-1 -3 -4+i*3 -4-i*3]';
k=5;
t=0:0.001:8;
%% ���ݺ���
% G=zpk(z,p,k)
[num,den]=zp2tf(z,p,k);
G=tf(num,den)
%% ��λ��Ծ��Ӧ
% step(num,den)
% step(G)
figure(1);
subplot(121);
y=step(t,G);
plot(t, y,'g-','linewidth',1);
title('��λ��Ծ��Ӧ');
xlabel('T/s');ylabel('����');
grid on;box on;

%% ��λ�����Ӧ
% y = impulse(num,den);
y = impulse(G,0:0.001:8);
subplot(122);
plot(t, y,'r-','linewidth',1);
grid on;box on;
title('��λ�����Ӧ');
xlabel('T/s');ylabel('����');