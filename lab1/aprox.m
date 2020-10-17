files = ["log.txt","log80.txt","log60.txt","log40.txt","log20.txt","logminus20.txt","logminus40.txt","logminus60.txt","logminus80.txt","logminus100.txt"];

for i = 1:length(files) 

file = fopen(files(1,i), 'r');
a = fscanf(file,'%f %f',[2 Inf]);

x = a(1,:);
y = a(2,:);
polyfit(x,y,1)
plot(y,x);

hold on;
end
legend('100','80','60','40','20','-20','-40','-60','-80','-100');

grid();