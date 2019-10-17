% plot the bins and the packing result
function plotpacking(bins)
% close all;
for i=1:length(bins)
    bin=bins(i);
    figure;
    hold on;
    cube_plot([0,0,0],bin.d,bin.w,bin.h,'none',.1);
    cmap = hsv(length(bin.boxspaces));
    for j=1:length(bin.boxspaces)
        bspace=bin.boxspaces(j);
        origin=[bspace.minx bspace.miny bspace.minz];
        x=bspace.maxx-bspace.minx;
        y=bspace.maxy-bspace.miny;
        z=bspace.maxz-bspace.minz;
        cube_plot(origin,x,y,z,cmap(j,:),0.9);
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
    view(120,30);
    hold off;

end
end