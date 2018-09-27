% convert 24 hour clock to 
% 12 hour clock in string format
function output = time_difference_to_string( input )
hour = floor( input );
minute = (input - hour)*60.0;
hour = round( hour );

second = (minute - floor(minute))*60;
second = round( floor(second) );
minute = round( floor(minute) );

minute = num2str( minute , '%2.0f');
if length(minute) <= 1
    minute = [ '0' , minute ]; 
end

second = num2str( second , '%2.0f');
if length(second) <= 1
    second = [ '0' , second ]; 
end

hour = num2str( hour , '%2.0f');
comment = [ hour , ':' , minute , ':' , second ];

output = comment;
