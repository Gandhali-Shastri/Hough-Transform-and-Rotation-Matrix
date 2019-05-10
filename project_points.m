function Pc = project_points(Pw,R,t)


% R = [0,-1,0;1,0,0;0,0,1];
% t =[1, 2.5, 0];
C = -R'.*t

K =[200 0 50;
    0 200 50;
    0 0 1];  %Intrinsic Parameter Matrix.

M = K*R;

P = M  .* Pw
disp(P)

% x = P.*Pw

end