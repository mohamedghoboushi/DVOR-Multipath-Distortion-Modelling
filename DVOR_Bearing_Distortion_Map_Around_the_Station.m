clear
clc
close all

%% Parameters

fc = 113e6;               
c = 3e8;                  
lambda = c/fc;            

Ad = 1;                   

N = 3;                    

Ai = [0.05 0.04 0.03];    

reflector_pos = [300 200;
                -250 350;
                 400 -150];

R = 5000;                 

az = 0:1:360;
az_rad = deg2rad(az);

theta_error = zeros(size(az));

%% Bearing error vs azimuth

for k = 1:length(az)

    x = R*cos(az_rad(k));
    y = R*sin(az_rad(k));
    
    Ld = sqrt(x^2 + y^2);
    
    error_sum = 0;
    
    for i = 1:N
        
        xr = reflector_pos(i,1);
        yr = reflector_pos(i,2);
        
        Li = sqrt((x-xr)^2+(y-yr)^2) + sqrt(xr^2+yr^2);
        
        dphi = 2*pi*(Li-Ld)/lambda;
        
        error_sum = error_sum + Ai(i)*sin(dphi);
        
    end
    
    theta_error(k) = error_sum/Ad;
    
end

theta_error_deg = rad2deg(theta_error);

figure
plot(az,theta_error_deg,'LineWidth',2)
xlabel('Azimuth (deg)')
ylabel('Bearing Error (deg)')
title('DVOR Bearing Error vs Azimuth')
grid on


%% Worst Case Error

theta_max = sum(Ai)/Ad;
theta_max_deg = rad2deg(theta_max);

disp('Worst Case Bearing Error (deg):')
disp(theta_max_deg)


%% Distortion Map

x = -3000:100:3000;
y = -3000:100:3000;

[X,Y] = meshgrid(x,y);

theta_map = zeros(size(X));

for m = 1:length(x)
for n = 1:length(y)
    
    xr = X(m,n);
    yr = Y(m,n);
    
    Ld = sqrt(xr^2 + yr^2);
    
    error_sum = 0;
    
    for i = 1:N
        
        xri = reflector_pos(i,1);
        yri = reflector_pos(i,2);
        
        Li = sqrt((xr-xri)^2+(yr-yri)^2) + sqrt(xri^2+yri^2);
        
        dphi = 2*pi*(Li-Ld)/lambda;
        
        error_sum = error_sum + Ai(i)*sin(dphi);
        
    end
    
    theta_map(m,n) = rad2deg(error_sum/Ad);
    
end
end

figure

Xkm = X/1000;
Ykm = Y/1000;

contourf(Xkm,Ykm,theta_map,40,'LineColor','none')
colormap(jet)
colorbar
hold on

%% DVOR station
plot(0,0,'rp','MarkerSize',16,'LineWidth',2)

%% Reflector locations
reflect_km = reflector_pos/1000;

plot(reflect_km(:,1),reflect_km(:,2),'ks','MarkerSize',8,...
     'MarkerFaceColor','y')

%% Radial beams
Rmax = 3;
angles = 0:5:355;

for k = 1:length(angles)

    th = deg2rad(angles(k));
    plot([0 Rmax*cos(th)],[0 Rmax*sin(th)],'k','LineWidth',0.4)

end

%% Range rings
t = linspace(0,2*pi,400);

for r = 1:3
    plot(r*cos(t), r*sin(t),'k--','LineWidth',0.5)
end

axis equal
xlim([-3 3])
ylim([-3 3])

xlabel('Distance (km)')
ylabel('Distance (km)')

title('DVOR Bearing Distortion Map Around the Station')

grid on
set(gca,'FontSize',12)

%% SQI

SQI = sqrt(mean(theta_error_deg.^2));

disp('DVOR Site Quality Index (deg):')
disp(SQI)