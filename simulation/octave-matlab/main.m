%%--------------------------------------------------------------------
%%--  octave/matlab simulation of the kinematics of the Miniskybot robot
%%--  (c) Juan Gonzalez-Gomez (Obijuan)  juan@iearobotics.com
%%--  May, 2012. Robotics and Cybernetics group. UPM
%%----------------------------------------------------------------------
%%-- Released under the GPL license
%%----------------------------------------------------------------------
%%-- How to run the simulation: just set the initial variables:
%%---  Pose: (x,y) posicion and robot orientation
%%--   Robot velocities:  v: linear velocity (in robot frame)
%%--                      w: Angular velocity (in robot frame)
%%--  You can also configure more parameters of the simulation as the 
%%--  total simulation time, simulation step, refresh time and so on
%%----------------------------------------------------------------------

%%-- Create a miniskybot to simulate
robot = miniskybot();

%%-- Set the robot initial pose. (x,y) in mm, orientation in radians
%%-- (for that reason i have used the deg2rad() function)
robot = set(robot,'pose', [-100,-100,deg2rad(-30)]);

%%-- Set the robot velocities (normalized velocities, between -1 and 1)
%%-- v is the linear velocity
%%-- w is the angular velocity
robot = set(robot,'v',0.5);
robot = set(robot,'w',0.2);

%%-- total simulation time (in sec)
%%-- Setting total_time to a negative value will play the simulation
%%-- 'forever'
total_time = 10; 

%-- Determine how the simulation will be performed
%-- If show_robot is true, the sketch of the miniskybot is drawn so that
%-- the user can see the position and orientation
%-- If show_tray is true, the trayectory described by the robot is shown
%-- If both are FALSE, the simulation will be carried out at maximum speed
%--  and the final robot trayectory will be drawn
show_robot =true;
show_tray = true;


%-- Simulation step (in sec)
sstep = 0.01;

%-- Refresh time (in simulation time (sec))
%-- If the robot is moving too fast, decrease this value.
%-- In my linux laptop with octave I use: refresh = 0.2
%-- With matlab I use: refresh = 0.02
refresh = 0.2;  %%-- Too fast in matlab! If using matlab change it! 

%-- Current simulation time
stime =0;

%-- Variables for storing the robot trayectory
r = get(robot,'pose');
tray_x = [r(1) ];
tray_y = [r(2) ];


%%-- Simulation main loop
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

%%-- End of simulation
%%-- Draw the trayectory and robot posses, if the user selected not
%%-- to shown them during simulation
if (not(show_robot) && not(show_tray))
  hold off;
  triangle(r);
    hold on;
  plot(tray_x,tray_y);
    set_axis(500);
end;



