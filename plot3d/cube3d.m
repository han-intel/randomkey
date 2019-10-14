 X = [0;1;1;0;0];
 Y = [0;0;1;1;0];
 Z = [0;0;0;0;0];
 figure;
 hold on;
 plot3(X,Y,Z);   % draw a square in the xy plane with z = 0
 plot3(X,Y,Z+1); % draw a square in the xy plane with z = 1
 set(gca,'View',[-28,35]); % set the azimuth and elevation of the plot
 for k=1:length(X)-1
    plot3([X(k);X(k)],[Y(k);Y(k)],[0;1]);
 end
 scatter3(rand(10,1),rand(10,1),rand(10,1),'g');