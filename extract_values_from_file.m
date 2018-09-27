function [ price_list , name_list ] = extract_values_from_file( file )

   %set limit for tranversing the file 
   limit_a = 50;

   prices_array = [];
   name_array = [];

   fid = fopen( file , 'r' );

   if isequal( fid , -1 )
           prices_array = 0;
           name_array = 0;
   else
           tline = fgetl( fid );
   
           x = 0;
           v = 0;
   
           i = 1;
           while i < limit_a && ischar(tline)
   
               if ~isequal( tline , '' )
   
                    [ car , cadr ] = strtok( tline );
                    x = extract_equation( car );
                    v = str2num( x );

                    prices_array = [ prices_array , v ];
                    
                    x = trim_string(cadr);
                    name_array = [ name_array , {x} ];

               end

               tline = fgetl( fid );
               i = i + 1;
           end
   end
   
   fclose('all');    
   
price_list = prices_array;
name_list = name_array;