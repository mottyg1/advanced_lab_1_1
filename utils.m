function funs = makefuns
  funs.fun1=@fun1;
  funs.fun2=@fun2;
end

function y=fun1(x)
  y=x;
end

function z=fun2
  z=1;
end