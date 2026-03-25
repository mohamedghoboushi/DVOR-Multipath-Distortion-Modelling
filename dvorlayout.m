
figure
theta = linspace(0,2*pi,48);
R = 1;

% Sideband antennas
plot(R*cos(theta), R*sin(theta),'ko','MarkerFaceColor','k'); hold on

% Central antenna
plot(0,0,'rs','MarkerFaceColor','r')

% Azimuth reference
quiver(0,0,1.2,0,'LineWidth',1.5,'MaxHeadSize',0.5)

axis equal
grid on
xlabel('X (normalized)')
ylabel('Y (normalized)')
title('DVOR System Layout and Azimuth Reference')
legend('Sideband Antennas','Central Antenna','Azimuth Reference')