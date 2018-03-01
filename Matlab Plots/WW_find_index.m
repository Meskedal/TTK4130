function index = WW_find_index(name, variable)
   variable = strtrim(variable);
   for i = 1:1:length(name)
       variable_name = name(i, :);
       variable_name = convertCharsToStrings(variable_name);
       variable_name = strtrim(variable_name);
       if(variable_name == variable)
           index = i;
           return;
       end
   end
   error("Incorrect variable name or nonexistent");
end