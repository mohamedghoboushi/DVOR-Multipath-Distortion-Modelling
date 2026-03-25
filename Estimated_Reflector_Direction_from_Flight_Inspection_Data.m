clc
clear

% Estimated reflector direction (deg)
phi_r = 0;  

% Assumed reflector distance
R = 500;

% Convert to radians
phi = deg2rad(phi_r);

% Reflector coordinates
xr = R*cos(phi);
yr = R*sin(phi);

figure

% Plot DVOR
plot(0,0,'rp','MarkerSize',12,'MarkerFaceColor','r')
hold on

% Plot reflector
plot(xr,yr,'ks','MarkerSize',10,'MarkerFaceColor','k')

% Plot direction line
plot([0 xr],[0 yr],'b','LineWidth',2)

text(0,50,'DVOR Station')
text(xr+20,yr,'Estimated Reflector')

xlabel('Distance (m)')
ylabel('Distance (m)')
title('Estimated Reflector Direction from Flight Inspection Data')

grid on
axis equal
set(gca,'FontSize',12)