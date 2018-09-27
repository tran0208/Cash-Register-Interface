function output = trim_string( input )

boolean = 0;
n = length( input );
x = input;
v = '';

for i = 1:1:n
     if boolean == 1
           v = [ v , x(i) ] ;
     elseif boolean == 0 && ~isequal( x(i) , ' ' );
           v = [ v , x(i) ] ;
           boolean = 1;
     end
end

boolean = 0;
x = v;
i = length(x);
v = '';

while i >= 1
     if boolean == 1
           v = [ x(i) , v ];
     elseif boolean == 0 && ~isequal( x(i) , ' ' )
           v = [ x(i) , v ];
           boolean = 1;
     end
     i = i - 1;
end

output = v;
