files = ["log.txt","log80.txt","log60.txt","log40.txt","log20.txt"];

for i = 1:length(files) 

file = fopen(files(1,i), 'r');
a = fscanf(file,'%f %f',[2 Inf]);


x = a(1,:);
x = x*pi/180;
y = a(2,:);

plot(y,x);

hold on;
end
legend('100','80','60','40','20');

grid();