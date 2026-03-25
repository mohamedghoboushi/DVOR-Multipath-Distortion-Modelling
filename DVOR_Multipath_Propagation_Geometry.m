clc
clear

DVOR = [0 0];
reflector = [200 100];
aircraft = [800 500];


figure
plot(DVOR(1),DVOR(2),'ro','MarkerSize',10,'LineWidth',2)
hold on
plot(reflector(1),reflector(2),'ks','MarkerSize',10,'LineWidth',2)
plot(aircraft(1),aircraft(2),'b^','MarkerSize',10,'LineWidth',2)

plot([DVOR(1) aircraft(1)],[DVOR(2) aircraft(2)],'b','LineWidth',2)
plot([DVOR(1) reflector(1) aircraft(1)],[DVOR(2) reflector(2) aircraft(2)],'r--','LineWidth',2)

text(DVOR(1)+10,DVOR(2),'DVOR Station')
text(reflector(1)+10,reflector(2),'Reflector')
text(aircraft(1)+10,aircraft(2),'Aircraft')

xlabel('Distance (m)')
ylabel('Distance (m)')
title('DVOR Multipath Propagation Geometry')
legend('DVOR','Reflector','Aircraft','Direct Path','Reflected Path')
grid on
axis equal