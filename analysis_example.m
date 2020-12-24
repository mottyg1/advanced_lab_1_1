f = makefuns;

expers = f.load_data('*.xlsx');

figure(1);
clf;
hold on;
figure(2);
clf;
hold on;
names = [];
eime = 20;
for i = 1:length(expers)
    e = expers(i);

    if strcmp(e.material, 'SILVER') || strcmp(e.angle,'A3') || strcmp(e.angle,'A4')
        continue
    end
    
    x = e.x;
    y = e.y;
    t = e.t;
    
    x = x - x(1);
    y = y - y(1);
    r = sqrt(x.^2+y.^2);
    
    v = f.get_derivative(r,t);
    [~,v_max_i] = max(v);
    v_max_i = v_max_i+1;
    r = r(1:v_max_i);
    t = t(1:v_max_i);
 %   r = f.max_norm(r);
 %   [r, t] = f.remove_i(r>-0.0006, r, t);
 %   [r, t] = f.norm_time_by_place(-0.006, r, t);
    
    frames = 20;
    r = r(end-frames:end);
    t = t(end-frames:end);
    
    r = f.min_norm(r);
    t = f.min_norm(t);
    
    curve = fit(t,r,fittype('poly2'));
    force = 2*curve.p1*e.mass;
    
    figure(1);
    scatter(t, r, e.color_angle, e.marker);
    figure(2);
    scatter(1, force, e.color_angle, e.marker);
    names = [names, e.sheet];
end

figure(1);
legend(names);
sgtitle("Position over Time - Last 20 frames before impact");
xlabel("[s]");
ylabel("[m]");

figure(2);
sgtitle("Force on last 20 frames before impact");
xticks([]);
ylabel("[N]");
legend(names);

