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


