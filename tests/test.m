x = 32 ; y = 86;
if x > y
    'x ���� y'
elseif  x < y
    'x С�� y'
elseif x == y
   ' x ����y'
else 'error'
end

for i = 1:1:5
    disp(i);
end

while i > 0;
    disp(i);
    i = i - 1;
end

x = -pi:.1:pi;
y1 = sin(x);
y2 = cos(x);
figure(1)
subplot(2,1,1)
plot(x,y1)
title('��ͼ�Ļ�������')
grid on
