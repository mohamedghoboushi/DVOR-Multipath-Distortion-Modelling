phi = linspace(0,2*pi,360);

A1 = 0.02;
A2 = 0.05;
A3 = 0.1;

err1 = A1*sin(phi);
err2 = A2*sin(phi);
err3 = A3*sin(phi);

figure
plot(rad2deg(phi),err1,'LineWidth',2)
hold on
plot(rad2deg(phi),err2,'LineWidth',2)
plot(rad2deg(phi),err3,'LineWidth',2)

xlabel('Azimuth (deg)')
ylabel('Bearing Error (deg)')
title('Effect of Reflection Amplitude on Bearing Error')
legend('A=0.02','A=0.05','A=0.1')
grid on