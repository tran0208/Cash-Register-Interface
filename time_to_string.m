% convert 24 hour clock to 
% 12 hour clock in string format
function output = time_to_string( input )
hour = floor( input );
minute = (input - hour)*60.0;

hour = round( hour );
% restrict the number to below 24
hour = mod( hour , 24 );

second = (minute - floor(minute))*60;
second = round( floor(second) );
minute = round( floor(minute) );

comment = '';

minute = num2str( minute , '%2.0f');
if length(minute) <= 1
    minute = [ '0' , minute ]; 
end

second = num2str( second , '%2.0f');
if length(second) <= 1
    second = [ '0' , second ]; 
end


% convert the 24 hour clock to 
% 12 hour clock
    
    if 13 <= hour && hour < 24
        
         hour = hour - 12 ;
         hour = num2str( hour , '%2.0f');
         comment = [ hour , ':' , minute , ':' , second , ' pm' ]; 
    
    elseif hour == 0
        %12:00am
        comment = [ '12' , ':' , minute , ':' , second , ' am']; 
    
    elseif hour == 12
         %12:00pm
         comment = [ '12' , ':' , minute , ':' , second , ' pm']; 
    
    else   %1 <= hour && hour < 12  
         
         hour = num2str( hour , '%2.0f');
         comment = [ hour , ':' , minute , ':' , second , ' am']; 
    
    end

output = comment;







