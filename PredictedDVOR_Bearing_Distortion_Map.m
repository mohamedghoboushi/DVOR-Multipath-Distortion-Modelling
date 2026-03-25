 clc
clear

% System parameters
fc = 113.2e6;
c = 3e8;
lambda = c/fc;
k = 2*pi/lambda;

Ad = 1;      % direct signal amplitude
Ai = 0.1;    % reflected signal amplitude

% Reflector position
xr = 300;
yr = 200;

% Spatial grid
[x,y] = meshgrid(-4000:100:4000,-4000:100:4000);

% Direct path
Ld = sqrt(x.^2 + y.^2);

% Reflected path
Li = sqrt((x-xr).^2 + (y-yr).^2) + sqrt(xr^2 + yr^2);

% Phase difference
dphi = k*(Li - Ld);

% Bearing error model
theta_e = (Ai/Ad)*sin(dphi);

% Plot
figure
contourf(x/1000,y/1000,theta_e,30)
colorbar

xlabel('Distance (km)')
ylabel('Distance (km)')
title('Predicted DVOR Bearing Distortion Map')

hold on
plot(0,0,'rp','MarkerSize',12,'MarkerFaceColor','r')
text(0.1,0.1,'DVOR')

plot(xr/1000,yr/1000,'ks','MarkerSize',10,'MarkerFaceColor','k')
text(xr/1000+0.1,yr/1000,'Reflector')

axis equal
grid on
set(gca,'FontSize',12)
