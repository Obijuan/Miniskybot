%%--------------------------------------------------------------------
%%--  Miniskybot Class
%%--  (c) Juan Gonzalez-Gomez (Obijuan)  juan@iearobotics.com
%%--  May, 2012. Robotics and Cybernetics group. UPM
%%----------------------------------------------------------------------
%%-- Released under the GPL license
%%----------------------------------------------------------------------

%%---------------------------------
%%-- Method: Draw
%%-- Input: A Miniskybot object
%%-- Draw the miniskybot on the screen
%%---------------------------------
function draw(r)

%%-- Transformation matrix for drawing the robot
c=cos(r.pose(3));
s=sin(r.pose(3));
T=[ c, -s, 0 r.pose(1);
    s,  c, 0 r.pose(2);
    0,  0, 1 0;
    0   0  0 1
];

%%-- Robot data. These points define the robot shape in its home state
%%-- Robot wheels
p1 = [-r.wheel_rad  r.l-3     0  1];
p2 = [r.wheel_rad   r.l-3     0  1];
p3 = [-r.wheel_rad  -r.l+3    0  1];
p4 = [r.wheel_rad   -r.l+3    0  1];

%%-- Robot Body
p5  = [-38   58/2    0  1];
p6  = [34    58/2    0  1];
p7  = [34     8      0  1];
p8  = [34+10  0      0  1];
p9  = [34    -8      0  1];
p10 = [34   -58/2    0  1];
p11 = [-38  -58/2    0  1];

%%-- Wheel axes
p12 = [0 r.l-3    0  1];
p13 = [0 58/2   0  1];
p14 = [0 -r.l+3   0  1];
p15 = [0 -58/2  0  1];

%%-- Calculate the robot pose according to the
%%-- the parameters given (x,y,theta)
P1 = T*p1';
P2 = T*p2';
P3 = T*p3';
P4 = T*p4';
P5 = T*p5';
P6 = T*p6';
P7 = T*p7';
P8 = T*p8';
P9 = T*p9';
P10 = T*p10';
P11 = T*p11';
P12 = T*p12';
P13 = T*p13';
P14 = T*p14';
P15 = T*p15';

%%-- convert the points into two list with the x and y coordinates
%%-- It is necesarry for ploting
x_w1 = [P1(1) P2(1)];
y_w1 = [P1(2) P2(2)];
x_w2 = [P3(1) P4(1)];
y_w2 = [P3(2) P4(2)];

x_body = [P5(1) P6(1) P7(1) P8(1) P9(1) P10(1) P11(1) P5(1)];
y_body = [P5(2) P6(2) P7(2) P8(2) P9(2) P10(2) P11(2) P5(2)];

x_w1_axis = [P12(1) P13(1)];
y_w1_axis = [P12(2) P13(2)];

x_w2_axis = [P14(1) P15(1)];
y_w2_axis = [P14(2) P15(2)];

%%-- Draw left wheel
plot(x_w1, y_w1,'g','linewidth',6);
hold on;

%%-- Draw right wheel
plot(x_w2, y_w2,'g','linewidth',6);

%%-- Draw robot body
plot(x_body, y_body, 'b', 'linewidth',2);
plot(x_w1_axis, y_w1_axis,'b','linewidth',6);
plot(x_w2_axis, y_w2_axis,'b','linewidth',6);


