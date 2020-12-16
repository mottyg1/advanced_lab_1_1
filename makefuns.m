function funs = makefuns
  funs.load_data=@load_data;
  funs.fun2=@fun2;
end

function [experiements] = load_data(grab)
    experiements = [];
    d = fileparts(which('makefuns'));
    files = dir(fullfile(d, grab));
    for k = 1:length(files) % iterate through files in folder
        file = files(k).name;
        if startsWith(file, '~') % skip temp files
            continue;
        end
        [~,SheetNames]  = xlsfinfo(file);
   %     SheetNames
        for i = 1:length(SheetNames) % iterate through sheets in file
            sheet_name = SheetNames{i};
            e = read_ex(file, sheet_name);
            experiements = [experiements, e];
        end
    end
end

function [experiement] = read_ex(file, sheet_name)
 %   sheet_data = readtable(file, 'Sheet', sheet_name);
    
    experiement = ex;
    experiement.file = file;
    experiement.sheet = sheet_name;
    experiement.material = get_material(sheet_name);
    experiement.mass = get_mass(experiement.material);
    experiement.liquid = get_liquid(sheet_name);
    experiement.water_level = get_water_level(sheet_name);
  %  t = table2array(sheet_data(:, 't'));
  %  x = table2array(sheet_data(:, 'x')); % usually don't care about this
  %  y = table2array(sheet_data(:, 'y'));
end

function [level] = get_water_level(sheet_name)
    default_level = '100'; 
    level = default_level;
    if contains(sheet_name, 'WATER_LEVEL_1')
        level = '1';
    elseif contains(sheet_name, 'WATER_LEVEL_2')
        level = '2';
    elseif contains(sheet_name, 'WATER_LEVEL_3')
        level = '3';
    elseif contains(sheet_name, 'WATER_LEVEL_4')
        level = '4';
    end
end

function [material] = get_material(sheet_name)
    default_material = 'KALKAR_SMALL_RED'; 
    material = default_material;
    if contains(sheet_name, 'HUGE_RED')
        material = 'KALKAR_HUGE_RED';
    elseif contains(sheet_name, 'MED_BLUE')
        material = 'KALKAR_MED_BLUE';
    elseif contains(sheet_name, 'CHEERIO')
        material = 'CHEERIO';
    elseif contains(sheet_name, 'SILVER')
        material = 'SILVER';
    end
end

function [liquid] = get_liquid(sheet_name)
    default_liquid = 'PURE'; 
    liquid = default_liquid;
    if contains(sheet_name, 'ETH')
        liquid = 'ETH';
    elseif contains(sheet_name, 'SALT0')
        liquid = 'SALT0';
    elseif contains(sheet_name, 'SALT1')
        liquid = 'SALT1';
    end
end

function [mass] = get_mass(material)
    mass = 0;
    if strcmp(material,'KALKAR_HUGE_RED')
        mass = 0.00028;
    elseif strcmp(material,'KALKAR_MED_BLUE')
        mass = 0.0001;
    elseif strcmp(material,'CHEERIO')
        mass = 0.00012;
    elseif strcmp(material,'SILVER')
        mass = 0.0001;
    elseif strcmp(material,'KALKAR_SMALL_RED')
        mass = 0.00004 / 36;
    end
end

function z=fun2
  z=1;
end