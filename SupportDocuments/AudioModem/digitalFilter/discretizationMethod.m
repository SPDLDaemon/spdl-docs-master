%% Clean up
clear;
close all;

%% Data
t = linspace(0,5,500);
s = sin(2*pi*0.2*t);

ts_t = linspace(0,5,15);
ts_s = sin(2*pi*0.2*ts_t);
ts_r = round(ts_s*4)/4;

hold all;
plot(t,s,'-',ts_t, ts_s, 'o', ts_t, ts_r, 'o');
plot([0;5], [-1 -.75 -.5 -.25 0 .25 .5 .75 1;-1 -.75 -.5 -.25 0 .25 .5 .75 1]);
ylim([-1.1 1.1]);