%%--------------------------------------------------------------------
%%--  Miniskybot Class
%%--  (c) Juan Gonzalez-Gomez (Obijuan)  juan@iearobotics.com
%%--  May, 2012. Robotics and Cybernetics group. UPM
%%----------------------------------------------------------------------
%%-- Released under the GPL license
%%----------------------------------------------------------------------

%%---------------------------------
%%-- Method: display
%%-- Inputs: 
%%--   r: A Miniskybot object
%%-- Print information about the robot object
%%---------------------------------

function display (r)
  fprintf('%s = \n', inputname(1));
  fprintf('  Pose: '); disp(r.pose);
  fprintf('  v: ');    disp(r.v);
  fprintf('  w: ');    disp(r.w);
end

