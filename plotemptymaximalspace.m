function plotemptymaximalspace(emses)
figure;
hold on;
% cube_plot([0,0,0],100,100,100,'none',.1);
cmap = hsv(length(emses));
for i=1:length(emses)
    ems=emses(i);
    origin=[ems.minx ems.miny ems.minz];
    x=ems.maxx-ems.minx;
    y=ems.maxy-ems.miny;
    z=ems.maxz-ems.minz;
    cube_plot(origin,x,y,z,cmap(i,:),0.8);
end
% Set the axis with equal unit.
axis equal;
% Show grids on the plot
grid on;
% Set the lable and the font size
xlabel('X','FontSize',18);
ylabel('Y','FontSize',18)
zlabel('Z','FontSize',18)
% Set the color as transparient
material metal
% alpha(0.2);
alphamap('rampup');
% Set the view point
view(30,30);
hold off;
end