f = makefuns;

expers = f.load_data('*.xlsx');

figure(1);
hold on;
names = [];
for i = 1:length(expers)
    e = expers(i);
    if strcmp(e.water_level,'100') %|| strcmp(e.material, 'SILVER')
        continue
    end
    
    y = e.y;
    t = e.t;
    
    y = f.max_norm(y);
    [y, t] = f.remove_i(y>-0.0006, y, t);
    [y, t] = f.norm_time_by_place(-0.006, y, t);
    
    scatter(t, y, [], e.color, e.marker);
    names = [names, e.sheet];
end

hold off;
legend(names);
