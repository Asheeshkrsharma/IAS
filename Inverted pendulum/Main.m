clear;
clc;
main_fis = readfis('inference.fis');
slcpia

set(0,'DefaultAxesFontName', 'Times New Roman')
set(0,'DefaultAxesFontSize', 13)

subplot(2,4,1)
plotmf(main_fis,'input',1)
set(get(gca,'YLabel'),'visible','on')
set(get(gca,'XLabel'),'interpreter','latex')

subplot(2,4,2)
plotmf(main_fis,'input',2)
set(get(gca,'YLabel'),'visible','off')
set(get(gca,'XLabel'),'interpreter','latex')

subplot(2,4,3)
plotmf(main_fis,'input',3)
set(get(gca,'YLabel'),'visible','off')
set(get(gca,'XLabel'),'interpreter','latex')

subplot(2,4,4)
plotmf(main_fis,'input',4)
set(get(gca,'YLabel'),'visible','off')
set(get(gca,'XLabel'),'interpreter','latex')

subplot(2,4,[5,8])
plotmf(main_fis,'output',1)
set(get(gca,'YLabel'),'visible','on')
set(get(gca,'XLabel'),'interpreter','latex')
