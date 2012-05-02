function display (r)
  fprintf('%s = \n', inputname(1));
  fprintf('  Pose: '); disp(r.pose);
  fprintf('  v: ');    disp(r.v);
  fprintf('  w: ');    disp(r.w);
end

