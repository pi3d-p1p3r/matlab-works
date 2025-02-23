f=@(t,y)((2-2*t*y)/(t^2+1));
ext=@(t)((2*t+1)/(t^2+2));
h=0.05;u=1;l=0;t(1)=0;w(1)=0.025;
incr=(u-l)/0.05;
%Adams-Bashforth Four Step Explicit Methood
for i=2:incr+1
if i<5
k1=h*f(t(i-1),w(i-1));
k2=h*f(t(i-1)+h/2,w(i-1)+k1/2);
k3=h*f(t(i-1)+h/2,w(i-1)+k2/2);
k4=h*f(t(i-1)+h,w(i-1)+k3);
w(i)=w(i-1)+(k1+2*k2+2*k3+k4)/6;
else
w(i)=w(i-1)+(h/24)*(55*f(t(i-1),w(i-1))-59*f(t(i-2),w(i-2))
+37*f(t(i-3),w(i-3))-9*f(t(i-4),w(i-4)));
end
t(i)=t(i-1)+h;
end
w1=w.';
%Adams-Moulton three Step implicit Methood
for i=2:incr+1
if i<5
k1=h*f(t(i-1),w(i-1));
k2=h*f(t(i-1)+h/2,w(i-1)+k1/2);
k3=h*f(t(i-1)+h/2,w(i-1)+k2/2);
k4=h*f(t(i-1)+h,w(i-1)+k3);
w(i)=w(i-1)+(k1+2*k2+2*k3+k4)/6;
else
t(i)=t(i-1)+h;
w(i)=w(i-1)+(h/24)*(9*f(t(i-1),w(i-1))
+19*f(t(i-2),w(i-2))-5*f(t(i-3),w(i-3))+f(t(i-4),w(i-4)));
end
t(i)=t(i-1)+h;
end
w2=w.';
%Adams fourth order predictor-corrector Methood
for i=2:incr+1
if i<5
k1=h*f(t(i-1),w(i-1));
k2=h*f(t(i-1)+h/2,w(i-1)+k1/2);
k3=h*f(t(i-1)+h/2,w(i-1)+k2/2);
k4=h*f(t(i-1)+h,w(i-1)+k3);
w(i)=w(i-1)+(k1+2*k2+2*k3+k4)/6;
else
w(i)=w(i-1)+(h/24)*(55*f(t(i-1),w(i-1))-59*f(t(i-2),w(i-2))
+37*f(t(i-3),w(i-3))-9*f(t(i-4),w(i-4)));
w(i)=w(i-1)+(h/24)*(9*f(t(i),w(i))
+19*f(t(i-1),w(i-1))-5*f(t(i-2),w(i-2))+f(t(i-3),w(i-3)));
end

