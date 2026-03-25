 az = [0 30 60 90 120 150 180 210 240 270 300 330];
err = [0.10 0.08 0.05 0.02 0.00 -0.04 -0.06 -0.05 -0.02 0.01 0.04 0.07];

phi = deg2rad(az);

N = length(phi);

a1 = (2/N)*sum(err.*cos(phi));
b1 = (2/N)*sum(err.*sin(phi));

A = sqrt(a1^2 + b1^2);
phi_r = atan2(b1,a1);

phi_fit = linspace(0,2*pi,360);
err_fit = A*sin(phi_fit - phi_r);

figure
plot(az,err,'ro','MarkerSize',8,'LineWidth',2)
hold on
plot(rad2deg(phi_fit),err_fit,'b','LineWidth',2)

xlabel('Azimuth (deg)')
ylabel('Bearing Error (deg)')
title('Harmonic Model Fitting for Reflector Estimation')
legend('Measured Data','Fitted Harmonic Model')
grid on
