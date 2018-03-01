function [values, variable_name] = WW_format(mat_file, variable)
    mat_file = "BenchPlant - assignment " + mat_file + ".mat";
    load(mat_file);
    name = name';
    index = WW_find_index(name, variable);
    variable_name = name(index, :);
    variable_name = variable_name;
    variable_name = convertCharsToStrings(variable_name);
    variable_name = strtrim(variable_name);
    values = data_2(index, :);
end
