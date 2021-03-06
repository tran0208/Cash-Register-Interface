% precondition: input_button_name is a string array of size 19
%              multi_trip_prices is an int array of size 8
%              single_trip_price is an int array of size 8
%              daytrip_price is an int array of size 3

function output = general_figure( function_name , figure_title , panel_name , input_button_name )

    mouse_pointer = watchon();
    format short g;
   
    %panel construction variables
    SCREEN_DETAILS = get(0,'ScreenSize');
    fig_x = 1000;
    fig_y = 690;
    
    
    
    GENERAL_FIGURE = figure( 'Name' , figure_title , ...
                             'Units', 'pixels'          , ...
                             'resize', 'off'            , ...
                             'NumberTitle' , 'off'      , ...
                             'Visible' , 'on'           , ...
                             'position', [ 10 , abs( SCREEN_DETAILS(4) - fig_y - 45 ) ,  fig_x , fig_y ] ...
                           );
                       
    colordef( GENERAL_FIGURE  , 'black' );
    
    
    colour_display = [ 0.9 0.9 0.9 ];

    blue = [ 0.1 0.15 1 ];
    orange = [ .9 0.4 0.2 ];
    red = [ 1 0.22 0 ];
    green =  [ 0 1 0.1 ];
    grey = [ 0.5 0.5 0.5 ];
    white = [ 1 1 1 ];
    black = [ 0 0 0 ];
    
    
    pale_green =  [ 0.9 1 0.9];
    pale_orange = [ 1 1 .95 ];
    pale_yellow = [ .9 0.9 0.8 ];
    pale_grey = [ 0.9 0.9 0.9 ];
    
    
    % panel
    %----------------------------  begin  ---------------------------------
    %----------------------------------------------------------------------
   
    
    
    
                         
     PANEL_1 = uipanel( 'Title' , char(panel_name(1,1))        , ...
                        'Parent' , GENERAL_FIGURE              , ...
                        'FontName' , 'Arial'                   , ...
                        'FontUnits' , 'points'                 , ...
                        'FontWeight' , 'bold'                  , ...
                        'FontSize' , 15                        , ...
                        'Units' , 'pixels'                     , ...
                        'Visible' , 'on'                       , ...
                        'BackgroundColor' , grey               , ...
                        'ForegroundColor' , black              , ...
                        'Position' , [ 30 , 520 , 800 , 140  ]   ...
                      ); 
    
                         
     PANEL_2 = uipanel( 'Title' , char(panel_name(1,2))        , ...
                        'Parent' , GENERAL_FIGURE              , ...
                        'FontName' , 'Arial'                   , ...
                        'FontUnits' , 'points'                 , ...
                        'FontWeight' , 'bold'                  , ...
                        'FontSize' , 15                        , ...
                        'Units' , 'pixels'                     , ...
                        'Visible' , 'on'                       , ...
                        'BackgroundColor' , grey               , ...
                        'ForegroundColor' , black              , ...
                        'Position' , [ 30 , 356 , 800 , 140  ]   ...
                      ); 
    
                         
     PANEL_3 = uipanel( 'Title' , char(panel_name(1,3))        , ...
                        'Parent' , GENERAL_FIGURE              , ...
                        'FontName' , 'Arial'                   , ...
                        'FontUnits' , 'points'                 , ...
                        'FontWeight' , 'bold'                  , ...
                        'FontSize' , 15                        , ...
                        'Units' , 'pixels'                     , ...
                        'Visible' , 'on'                       , ...
                        'BackgroundColor' , grey               , ...
                        'ForegroundColor' , black              , ...
                        'Position' , [ 30 , 194 , 800 , 140  ]   ...
                      );  
                          
                         
     PANEL_4 = uipanel( 'Title' , char(panel_name(1,4))        , ...
                        'Parent' , GENERAL_FIGURE              , ...
                        'FontName' , 'Arial'                   , ...
                        'FontUnits' , 'points'                 , ...
                        'FontWeight' , 'bold'                  , ...
                        'FontSize' , 15                        , ...
                        'Units' , 'pixels'                     , ...
                        'Visible' , 'on'                       , ...
                        'BackgroundColor' , grey               , ...
                        'ForegroundColor' , black                , ...
                        'Position' , [ 30 , 30 , 800 , 140  ]    ...
                      );  
                                
    % panel
    %----------------------------  end  ---------------------------------
    %--------------------------------------------------------------------                     
                           
                
    
    
    
    % buttons
    % ============================ begin ==================================
    % =====================================================================
 
                                                                   
            callbr = callname( function_name , char(input_button_name(1,1)) );                                               
            button_11 = uicontrol( 'String' , char(input_button_name(1,1)) , ...
                                   'Parent' , PANEL_1                      , ...
                                   'Style' , 'pushbutton'                  , ...
                                   'Callback' , callbr                     , ...
                                   'HorizontalAlignment' , 'center'        , ...
                                   'Units' , 'pixels'                      , ...
                                   'Visible' , 'on'                        , ...
                                   'Enable' , 'on'                         , ...
                                   'ForegroundColor' , black               , ...
                                   'FontUnits' , 'pixels'                  , ...
                                   'FontWeight' , 'bold'                   , ...
                                   'FontSize' , 13                         , ...
                                   'Position' , [ 25 , 25 , 169 , 80 ]       ...                                        
                                 );
                                            
           
            callbr = callname( function_name , char(input_button_name(1,2)) );                                               
            button_12 = uicontrol( 'String' , char(input_button_name(1,2)) , ...
                                   'Parent' , PANEL_1                      , ...
                                   'Style' , 'pushbutton'                  , ...
                                   'Callback' , callbr                     , ...
                                   'HorizontalAlignment' , 'center'        , ...
                                   'Units' , 'pixels'                      , ...
                                   'Visible' , 'on'                        , ...
                                   'Enable' , 'on'                         , ...
                                   'ForegroundColor' , black               , ...
                                   'FontUnits' , 'pixels'                  , ...
                                   'FontWeight' , 'bold'                    , ...
                                   'FontSize' , 13                         , ...
                                   'Position' , [ 219 , 25 , 169 , 80 ]      ...                                        
                                 );
                                            
                   
            callbr = callname( function_name , char(input_button_name(1,3)) );                                               
            button_13= uicontrol( 'String' , char(input_button_name(1,3)) , ...
                                  'Parent' , PANEL_1                      , ...
                                  'Style' , 'pushbutton'                  , ...
                                  'Callback' , callbr                     , ...
                                  'HorizontalAlignment' , 'center'        , ...
                                  'Units' , 'pixels'                      , ...
                                  'Visible' , 'on'                        , ...
                                  'Enable' , 'on'                         , ...
                                  'ForegroundColor' , black               , ...
                                  'FontUnits' , 'pixels'                  , ...
                                  'FontWeight' , 'bold'                    , ...
                                  'FontSize' , 13                         , ...
                                  'Position' , [ 413 , 25 , 169 , 80 ]      ...                                        
                                );
                                             
                   
            callbr = callname( function_name , char(input_button_name(1,4)) );                                               
            button_14= uicontrol( 'String' , char(input_button_name(1,4)) , ...
                                  'Parent' , PANEL_1                      , ...
                                  'Style' , 'pushbutton'                  , ...
                                  'Callback' , callbr                     , ...
                                  'HorizontalAlignment' , 'center'        , ...
                                  'Units' , 'pixels'                      , ...
                                  'Visible' , 'on'                        , ...
                                  'Enable' , 'on'                         , ...
                                  'ForegroundColor' , black               , ...
                                  'FontUnits' , 'pixels'                  , ...
                                  'FontWeight' , 'bold'                    , ...
                                  'FontSize' , 13                         , ...
                                  'Position' , [ 607 , 25 , 169 , 80 ]      ...                                        
                                );



                                                                                       
            callbr = callname( function_name , char(input_button_name(1,5)) );                                               
            button_21 = uicontrol( 'String' , char(input_button_name(1,5)) , ...
                                   'Parent' , PANEL_2                      , ...
                                   'Style' , 'pushbutton'                  , ...
                                   'Callback' , callbr                     , ...
                                   'HorizontalAlignment' , 'center'        , ...
                                   'Units' , 'pixels'                      , ...
                                   'Visible' , 'on'                        , ...
                                   'Enable' , 'on'                         , ...
                                   'ForegroundColor' , black               , ...
                                   'FontUnits' , 'pixels'                  , ...
                                   'FontWeight' , 'bold'                    , ...
                                   'FontSize' , 13                         , ...
                                   'Position' , [ 25 , 25 , 169 , 80 ]       ...                                        
                                 );
                                            
           
            callbr = callname( function_name , char(input_button_name(1,6)) );                                               
            button_22 = uicontrol( 'String' , char(input_button_name(1,6)) , ...
                                   'Parent' , PANEL_2                      , ...
                                   'Style' , 'pushbutton'                  , ...
                                   'Callback' , callbr                     , ...
                                   'HorizontalAlignment' , 'center'        , ...
                                   'Units' , 'pixels'                      , ...
                                   'Visible' , 'on'                        , ...
                                   'Enable' , 'on'                         , ...
                                   'ForegroundColor' , black               , ...
                                   'FontUnits' , 'pixels'                  , ...
                                   'FontWeight' , 'bold'                    , ...
                                   'FontSize' , 13                         , ...
                                   'Position' , [ 219 , 25 , 169 , 80 ]      ...                                        
                                 );
                                            
                   
            callbr = callname( function_name , char(input_button_name(1,7)) );                                               
            button_23= uicontrol( 'String' , char(input_button_name(1,7)) , ...
                                  'Parent' , PANEL_2                      , ...
                                  'Style' , 'pushbutton'                  , ...
                                  'Callback' , callbr                     , ...
                                  'HorizontalAlignment' , 'center'        , ...
                                  'Units' , 'pixels'                      , ...
                                  'Visible' , 'on'                        , ...
                                  'Enable' , 'on'                         , ...
                                  'ForegroundColor' , black               , ...
                                  'FontUnits' , 'pixels'                  , ...
                                  'FontWeight' , 'bold'                    , ...
                                  'FontSize' , 13                         , ...
                                  'Position' , [ 413 , 25 , 169 , 80 ]      ...                                        
                                );
                                             
                   
            callbr = callname( function_name , char(input_button_name(1,8)) );                                               
            button_24= uicontrol( 'String' , char(input_button_name(1,8)) , ...
                                  'Parent' , PANEL_2                      , ...
                                  'Style' , 'pushbutton'                  , ...
                                  'Callback' , callbr                     , ...
                                  'HorizontalAlignment' , 'center'        , ...
                                  'Units' , 'pixels'                      , ...
                                  'Visible' , 'on'                        , ...
                                  'Enable' , 'on'                         , ...
                                  'ForegroundColor' , black               , ...
                                  'FontUnits' , 'pixels'                  , ...
                                  'FontWeight' , 'bold'                    , ...
                                  'FontSize' , 13                         , ...
                                  'Position' , [ 607 , 25 , 169 , 80 ]      ...                                        
                                );



                                                                                         
            callbr = callname( function_name , char(input_button_name(1,9)) );                                               
            button_31 = uicontrol( 'String' , char(input_button_name(1,9)) , ...
                                   'Parent' , PANEL_3                      , ...
                                   'Style' , 'pushbutton'                  , ...
                                   'Callback' , callbr                     , ...
                                   'HorizontalAlignment' , 'center'        , ...
                                   'Units' , 'pixels'                      , ...
                                   'Visible' , 'on'                        , ...
                                   'Enable' , 'on'                         , ...
                                   'ForegroundColor' , black               , ...
                                   'FontUnits' , 'pixels'                  , ...
                                   'FontWeight' , 'bold'                    , ...
                                   'FontSize' , 13                         , ...
                                   'Position' , [ 25 , 25 , 169 , 80 ]       ...                                        
                                 );
                                            
           
            callbr = callname( function_name , char(input_button_name(1,10)) );                                               
            button_32 = uicontrol( 'String' , char(input_button_name(1,10)) , ...
                                   'Parent' , PANEL_3                       , ...
                                   'Style' , 'pushbutton'                   , ...
                                   'Callback' , callbr                      , ...
                                   'HorizontalAlignment' , 'center'         , ...
                                   'Units' , 'pixels'                       , ...
                                   'Visible' , 'on'                         , ...
                                   'Enable' , 'on'                          , ...
                                   'ForegroundColor' , black                , ...
                                   'FontUnits' , 'pixels'                   , ...
                                   'FontWeight' , 'bold'                    , ...
                                   'FontSize' , 13                          , ...
                                   'Position' , [ 219 , 25 , 169 , 80 ]       ...                                        
                                 );
                                            
                   
            callbr = callname( function_name , char(input_button_name(1,11)) );                                               
            button_33= uicontrol( 'String' , char(input_button_name(1,11)) , ...
                                  'Parent' , PANEL_3                       , ...
                                  'Style' , 'pushbutton'                   , ...
                                  'Callback' , callbr                      , ...
                                  'HorizontalAlignment' , 'center'         , ...
                                  'Units' , 'pixels'                       , ...
                                  'Visible' , 'on'                         , ...
                                  'Enable' , 'on'                          , ...
                                  'ForegroundColor' , black                , ...
                                  'FontUnits' , 'pixels'                   , ...
                                  'FontWeight' , 'bold'                    , ...
                                  'FontSize' , 13                          , ...
                                  'Position' , [ 413 , 25 , 169 , 80 ]       ...                                        
                                );
                                             
                   
            callbr = callname( function_name , char(input_button_name(1,12)) );                                               
            button_34= uicontrol( 'String' , char(input_button_name(1,12)) , ...
                                  'Parent' , PANEL_3                       , ...
                                  'Style' , 'pushbutton'                   , ...
                                  'Callback' , callbr                      , ...
                                  'HorizontalAlignment' , 'center'         , ...
                                  'Units' , 'pixels'                       , ...
                                  'Visible' , 'on'                         , ...
                                  'Enable' , 'on'                          , ...
                                  'ForegroundColor' , black                , ...
                                  'FontUnits' , 'pixels'                   , ...
                                  'FontWeight' , 'bold'                    , ...
                                  'FontSize' , 13                          , ...
                                  'Position' , [ 607 , 25 , 169 , 80 ]       ...                                        
                                );



                                                                                           
            callbr = callname( function_name , char(input_button_name(1,13)) );                                               
            button_41 = uicontrol( 'String' , char(input_button_name(1,13)) , ...
                                   'Parent' , PANEL_4                       , ...
                                   'Style' , 'pushbutton'                   , ...
                                   'Callback' , callbr                      , ...
                                   'HorizontalAlignment' , 'center'         , ...
                                   'Units' , 'pixels'                       , ...
                                   'Visible' , 'on'                         , ...
                                   'Enable' , 'on'                          , ...
                                   'ForegroundColor' , black                , ...
                                   'FontUnits' , 'pixels'                   , ...
                                   'FontWeight' , 'bold'                    , ...
                                   'FontSize' , 13                          , ...
                                   'Position' , [ 25 , 25 , 169 , 80 ]        ...                                        
                                 );
                                            
           
            callbr = callname( function_name , char(input_button_name(1,14)) );                                               
            button_42 = uicontrol( 'String' , char(input_button_name(1,14)) , ...
                                   'Parent' , PANEL_4                       , ...
                                   'Style' , 'pushbutton'                   , ...
                                   'Callback' , callbr                      , ...
                                   'HorizontalAlignment' , 'center'         , ...
                                   'Units' , 'pixels'                       , ...
                                   'Visible' , 'on'                         , ...
                                   'Enable' , 'on'                          , ...
                                   'ForegroundColor' , black                , ...
                                   'FontUnits' , 'pixels'                   , ...
                                   'FontWeight' , 'bold'                    , ...
                                   'FontSize' , 13                          , ...
                                   'Position' , [ 219 , 25 , 169 , 80 ]       ...                                        
                                  );
                                            
                   
            callbr = callname( function_name , char(input_button_name(1,15)) );                                               
            button_43= uicontrol( 'String' , char(input_button_name(1,15)) , ...
                                  'Parent' , PANEL_4                       , ...
                                  'Style' , 'pushbutton'                   , ...
                                  'Callback' , callbr                      , ...
                                  'HorizontalAlignment' , 'center'         , ...
                                  'Units' , 'pixels'                       , ...
                                  'Visible' , 'on'                         , ...
                                  'Enable' , 'on'                          , ...
                                  'ForegroundColor' , black                , ...
                                  'FontUnits' , 'pixels'                   , ...
                                  'FontWeight' , 'bold'                    , ...
                                  'FontSize' , 13                          , ...
                                  'Position' , [ 413 , 25 , 169 , 80 ]       ...                                        
                                );
                                             
                   
            callbr = callname( function_name , char(input_button_name(1,16)) );                                               
            button_44= uicontrol( 'String' , char(input_button_name(1,16)) , ...
                                  'Parent' , PANEL_4                       , ...
                                  'Style' , 'pushbutton'                   , ...
                                  'Callback' , callbr                      , ...
                                  'HorizontalAlignment' , 'center'         , ...
                                  'Units' , 'pixels'                       , ...
                                  'Visible' , 'on'                         , ...
                                  'Enable' , 'on'                          , ...
                                  'ForegroundColor' , black                , ...
                                  'FontUnits' , 'pixels'                   , ...
                                  'FontWeight' , 'bold'                    , ...
                                  'FontSize' , 13                          , ...
                                  'Position' , [ 607 , 25 , 169 , 80 ]       ...                                        
                                );


                   
            callbr = callname( function_name , char(input_button_name(1,17)) );                                               
            exit_button = uicontrol( 'String' , 'OK'                        , ...
                                     'Parent' , GENERAL_FIGURE              , ...
                                     'Style' , 'pushbutton'                 , ...
                                     'Callback' , callbr                    , ...
                                     'HorizontalAlignment' , 'center'       , ...
                                     'Units' , 'pixels'                     , ...
                                     'Visible' , 'on'                       , ...
                                     'Enable' , 'on'                        , ...
                                     'ForegroundColor' , black              , ...
                                     'FontUnits' , 'pixels'                 , ...
                                     'FontSize' , 25                        , ...
                                     'Position' , [ 855 , 30 , 120 , 465  ]   ...                                        
                                   );
                                            
                                          
    % buttons
    % =========================== end =====================================
    % =====================================================================
                                                     
              
            
    
    
    % dynamic text
    %+++++++++++++++++++++++++++++ begin  +++++++++++++++++++++++++++++++++
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++                     
                       
                        
                                                                           
            display_text = uicontrol( 'String' , ''                            , ...
                                      'Parent' , GENERAL_FIGURE               , ...
                                      'Style' , 'text'                         , ...
                                      'HorizontalAlignment' , 'center'         , ...
                                      'Units' , 'pixels'                       , ...
                                      'Visible' , 'on'                         , ...
                                      'Enable' , 'on'                          , ...
                                      'BackgroundColor' , colour_display      , ...
                                      'ForegroundColor' , black                , ...
                                      'FontUnits' , 'pixels'                   , ...
                                      'FontSize' , 18                          , ...
                                      'Position' , [ 855 , 520 , 120 , 140  ]    ...                                        
                                    );              
                                        
    % dynamic text
    %++++++++++++++++++++++++++++++  end  +++++++++++++++++++++++++++++++++
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++      
    
    
    
    
              data_list  = [ button_11      , ... %1  button
                             button_12      , ... %2  button
                             button_13      , ... %3  button
                             button_14      , ... %4  button
                             button_21      , ... %5  button
                             button_22      , ... %6  button
                             button_23      , ... %7  button
                             button_24      , ... %8  button
                             button_31      , ... %9  button
                             button_32      , ... %10 button
                             button_33      , ... %11 button
                             button_34      , ... %12 button
                             button_41      , ... %13 button
                             button_42      , ... %14 button
                             button_43      , ... %15 button
                             button_44      , ... %16 button
                             exit_button    , ... %17 button
                             display_text     ... %18 text
                           ];
    
                           
              set( GENERAL_FIGURE , 'UserData' , data_list );
              set( GENERAL_FIGURE , 'Visible' , 'off' );
              
              set( GENERAL_FIGURE , 'CloseRequestFcn' , 'closereq' );
              set( GENERAL_FIGURE , 'Backingstore' , 'on' );
              
              watchoff( mouse_pointer );
    
output = GENERAL_FIGURE;
