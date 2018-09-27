% panel start at the far top left hand corner
  
function setup_program( action )

    global  MAIN_PANELS 
    
    % name of the buttons
    global  ACTIVE_BUTTONS
    
    % output file name
    global OUTPUT_DIRECTORY

if nargin() < 1
    
    format short g;
    action = 'initialize';
end    

if strcmp( action , 'initialize' )
    
       [ MAIN_PANELS , ACTIVE_BUTTONS ] = setup_value_figure('setup_program');
                    
                                
                                                    
elseif strcmp( action , char(ACTIVE_BUTTONS(1,1)) )
              window_panel = gcf();
              data_list = get( window_panel , 'UserData' ); 
              set( data_list , 'Enable' , 'off' );
              set( data_list(1) , 'Enable' , 'on' );
              
              try
                  
                  for i = 5:1:115
                        set( data_list(i) , 'String' , '' );
                  end
              
                  set( data_list , 'Enable' , 'on' ); 
              catch
                  set( data_list , 'Enable' , 'on' ); 
                  error('An error has occurred: Ticket_button' );
              end            
              
elseif strcmp( action , char(ACTIVE_BUTTONS(1,2)) )     
              window_panel = gcf();
              data_list = get( window_panel , 'UserData' ); 
              set( data_list , 'Enable' , 'off' );
              set( data_list(1) , 'Enable' , 'on' );
              
              try     
                  
                         set( data_list , 'Enable' , 'on' ); 
               catch
                  set( data_list , 'Enable' , 'on' ); 
                  error('An error has occurred: record_button' );
               end
              
elseif strcmp( action , char(ACTIVE_BUTTONS(1,3)) )     
              
              % set the format of the number 
              format short g;
    
              window_panel = gcf();
              data_list = get( window_panel , 'UserData' ); 
              set( data_list , 'Enable' , 'off' );
              set( data_list(1) , 'Enable' , 'on' );
              
              
              try
                  
                  
                  set( data_list , 'Enable' , 'on' ); 
              catch
                  set( data_list , 'Enable' , 'on' ); 
                  error('An error has occurred: print_button' );
              end
              
elseif strcmp( action , char(ACTIVE_BUTTONS(1,4)) )
           close( gcf() );
           close all;
           close all hidden;
           clear;
           clc;
end