[t, t_name] = WW_format('2d', 'Time');
[v, v_name] = WW_format('2d','Settler.Xf');
[v2, v2_name] = WW_format('2d','Settler.rXi                 ');
%[v2, v2_name]= WW_format('2d', 'Settler.S1.So');

figure(1);
%suptitle('1d dry');
hold on; grid on;
p1 = plot(t,v); p1.LineWidth = 2;
p1 = plot(t,v2); p1.LineWidth = 2;
xlabel(t_name); %ylabel(v_name);

lgd = legend(v_name, v2_name); lgd.FontSize = 20;
