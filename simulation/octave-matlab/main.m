robot = miniskybot();

%%-- Set the robot initial pose
robot = set(robot,'pose', [-100,-100,deg2rad(-30)]);

%%-- Set the robot velocities (normalized velocities, between -1 and 1)
robot = set(robot,'v',0.3);
robot = set(robot,'w',0.1);

%%-- total simulation time (in sec)
%%-- Setting total_time to a negative value will play the simulation
%%-- 'forever'
total_time = 5; 

%-- Determine how the simulation will be performed
%-- If show_robot is true, a triangle will be drawn show the robot current
%--   position and orientation
%-- If show_tray is true, the trayectory described by the robot is shown
%-- If both are FALSE, the simulation will be carried out at maximum speed
%--  and the final robot trayectory will be drawn
show_robot =true;
show_tray = true;


%-- Simulation step (in sec)
sstep = 0.01;

%-- Refresh time (in simulation time (sec))
refresh = 0.1; 

%-- Current simulation time
stime =0;

%-- Variables for storing the robot trayectory
r = get(robot,'pose');
tray_x = [r(1) ];
tray_y = [r(2) ];

while(stime<=total_time || total_time<0)
  %- Draw the robot
  hold off;
  if (show_robot)
    draw(robot);
    set_axis(500);
  end;

  %- Draw the trayectory
  if (show_tray)
    plot(tray_x,tray_y);
    set_axis(500);
  end;

  if (show_robot || show_tray)
    pause(0.001);
  end;
  
  %-- update the Robot's state
  for n=0:sstep:refresh
    robot=step(robot,sstep);

    %-- Increase the simulation time
    stime = stime + sstep;
  end

  %-- Store the current position vector
  %-- It is for drawing the trayectory
  r = get(robot,'pose');
  tray_x=[tray_x r(1)];
  tray_y=[tray_y r(2)];

end

%%-- Draw the trayectory and robot posses, when the user selected not
%%-- to shown them during simulation
if (not(show_robot) && not(show_tray))
  hold off;
  triangle(r);
    hold on;
  plot(tray_x,tray_y);
    set_axis(500);
end;



