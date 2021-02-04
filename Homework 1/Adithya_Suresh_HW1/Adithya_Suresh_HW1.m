%%% Author - Adithya Suresh %%%
%%% Professor - Dr. Yunyi Jia %%%
%%% Homework 1 - 3rd problem solution %%%

clear all 
clc
%% Loading time data
load('st');
load('rt');
%% Data from question
x = [101,52,17,-15];
y = [16,21,53,159];
z = [207,302,350,208];
radiowave_speed = 300;
earth_radius = 6.378;
%% Time taken for individual satellite to receive the signal
time_diff = rt - st;
%% Function to calculate position of GPS unit
fun = @(a)((sqrt(((a(1)-x(1)).^(2))+((a(2)-y(1)).^(2))+((a(3)-z(1)).^(2)))-(radiowave_speed.*(time_diff(1)-a(4)))).^(2))...
 +((sqrt(((a(1)-x(2)).^(2))+((a(2)-y(2)).^(2))+((a(3)-z(2)).^(2)))-(radiowave_speed.*(time_diff(2)-a(4)))).^(2))...
 +((sqrt(((a(1)-x(3)).^(2))+((a(2)-y(3)).^(2))+((a(3)-z(3)).^(2)))-(radiowave_speed.*(time_diff(3)-a(4)))).^(2))...
 +((sqrt(((a(1)-x(4)).^(2))+((a(2)-y(4)).^(2))+((a(3)-z(4)).^(2)))-(radiowave_speed.*(time_diff(4)-a(4)))).^(2));

initial_data = [earth_radius,earth_radius,earth_radius,0];
A = [];
B = [];
C = [];
D = [];
E = [];
F = [];
func_variable = @equation;
GPS_position = fmincon(fun, initial_data, A, B, C, D, E, F, func_variable);
%% Output
fprintf('X coordinate position of the GPS is %f Mm \n',GPS_position(1));
fprintf('Y coordinate position of the GPS is %f Mm \n',GPS_position(2));
fprintf('Z coordinate position of the GPS is %f Mm \n',GPS_position(3));
fprintf('Clock difference between GPS unit clock and Satelite system clock is %f s \n',GPS_position(4));