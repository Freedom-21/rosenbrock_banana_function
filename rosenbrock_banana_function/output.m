function stop = output(p,~,state)
persistent ph
stop = false;
switch state
    case 'init'
       figure
       newplot
       x = linspace(-10,10);
       y = linspace(-10,10);
       [xx,yy] = meshgrid(x,y);
       levels = 10:10:300;
       f=@(x, y) (1-x).^2+100*(y+1.5-(x).^2).^2;
       ff = f(xx,yy);
       levels = 10:10:300;
       contour(x,y,ff,levels,'LineWidth',1.2);
       colorbar;
       axis([-4 4 -3.3 4]);
       axis square;
       title('Rosenbrock Function Optimization');
       hold on;
       z=(1-p(1))^2+100*(p(2)+1.5-(p(1))^2)^2;
       plot3(p(1),p(2),z,'ko','MarkerSize',10,'LineWidth',2);
       text(p(1),p(2),z,'  Start','Color',[0 0 0]);
       drawnow
    case 'iter'
        z = 100*(p(2) + 1.5 -(p(1)).^2).^2+(1-p(1)).^2;
        ph = plot3(p(1),p(2),z,'r.','MarkerSize',10);
        h = gca;
        h.SortMethod = 'childorder';
        drawnow;
    case 'done'
        z=(1-p(1))^2+100*(p(2)+1.5-(p(1))^2)^2;
        plot3(p(1),p(2),z,'ko','MarkerSize',10,'LineWidth',2);
        text(p(1),p(2),z,'  End','Color',[0 0 0]);
        hold off;
end