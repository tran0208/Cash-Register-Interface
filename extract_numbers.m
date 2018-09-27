function output_result = extract_numbers( input_string )
x = input_string;
v = '';
[ row_size , column_size ]  = size( input_string );
for i = 1:1:column_size
    t = x(i);
    if isNumber(t)
        v = [ v , t ];
    end

end
y = str2num(v);

output_result = num2str( y , '%3.2f');