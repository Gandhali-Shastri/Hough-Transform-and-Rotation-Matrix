% http://www.euclideanspace.com/maths/geometry/rotations/conversions/matrixToAngle/

function [A, theta] = get_axisangle(R)

% R = [1 0 0; 0, 0, -1; 0, 1, 0];

epsilon1 = 0.01;
epsilon2 = 0.1;

% simplify(R.'*R)
determinant = det(R);

if (determinant == 1)
  
    if abs((R(1,2) - R(2,1)) < epsilon1) && abs((R(1,3) - R(3,1)) < epsilon1) && abs((R(2,3) - R(3,2)) < epsilon1)
        if (abs(R(1,2) + R(2,1)) < epsilon2) && abs((R(1,3) + R(3,1)) < epsilon2) && ((R(2,3) + R(3,2)) < epsilon2 &&... 
            abs(R(1,1) + R(2,2) + R(3,3) -3) < epsilon2)
            
            A =[1,0,0];
            theta = 0;
            return;
        end
        
        ang = pi;
        xx = (R(1, 1) + 1)/2;
		yy = (R(2, 2) + 1)/2;
		zz = (R(3, 3) + 1)/2;
		xy = (R(1, 2) + R(2, 1))/4;
		xz = (R(1, 3) + R(3, 1))/4;
		yz = (R(2, 3) + R(3, 2))/4;
        
        if ((xx > yy) && (xx > zz)) 
			if (xx< epsilon1)
				x = 0;
				y = 0.7071;
				z = 0.7071;
			 else 
				x = sqrt(xx);
				y = xy/x;
				z = xz/x;
            end
        elseif (yy > zz) 
			if (yy< epsilon1)
				x = 0.7071;
				y = 0;
				z = 0.7071;
			else 
				y = sqrt(yy);
				x = xy/y;
				z = yz/y;
            end
		else 
			if (zz< epsilon1) 
				x = 0.7071;
				y = 0.7071;
				z = 0;
			else 
				z = sqrt(zz);
				x = xz/z;
				y = yz/z;
            end
        end
        A = [x,y,z];
        theta = ang;
        disp('2nd if');
%         disp(A);
%         disp(theta);
    end
   
    s = sqrt(R(3,2) - R(2, 3) * R(3,2)- R(2,3)...
        + R(1,3) - R(3, 1) * R(1,3)- R(3,1)...
        + R(2,1) - R(1, 2) * R(2,1)- R(1,2));
    
    x = abs(s);
    if (x < 0.001)
        s=1; 
    end
    
    ang = acos((R(1, 1) + R(2,2) + R(3,3) - 1)/2);
	x = (R(3,2) - R(2,3))/s;
	y = (R(1,3) - R(3,1))/s;
	z = (R(2,1) - R(1,2))/s;
     
    A = [x,y,z];
    disp('Axis'); disp(A);
%     converting to degrees
    theta = (ang * 180)/pi; 
    disp('Angle'); disp(theta);
    
end