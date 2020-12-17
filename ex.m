classdef ex
    
    properties
        file
        sheet
        mass
        material
        liquid
        water_level
        x
        y
        t
    end
    properties (Dependent)
      marker
      color
   end
   methods
      function value = get.color(obj)
         c = obj.material;
         switch c
            case 'KALKAR_SMALL_RED'
               v = 'r';
            case 'KALKAR_HUGE_RED'
               v = 'm';
            case 'KALKAR_MED_BLUE'
               v = 'b';
            case 'CHEERIO'
               v = 'g';
            case 'SILVER'
               v = 'k';
            otherwise
               v = 'y';
         end
         value = v;
      end
      function value = get.marker(obj)
         c = obj.liquid;
         switch c
            case 'SALT1'
               v = 'd';
            case 'SALT0'
               v = '+';
            case 'ETH'
               v = '*';
            case 'PURE'
               v = 'o';
            otherwise
               v = 'h';
         end
         value = v;
      end
   end
end

