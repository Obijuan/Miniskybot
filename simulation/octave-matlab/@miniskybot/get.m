%%--------------------------------------------------------------------
%%--  Miniskybot Class
%%--  (c) Juan Gonzalez-Gomez (Obijuan)  juan@iearobotics.com
%%--  May, 2012. Robotics and Cybernetics group. UPM
%%----------------------------------------------------------------------
%%-- Released under the GPL license
%%----------------------------------------------------------------------

%%---------------------------------
%%-- Method: get 
%%-- Inputs: 
%%--   r: A Miniskybot object
%%--   f: a string with the name of the attribute to get
%%---------------------------------
function s = get (r, f)
  switch(f)
    case 'pose'
      s = r.pose;
    case 'v'
      s = r.v;
    case 'w'
      s= r.w;
    case 'vmax'
      s= r.vmax;
    case 'wmax'
      s= r.wmax;
  end
end


