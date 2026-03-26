clear; clc; close all;

%% PARAMETERS

azimuth = 0:1:360;
Np = 1;      
MC_runs = 50;

%% ==============================
%% 1) ANALYTICAL MODEL
%% ==============================

phi = linspace(0,2*pi,360);

A1 = 0.02;
A2 = 0.05;
A3 = 0.1;

err1 = A1*sin(phi);
err2 = A2*sin(phi);
err3 = A3*sin(phi);

%% ==============================
%% 2) STOCHASTIC MODEL (CORRECT)
%% ==============================

bearing_MC = zeros(MC_runs, length(azimuth));

for mc = 1:MC_runs
    

    reflector_angles = 360*rand(1,Np);
    reflector_amp    = 0.02 + 0.03*rand(1,Np);   % realistic
    
    for i = 1:length(azimuth)
        
        theta = azimuth(i);
        
        error = 0;
        
        for k = 1:Np
            
            delta = deg2rad(theta - reflector_angles(k));
            
            % contribution of each reflector
            error = error + reflector_amp(k)*sin(delta);
        end
        
        bearing_MC(mc,i) = error;
    end
end

%% STATISTICS

bearing_mean = mean(bearing_MC,1);
bearing_std  = std(bearing_MC,[],1);

%% ==============================
%% 3) FLIGHT DATA
%% ==============================

az_flight = [0 30 60 90 120 150 180 210 240 270 300 330 360];
err_flight = [0.1 0.08 0.05 0.02 0.0 -0.04 -0.06 -0.05 -0.02 0.01 0.04 0.07 0.1];

bearing_flight = interp1(az_flight, err_flight, azimuth, 'pchip');

%% ==============================
%% METRICS
%% ==============================

rmse_analytical = sqrt(mean((err1).^2));
rmse_stochastic = sqrt(mean((bearing_mean - bearing_flight).^2));

fprintf('RMSE Analytical = %.4f deg\n', rmse_analytical);
fprintf('RMSE Stochastic = %.4f deg\n', rmse_stochastic);

%% ==============================
%% PLOT
%% ==============================

figure;

fill([azimuth fliplr(azimuth)], ...
     [bearing_mean + bearing_std, fliplr(bearing_mean - bearing_std)], ...
     [0.85 0.85 0.85], 'EdgeColor','none'); hold on;

plot(azimuth, bearing_mean, 'k--', 'LineWidth', 2);
plot(rad2deg(phi),err1,'LineWidth',2)
plot(rad2deg(phi),err2,'LineWidth',2)
plot(rad2deg(phi),err3,'LineWidth',2)
plot(azimuth, bearing_flight, 'r:', 'LineWidth', 2.5);

grid on;
xlabel('Azimuth (degrees)');
ylabel('Bearing Error (degrees)');

legend('Stochastic ?','Stochastic Mean', ...
       'Analytical Model for A=0.02','Analytical Model for A=0.05','Analytical Model for A=0.1','Flight Inspection');

title('Effect of Reflection Amplitude on Bearing Error');
xlim([0 360]);