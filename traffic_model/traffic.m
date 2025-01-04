clc; clear all;
%Red Light to Green Light
L = 10;             
vmax = 120;           
p0 = 20;  
pmax = p0;
dt = 0.01;          
timesteps = 1000;    

x = linspace(-L , L, 200);    
p = zeros(size(x));         
p(1:end) = p0;    

figure;

for t = 1:timesteps
    v = vmax * (1 - 2 * p / pmax);
    dx = v * dt;
    x = x + dx;
    p = (pmax / 2) * (1 - x ./ (vmax * t * dt));
    
    p(x < -vmax*t) = pmax;
    p(x > vmax*t) = 0;
    
    imagesc(x, [0 L], p);
    xlabel('Position');
    title(['Traffic Density Evolution (Time Step: ' num2str(t) ')']);
    colorbar;
    clim([0 pmax]);
    drawnow;
end
