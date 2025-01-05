clc; clear all;
L = 10;             
vmax = 120;           
p0 = 0;  
pmax = 20;
dt = 0.01;          
timesteps = 1000;    

x = linspace(-1200*L, 1200*L, 20000);    
p = zeros(size(x));         
p(1:end) = p0;    

figure;

for t = 1:timesteps
    v = vmax * (1 - 2 * p / pmax);
    dx = v * dt;
    x = x + dx;
    p = (pmax / 2) * (1 - x ./ (vmax * t * dt));
    
    p(x < -vmax*t) = 0;
    p(x > 0) = pmax;
    
    imagesc(x, [0 L], p);
    xlabel('Position');
    title(['Traffic Density Evolution (Time Step: ' num2str(t) ')']);
    colorbar;
    clim([0 pmax]);
    drawnow;
end
