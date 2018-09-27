function [ quantity , price ] = extract_quantity_and_price( input_string )

result_quantity = 0;
result_price = 0;

value = extract_equation( input_string );

n = length( value );

%array used in computation
array = struct( 'expression' , '' );
operator = '';

%increment the number expression
j = 1;

%variable used
v = '';
t = '';
count_bracket = 0;

%separate the operators and expressions
for i = 1:1:n
    t = value(i);
    if t == '('
         count_bracket = count_bracket + 1;
    elseif t == ')'
         count_bracket = count_bracket - 1;
    end
    
    if (count_bracket == 0) && (t == '/' || t == '*' || t == '+' || t == '-')
         operator = [ operator , t ];
         array(j).expression = v;
         %save to next index in the array
         j = j + 1;
         v = '';
    else
         v = [ v , t ];
    end
end

%Add the last expression to the array, not added in the loop
array(j).expression = v;


%------------------------------------------

num_of_operator = length( operator );

if num_of_operator < 1
    
    result_price = str2num( array(1).expression );
    
    if isequal( result_price , 0 ) || isequal( result_price , [] )
        result_quantity = 0;
        result_price = 0;
    else
        result_quantity  = 1;
    end
    
elseif num_of_operator == 1
    
    if operator(1) == '*'
        
        result_quantity = str2num( array(1).expression );
        if isequal( result_quantity , [] )
            result_quantity = 0;
        end
        result_price = str2num( array(2).expression );
        if isequal( result_price , [] )
            result_price = 0;
        end
        
    else
        
        result_quantity = 1;
        t = [ array(1).expression , operator(1) ,  array(2).expression ];
        result_price = str2num( t );
        if isequal( result_price , [] )
            result_price = 0;
        end
    end
    
else
    
    %use variable t as a boolean value
    t = 1;
    for i =1:1:num_of_operator
          if isequal( operator(i) , '*' )
                 %this implies that the expressions are 
                 %multipled together
                 t = t&&1;
          else
                 t = 0;
          end
    end
    
    if t == 0
          result_quantity = 1;
          result_price = str2num( value );
          if isequal( result_price , [] )
                result_price = 0; 
          end
        
    % consider the case where all the expressions are
    % multiplied together
    else
        
        % the first index is used for the quantity
        result_quantity = str2num( array(1).expression );
    
        %concatenate the remaining expressions together
        n = length( array );
        v = '';
        %start at index 2
        for i = 2:1:n
            v = [ v , array(i).expression ];
            if i <= num_of_operator
                 v = [ v , operator(i) ] ;
            end 
        end
    
        %save result
        result_price = str2num( v );
        if isequal( result_price , [] )
            result_price = 0;
        end
    end
    
end

quantity = result_quantity;
price = result_price;
