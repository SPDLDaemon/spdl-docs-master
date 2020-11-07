clear;
close all;

x = linspace(-1,1,1000);
d = 0.1;

db = deadband(x, d);

sdb = scaledDB(x, @deadband, d);

plot(x, x, x, deadband(x,d));
xlabel('Input');
ylabel('Output');
axis square