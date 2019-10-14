t = 0:pi/10:2*pi;
[X1,Y1,Z1] = cylinder(2 + cos(t));
subplot(2,3,1);surf(X1,Y1,Z1)
axis square;title('?????');
subplot(2,3,2);sphere
axis equal;title('????');
x1 = [1 3 0.5 2.5 2];
explode = [0 1 0 0 0];
subplot(2,3,3);pie3(x1,explode)
title('????');axis equal;
X2 = [0 1 1 2;1 1 2 2;0 0 1 1];
Y2 = [1 1 1 1;1 0 1 0;0 0 0 0];
Z2 = [1 1 1 1;1 0 1 0;0 0 0 0];
C = [0.5000 1.0000 1.0000 0.5000;
     1.0000 0.5000 0.5000 0.1667;
     0.3330 0.3330 0.5000 0.5000];
subplot(2,3,4);fill3(X2,Y2,Z2,C);
colormap hsv
title('?????');axis equal;
[x2,y2] = meshgrid(-3:.5:3,-3:.1:3);
z2 = peaks(x2,y2);
subplot(2,3,5);ribbon(y2,z2)
colormap hsv
title('?????');axis equal;
[X3,Y3] = meshgrid(-2:0.25:2,-1:0.2:1);
Z3 = X3 .* exp(-X3.^2 - Y3.^2);
[U,V,W] = surfnorm(X3,Y3,Z3);
subplot(2,3,6);quiver3(X3,Y3,Z3,U,V,W,0.5);
hold on 
surf(X3,Y3,Z3);
colormap hsv
view(-35,45);
title('??????');axis equal;
set(gcf,'Color','w');