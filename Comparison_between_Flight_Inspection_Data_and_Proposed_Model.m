clear
clc

az_flight = [0 30 60 90 120 150 180 210 240 270 300 330 360];
err_flight = [0.1 0.08 0.05 0.02 0.0 -0.04 -0.06 -0.05 -0.02 0.01 0.04 0.07 0.1];

az = 0:360;

% example simulated model
err_model = 0.1*cosd(az);

figure
plot(az_flight,err_flight,'ro','LineWidth',2)
hold on
plot(az,err_model,'b','LineWidth',2)

xlabel('Azimuth (deg)')
ylabel('Bearing Error (deg)')

legend('Flight Inspection','Proposed Model')

title('Comparison between Flight Inspection Data and Proposed Model')

grid on
RMS = sqrt(mean(err_flight.^2))