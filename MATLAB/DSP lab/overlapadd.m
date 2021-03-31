clear
clc
x=input('enter x:');
h=input('enter h:');
subplot(3,1,1);
stem(0:length(x)-1,x);
xlabel('n---->');
ylabel('x(n)--->');
title('Input sequence');
subplot(3,1,2);
stem(0:length(h)-1,h);
xlabel('n---->');
ylabel('h(n)--->');
title('Impulse response sequence');
display('The fast convolution result using overlap-add method is:')
y=fftfilt(h,x)
subplot(3,1,3);
stem(0:length(y)-1,y);
xlabel('n---->');
ylabel('y(n)--->');
title('Fast Convolution using Overlap-Add method');