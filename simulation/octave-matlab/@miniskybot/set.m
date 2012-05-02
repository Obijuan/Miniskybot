%%--------------------------------------------------------------------
%%--  Miniskybot Class
%%--  (c) Juan Gonzalez-Gomez (Obijuan)  juan@iearobotics.com
%%--  May, 2012. Robotics and Cybernetics group. UPM
%%----------------------------------------------------------------------
%%-- Released under the GPL license
%%----------------------------------------------------------------------

%%---------------------------------
%%-- Method: set
%%--   Set one attribute
%%-- Inputs: 
%%--   r: A Miniskybot object
%%---------------------------------

function s = set (p, varargin)
  s = p;
  prop = varargin{1};
  val = varargin{2};
  if (strcmp(prop,'pose'))
    s.pose(1) = val(1);
    s.pose(2) = val(2);
    s.pose(3) = val(3);
  elseif (strcmp(prop,'v'))
    s.v = val;
  elseif (strcmp(prop,'w'))
    s.w = val;
  end       
end

