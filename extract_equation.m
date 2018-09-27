function output_result = extract_equation( input_string )
x = input_string;
v = '';
t = '';

n  = length( input_string );
for i = 1:1:n
    t = x(i);
    if isNumber(t) || t == '(' || t == ')'
        v = [ v , t ];
    end

end

x = v;
n = length( v );
v = '';
t = '';
bracket_count = 0;
for i = 1:1:n

    t = x(i);
    if t == '(' 
        bracket_count = bracket_count + 1;
    elseif t == ')'
        bracket_count = bracket_count - 1;
    end
    
    %examine the bracket_count variable
    if bracket_count >= 0
        v = [ v , t ];    
    end

end


if bracket_count > 0 
     for i = 1:1:bracket_count
          v = [ v , ')' ];
     end
end


t = str2num( v );
if isequal( t , [] )
   v = '0';
end


output_result = v;
