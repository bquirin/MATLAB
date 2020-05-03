function arrow(x,y,da,dl,df)
    x0=x(length(x)); y0=y(length(y));
    dx = x0-x(length(x)-1); dy = y0-y(length(y)-1);
    %plot([x(length(x)) x(length(x))+2*dx],[y(length(y)) y(length(y))+2*dy],'-b');
    theta=atan2(dy,dx);
    %plot([x(length(x)) x(length(x))+cos(theta)],[y(length(y)) y(length(y))+sin(theta)],'-b');
    fill([x0 x0-dl*cos(theta+da) x0-df*dl*cos(theta) x0-dl*cos(theta-da) x0], ...
         [y0 y0-dl*sin(theta+da) y0-df*dl*sin(theta) y0-dl*sin(theta-da) y0],'black');
end