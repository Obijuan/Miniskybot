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

