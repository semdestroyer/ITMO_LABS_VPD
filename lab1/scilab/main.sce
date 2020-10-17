J=0.0023
xtitle ("" , "voltage,%" , "Wlns,рад/c" );
results=read('C:\logminus100.txt',-1,2);
qlines=size(results,1);
angle=results(:,1);
angle=angle*%pi/180;
time=results(:,2);
delta = results(2,1);
angle = (results(:, 1)-delta)*%pi/180;
angle(1)=0;
plot2d(time,angle,2);
aim=[time,angle];
aim=aim';
deff('e=func(k,z)','e=z(2)-k(1)*(z(1)-k(2)*(1-exp(-z(1)/k(2))))');
att=[15;0.06];
[koeffs,errs]=datafit(func,aim,att);
Wnls = koeffs(1);
Tm = koeffs(2);
model=Wnls*(time-Tm*(1-exp(-time/Tm)));
plot2d(time,model,3);
Mst=J*Wnls/Tm;
plot2d(A.time, A.values, 5);
legend('Experiment','$\theta(t)=\omega_{nls}t-\omega_{nls}T_m+\omega_{nls}T_m\,exp\bigl(-
\frac{t}{T_m}\bigr)$','Model',3);
grap1=read('C:\Wlns.txt',-1,2);
strok=size(grap1,1);
volt=grap1(:,1);
Teme=grap1(:,2);
plot2d(volt,Teme,1);
