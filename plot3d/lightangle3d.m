sphere(25);
axis vis3d
h = light;
for az = -50:10:50
    lightangle(h,az,30)
    pause(.2)
end