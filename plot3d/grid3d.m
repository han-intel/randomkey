[X,Y] = meshgrid(-3:.5:3);
Z = 2 * X.^2-3 * Y.^2;
subplot(2,2,1)
plot3(X,Y,Z)
title('plot3')
subplot(2,2,2)
mesh(X,Y,Z)
title('mesh')
subplot(2,2,3)
meshc(X,Y,Z)
title('meshc')
subplot(2,2,4)
meshz(X,Y,Z)
title('meshz')
set(gcf,'Color','w');