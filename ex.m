classdef ex
    
    properties
        file
        sheet
        mass
        material
        liquid
        water_level
        angle
        x
        y
        t
    end
    properties (Dependent)
      marker
      color_material
      color_angle
      color_liquid
      color_water_level
   end
   methods
       function value = get.color_material(obj)
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
       function value = get.color_water_level(obj)
         c = obj.water_level;
         switch c
            case '1'
               v = 'r';
            case '2'
               v = 'm';
            case '3'
               v = 'b';
            case '4'
               v = 'g';
            case '100'
               v = 'k';
            otherwise
               v = 'y';
         end
         value = v;
      end
      function value = get.color_liquid(obj)
         c = obj.liquid;
         switch c
            case 'PURE'
               v = 'k';
            case 'ETH'
               v = 'm';
            case 'SALT0'
               v = 'b';
            case 'SALT1'
               v = 'g';
            otherwise
               v = 'y';
         end
         value = v;
      end
      function value = get.color_angle(obj)
         c = obj.angle;
         switch c
            case 'A1'
               v = 'r';
            case 'A2'
               v = 'm';
            case 'A3'
               v = 'b';
            case 'A4'
               v = 'g';
            case '0'
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

