clf;
figure(1);
% Use hold on and hold off to plot multiple cubes
hold on;
% Call the function to plot a cube with dimension of X, Y, Z, at point [x,y,z].
cube_plot([0,0,0],3,5,3,'none',.1);
cube_plot([0,0,0],1,1,1);
cube_plot([0,1.1,0],1,1,1,'b');
% Figure configurations
% Define the range of x-axis, y-axis, and z-axis in form of
% [xmin,xmax,ymin,ymax,zmin,zmax].
% axis([0,1,0,1,0,1]);
% Set the axis with equal unit.
axis equal;
% Show grids on the plot
grid on;
% Set the lable and the font size
xlabel('X','FontSize',18);
ylabel('Y','FontSize',18)
zlabel('Z','FontSize',18)
% Control the ticks on the axises
% h = gca; % Get the handle of the figure
% h.XTick = 0:0.5:1;
% h.YTick = 0:0.5:1;
% h.ZTick = 0:0.5:1;
% Set the color as transparient
material metal
% alpha(0.2);
alphamap('rampup');
% Set the view point
view(30,30);
hold off;
% plot the figure in the form of eps with 600 ppi named 'filename'
% print(gcf,'-depsc2','-r600','filename.eps')