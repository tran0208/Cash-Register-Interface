function output_result = extract_string( x )
v = '';
[ row_size , column_size ]  = size( x );
for i = 1:1:column_size
    t = x(i);
    if not( isNumber(t) || t == '(' || t == ')' )
        v = [ v , t ];
    end
end
output_result = v;

