function s = step(r, st)
  s = r;

  %-- Get the current robot orientation
  theta = r.pose(3);

  %-- Calculate the Transformation matrix
  %-- from the local to global frame
  Rz = [
     cos(theta) -sin(theta) 0;
     sin(theta) cos(theta) 0;
     0             0       1;
  ];

  %-- Velocity vector in the local robot frame
  %-- It is obtained from the v and w robot parameters
  %-- Set by the user
  %-- v and w are normalized (-1,1), so they should be multiplied by
  %-- vmax and wmax
  vr = [r.v*r.vmax 0 r.w*r.wmax]';

  %-- Velocity vector in the global frame
  vi = Rz*vr; 

  %-- update the Robot's state
  %-- The new position vector is calculated from the velocity
  s.pose = r.pose + vi.*st;

end
