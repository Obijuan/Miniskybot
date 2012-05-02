function r = miniskybot()

  %%-- All the units are in mm
  
  %%-----------------------------------
  %%-- Attributes
  %%-----------------------------------

  %%-- Robot pose: x,y,theta. Theta is the orientation (in degrees)
  r.pose = [0 0 0]';


  %%-- Geometric attributes
  %%-- Wheels radious (mm)
  r.wheel_rad = 58/2;
  %%-- Distance betwen the wheels and the center of mass (mm)
  r.l = 88/2;

  %%-- Maximum servo angular speed (rad/seg)
  r.wheel_wmax = deg2rad(360);

  %%-- Maximum robot angular and linear velocities
  r.vmax = r.wheel_rad/2 * r.wheel_wmax; %%-- mm/sec
  r.wmax = r.vmax/r.l;                   %%-- rad/sec

  %%-- Current Linear and angular velocities (normalized values)
  %%-- v in [-1,1], w in [-1,1]
  r.v =0;
  r.w =0;

  %%-- Create and return the object
  r = class(r, 'miniskybot');
   
end

