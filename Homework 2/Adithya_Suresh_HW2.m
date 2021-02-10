%% Author - Adithya Suresh
%%% Assignment 2 - Problem 3

clear
clc
close all

figure(1)
left = imread('Left.jpg'); % For reading the left image
imshow(left);
% imtool(left); % To take the image pixel coordinates of left image

figure(2)
right = imread('Right.jpg'); % For reading the right image
imshow(right);
% imtool(right); % To take the image pixel coordinates of right image

%% Given data of X, Y, Z coordinate points:
% Global coordinate points from the question
X1 = 0;
Y1 = 0;
Z1 = 0;
X2 = 0;
Y2 = 35;
Z2 = 0;
X3 = 100;
Y3 = 35;
Z3 = 0;
X4 = 100;
Y4 = 0;
Z4 = 0;
X5 = 75;
Y5 = 0;
Z5 = -40;
X6 = 25;
Y6 = 0;
Z6 = -40;
X7 = 50;
Y7 = 0;
Z7 = -30;

%% Question 1: Use least square approach to find the 11 parameters for the left camera:
% Image coordinate points of left image from imtool function

u1l = 2396;
v1l = 2225;
u2l = 2178;
v2l = 2063;
u3l = 2818;
v3l = 1774;
u4l = 3048;
v4l = 1894;
u5l = 2873;
v5l = 2255;
u6l = 2562;
v6l = 2436;
u7l = 2730;
v7l = 2274;

% A matrix calculation:
Al = [X1 Y1 Z1 1 0 0 0 0 -u1l*X1 -u1l*Y1 -u1l*Z1;...
     0 0 0 0 X1 Y1 Z1 1 -v1l*X1 -v1l*Y1 -v1l*Z1;...
     X2 Y2 Z2 1 0 0 0 0 -u2l*X2 -u2l*Y2 -u2l*Z2;...
     0 0 0 0 X2 Y2 Z2 1 -v2l*X2 -v2l*Y2 -v2l*Z2;...
     X3 Y3 Z3 1 0 0 0 0 -u3l*X3 -u3l*Y3 -u3l*Z3;...
     0 0 0 0 X3 Y3 Z3 1 -v3l*X3 -v3l*Y3 -v3l*Z3;...
     X4 Y4 Z4 1 0 0 0 0 -u4l*X4 -u4l*Y4 -u4l*Z4;...
     0 0 0 0 X4 Y4 Z4 1 -v4l*X4 -v4l*Y4 -v4l*Z4;...
     X5 Y5 Z5 1 0 0 0 0 -u5l*X5 -u5l*Y5 -u5l*Z5;...
     0 0 0 0 X5 Y5 Z5 1 -v5l*X5 -v5l*Y5 -v5l*Z5;...
     X6 Y6 Z6 1 0 0 0 0 -u6l*X6 -u6l*Y6 -u6l*Z6;...
     0 0 0 0 X6 Y6 Z6 1 -v6l*X6 -v6l*Y6 -v6l*Z6;...
     X7 Y7 Z7 1 0 0 0 0 -u7l*X7 -u7l*Y7 -u7l*Z7;...
     0 0 0 0 X7 Y7 Z7 1 -v7l*X7 -v7l*Y7 -v7l*Z7];

% B matrix calculation:
Bl = [u1l;v1l;u2l;v2l;u3l;v3l;u4l;v4l;u5l;v5l;u6l;v6l;u7l;v7l];

% X = pinv(A)*B
xl = Al\Bl;   % 11 Parameters of the left camera

%% Question 2: Use least square approach to find the 11 parameters for the right camera:
% Image coordinate points of right image from imtool function

u1r = 1085;
v1r = 1652;
u2r = 1267;
v2r = 1525;
u3r = 1858;
v3r = 1729;
u4r = 1694;
v4r = 1891;
u5r = 1558;
v5r = 2078;
u6r = 1264;
v6r = 1949;
u7r = 1396;
v7r = 1953;

Ar = [X1 Y1 Z1 1 0 0 0 0 -u1r*X1 -u1r*Y1 -u1r*Z1;...
     0 0 0 0 X1 Y1 Z1 1 -v1r*X1 -v1r*Y1 -v1r*Z1;...
     X2 Y2 Z2 1 0 0 0 0 -u2r*X2 -u2r*Y2 -u2r*Z2;...
     0 0 0 0 X2 Y2 Z2 1 -v2r*X2 -v2r*Y2 -v2r*Z2;...
     X3 Y3 Z3 1 0 0 0 0 -u3r*X3 -u3r*Y3 -u3r*Z3;...
     0 0 0 0 X3 Y3 Z3 1 -v3r*X3 -v3r*Y3 -v3r*Z3;...
     X4 Y4 Z4 1 0 0 0 0 -u4r*X4 -u4r*Y4 -u4r*Z4;...
     0 0 0 0 X4 Y4 Z4 1 -v4r*X4 -v4r*Y4 -v4r*Z4;...
     X5 Y5 Z5 1 0 0 0 0 -u5r*X5 -u5r*Y5 -u5r*Z5;...
     0 0 0 0 X5 Y5 Z5 1 -v5r*X5 -v5r*Y5 -v5r*Z5;...
     X6 Y6 Z6 1 0 0 0 0 -u6r*X6 -u6r*Y6 -u6r*Z6;...
     0 0 0 0 X6 Y6 Z6 1 -v6r*X6 -v6r*Y6 -v6r*Z6;...
     X7 Y7 Z7 1 0 0 0 0 -u7r*X7 -u7r*Y7 -u7r*Z7;...
     0 0 0 0 X7 Y7 Z7 1 -v7r*X7 -v7r*Y7 -v7r*Z7];
Br = [u1r;v1r;u2r;v2r;u3r;v3r;u4r;v4r;u5r;v5r;u6r;v6r;u7r;v7r];
 
xr = Ar\Br;   % 11 Parameters of the right camera
 
%% Question 3: Calculate the coordinates (X, Y, Z) of other marked corners of the mold based on the two images:
% Image coordinate points for the other marked corners using imtool()

uleft_corner = [2394 3041 2543 2321 2700 2935 2887 2567 2499 2957];
vleft_corner = [2311 1965 2156 1997 1824 1954 2119 2294 2255 2007];
uright_corner = [1095 1701 1195 1378 1729 1562 1546 1246 1175 1605];
vright_corner = [1714 1956 1697 1561 1684 1839 1958 1833 1743 1917];

% Solving for coordinates of unmarked corners using least square approach:

for i = 1:length(uleft_corner)
    A_coordinate_corners = [xl(1)-xl(9)*uleft_corner(i) xl(2)-xl(10)*uleft_corner(i) xl(3)-xl(11)*uleft_corner(i);...
                  xl(5)-xl(9)*vleft_corner(i) xl(6)-xl(10)*vleft_corner(i) xl(7)-xl(11)*vleft_corner(i);...
                  xr(1)-xr(9)*uright_corner(i) xr(2)-xr(10)*uright_corner(i) xr(3)-xr(11)*uright_corner(i);...
                  xr(5)-xr(9)*vright_corner(i) xr(6)-xr(10)*vright_corner(i) xr(7)-xr(11)*vright_corner(i)];
    B_coordinate_corners = [uleft_corner(i)-xl(4);vleft_corner(i)-xl(8);uright_corner(i)-xr(4);vright_corner(i)-xr(8)];
    x_coordinate_corners(:,i) = A_coordinate_corners\B_coordinate_corners;  % global coordinates
end

%% Question 4: Calculate the dimensions of the bar (length, width, height) beside the mold:
% Image coordinate points for the bar using imtool function

uleft_bar = [2450 2472 2333 2254];
vleft_bar = [1828 846 872 843];
uright_bar = [2129 2135 2014 2109];
vright_bar = [1718 805 774 736];

% Solving for coordinates of the bar using least square approach:

for i = 1:length(uleft_bar)
    A_coordinate_bar = [xl(1)-xl(9)*uleft_bar(i) xl(2)-xl(10)*uleft_bar(i) xl(3)-xl(11)*uleft_bar(i);...
                  xl(5)-xl(9)*vleft_bar(i) xl(6)-xl(10)*vleft_bar(i) xl(7)-xl(11)*vleft_bar(i);...
                  xr(1)-xr(9)*uright_bar(i) xr(2)-xr(10)*uright_bar(i) xr(3)-xr(11)*uright_bar(i);...
                  xr(5)-xr(9)*vright_bar(i) xr(6)-xr(10)*vright_bar(i) xr(7)-xr(11)*vright_bar(i)];
    B_coordinate_bar = [uleft_bar(i)-xl(4);vleft_bar(i)-xl(8);uright_bar(i)-xr(4);vright_bar(i)-xr(8)];
    x_coordinate_bar(:,i) = A_coordinate_bar\B_coordinate_bar;  % global coordinates
end

% Calculation of length, width, and height of bar:

bar_length = abs((x_coordinate_bar(3,1) - x_coordinate_bar(3,2)));
bar_width = abs((x_coordinate_bar(1,2) - x_coordinate_bar(1,3)));
bar_height = abs((x_coordinate_bar(2,3) - x_coordinate_bar(2,4)));
fprintf('Length of the bar is %f mm \n',bar_length);
fprintf('Width of the bar is %f mm \n',bar_width);
fprintf('Height of the bar is %f mm \n',bar_height);

%% Question 5: Estimate the volume of the bottle:
% Image coordinates of bottle using imtool function

uleft_bottle = [1463 1664 1765 1415 1484];
vleft_bottle = [937 878 1781 380 398];
uright_bottle = [1724 1890 1960 1880 1832];
vright_bottle = [600 626 1370 177 199];

% Solving for coordinates of the bottle using least square approach:

for i = 1:length(uleft_bottle)
    A_coordinate_bottle = [xl(1)-xl(9)*uleft_bottle(i) xl(2)-xl(10)*uleft_bottle(i) xl(3)-xl(11)*uleft_bottle(i);...
                  xl(5)-xl(9)*vleft_bottle(i) xl(6)-xl(10)*vleft_bottle(i) xl(7)-xl(11)*vleft_bottle(i);...
                  xr(1)-xr(9)*uright_bottle(i) xr(2)-xr(10)*uright_bottle(i) xr(3)-xr(11)*uright_bottle(i);...
                  xr(5)-xr(9)*vright_bottle(i) xr(6)-xr(10)*vright_bottle(i) xr(7)-xr(11)*vright_bottle(i)];
    B_coordinate_bottle = [uleft_bottle(i)-xl(4);vleft_bottle(i)-xl(8);uright_bottle(i)-xr(4);vright_bottle(i)-xr(8)];
    x_coordinate_bottle(:,i) = A_coordinate_bottle\B_coordinate_bottle;  % global coordinates
end

% The bottle has the cylinder portion (bottom), and frustum portion (top)

% Cylinder portion:
bottle_radius = abs((x_coordinate_bottle(1,1)) - abs(x_coordinate_bottle(1,2)));
bottle_height = abs((x_coordinate_bottle(3,2)) - (x_coordinate_bottle(3,3)));
bottle_volume_cylinder_part = pi * (bottle_radius^2) * bottle_height;

% Frustum portion:
bottle_length_cone = (((x_coordinate_bottle(1,4) - x_coordinate_bottle(1,1))^2) + ((x_coordinate_bottle(2,4) - x_coordinate_bottle(2,1))^2) + ((x_coordinate_bottle(3,4) - x_coordinate_bottle(3,1))^2))^0.5;
bottle_height_cone = ((bottle_length_cone^2) - (bottle_radius^2))^0.5;
bottle_volume_cone_part = (pi * (bottle_radius^2) * (bottle_height_cone))/3;
bottle_total_volume = bottle_volume_cone_part + bottle_volume_cylinder_part;

bottle_radius_top_part = (((x_coordinate_bottle(1,4) - x_coordinate_bottle(1,5))^2) + ((x_coordinate_bottle(2,4) - x_coordinate_bottle(2,5))^2) + ((x_coordinate_bottle(3,4) - x_coordinate_bottle(3,5))^2))^0.5;
bottle_volume_frustum_portion = (pi * bottle_height_cone/3) * (bottle_radius^2 + (bottle_radius_top_part * bottle_radius) + bottle_radius_top_part^2);
bottle_volume_total = bottle_volume_cylinder_part + bottle_volume_frustum_portion;
bottle_volume = bottle_volume_total * 0.001;
fprintf('Volume of the bottle is %f ml \n',bottle_volume);