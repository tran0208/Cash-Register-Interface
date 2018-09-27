% panel start at the far top left hand corner
  
function shop_program( action )
    
    % figures
    global CUSTOMER_VIEW  
    global MAIN_PANELS   
    
    %The ticket panel parameters
    global  TICKET_PANEL
    global  TICKET_BUTTON_NAMES
    global  TICKET_PRICES
    global  TICKET_QUANTITIES
    
    %The cigarette panel parameters
    global  CIGARETTE_PANEL
    global  CIGARETTE_BUTTON_NAMES
    global  CIGARETTE_PRICES
    global  CIGARETTE_QUANTITIES
    
    %The Street's Ice Cream panel parameters
    global  STREET_PANEL
    global  STREET_PANELS_NAME
    global  STREET_BUTTON_NAMES
    global  STREET_PRICES
    global  STREET_QUANTITIES
    
    %The "Other items panel" parameters
    global  EXTRAS_PANEL 
    global  EXTRAS_PANELS_NAME
    global  EXTRAS_BUTTON_NAMES
    global  EXTRAS_PRICES
    global  EXTRAS_QUANTITIES
    
    %The internet panel parameters
    %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    %Beginning of internet varaibles
    
    global  INTERNET_PANEL
    global  INTERNET_BUTTON_NAMES
    
    %variables used by the panel
    global  INTERNET_START_TIME_ARRAY
    global  INTERNET_END_TIME_ARRAY
    
    %constants used by the panel
    global  NUMBER_OF_COMPUTERS
    global  INTERNET_CHARGE_RATE
    global  MINIMUM_INTERNET_USAGE
    
    %Array used to save values used in the internet panel
    global  INTERNET_SAVE_TEXT_FIELDS
    global  INTERNET_SAVE_PARAMETERS
    
    %indicators for the internet panel
    global  INTERNET_BOOLEAN_PAYMENT_ARRAY

    %boolean variable for the user display
    global BOOLEAN_CUST
    
    %end of internet varaibles
    %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    
    %Positive for down and negative for up
    global SCROLL_DIRECTION

    global SUB_TOTAL
    global SUB_INTERNET_TOTAL
    global TOTAL_AMOUNT
    global INPUT_CASH
    global ARRAYLIST
    
    global RECORD_BOOLEAN
    
    %extra attributes
    global PAPER_TYPE
    global PAPER_PRICE
    
    % output file name
    global OUTPUT_DIRECTORY
    global OUTPUT_DIRECTORY_PRINT
    
    % Shop descriptions
    global SHOP_NAME
    global SHOP_ADDRESS  ABN_NUMBER
    global PHONE_NUMBER  INVOICE_NUMBER
    global TRADING_HOURS
    global GST
    
    % The name of the buttons in the shortcut
    global SHORTCUT_1_BUTTON_NAMES 
    global SHORTCUT_2_BUTTON_NAMES
    
    % The name of other task buttons
    global OTHER_BUTTON_NAMES
    
    % The number of items
    global ARRAY_COUNT_SHORTCUT_1 
    global ARRAY_COUNT_SHORTCUT_2
    
    % The prices of items 
    global ARRAY_PRICE_SHORTCUT_1
    global ARRAY_PRICE_SHORTCUT_2
    % name of the items
    global ARRAY_NAME_SHORTCUT_1
    global ARRAY_NAME_SHORTCUT_2
    
if nargin() < 1
    
    action = 'initialize';
    
    % initially set it to false
    RECORD_BOOLEAN = 0;
    
    BOOLEAN_CUST = 0;

    SUB_TOTAL= 0;
    SUB_INTERNET_TOTAL = 0;
    TOTAL_AMOUNT = 0;
    INPUT_CASH = 0;
    ARRAYLIST = struct( 'quantity' , 0 , 'money' , ''  , 'name' , '' );
    
    %Internet vaiables
    INTERNET_START_TIME_ARRAY      = [ -1 , -1 , -1 , -1  , -1 , -1 ];
    INTERNET_END_TIME_ARRAY        = [ -1 , -1 , -1 , -1  , -1 , -1 ];
    INTERNET_BOOLEAN_PAYMENT_ARRAY = [  0 ,  0 ,  0 ,  0  ,  0 ,  0 ];
    INTERNET_SAVE_PARAMETERS = struct( 'deposit'    , 0 , ...
                                       'start_time' , 0 , ...
                                       'end_time'   , 0   ...
                                     );
    INTERNET_SAVE_TEXT_FIELDS = struct( 'input'        , '' , ...
                                        'start_time'   , '' , ...
                                        'end_time'     , '' , ...
                                        'elapsed_time' , '' , ...
                                        'money'        , ''   ...
                                       );
    
    % half an hour as minimum internet usage
    MINIMUM_INTERNET_USAGE = 0.5;
    
    NUMBER_OF_COMPUTERS = 6;
    % initial the internet abstract data
    for i = 1:1:NUMBER_OF_COMPUTERS
        INTERNET_SAVE_PARAMETERS(i).deposit = 0;
        INTERNET_SAVE_PARAMETERS(i).start_time = -1;
        INTERNET_SAVE_PARAMETERS(i).end_time = -1;
    end
    
    % initial the internet abstract data
    for i = 1:1:NUMBER_OF_COMPUTERS
        INTERNET_SAVE_TEXT_FIELDS(i).input = '';
        INTERNET_SAVE_TEXT_FIELDS(i).start_time = '';
        INTERNET_SAVE_TEXT_FIELDS(i).end_time = '';
        INTERNET_SAVE_TEXT_FIELDS(i).elapsed_time = ''; 
        INTERNET_SAVE_TEXT_FIELDS(i).money = '';
    end
    
    %Name of output file
    OUTPUT_DIRECTORY = 0;
    OUTPUT_DIRECTORY_PRINT = 0;
    
    %set to default value
    SCROLL_DIRECTION = 0;

    % description of shop
    SHOP_NAME = 'SHOP NAME';
    SHOP_ADDRESS = { '123 StreetName' , 'SUBURB POSTCODE' , 'STATE, COUNTRY' };
    ABN_NUMBER = '1234567890';
    PHONE_NUMBER = '123456789';
    INVOICE_NUMBER = '';
    TRADING_HOURS = { 'MON-FRI 6:30am-5:00pm' , ...
                      'SAT 6:30am-5:00pm'     , ...
                      'SUN 6:30am-5:00pm'       ...
                    };
                    
    % consider the shorcut panel 1
    ARRAY_COUNT_SHORTCUT_1 = zeros(1,6); 
    % consider the shorcut panel 2
    ARRAY_COUNT_SHORTCUT_2 = zeros(1,8);
    % Tickets 
    TICKET_QUANTITIES = zeros(1,19);
    
    % Cigarettes
    CIGARETTE_QUANTITIES = zeros(1,24);
    
    %The Street's Ice Cream quantity count
    STREET_QUANTITIES = zeros(1,16);
    
    %The "Other items panel" quantity count
    EXTRAS_QUANTITIES = zeros(1,16);
    
    
    OTHER_BUTTON_NAMES = { 'New Customer'      , ...  %1
                           'Show Total Amount' , ...  %2
                           'Generate Change'   , ...  %3
                           'Record'            , ...  %4
                           'Print'             , ...  %5
                           'Exit Program'      , ...  %6
                           'Up'                , ...  %7
                           'Down'                ...  %8
                         }; 
    
    
           
    INTERNET_BUTTON_NAMES = { 'Reset 1' , 'Start 1' , 'End 1' , ...  %1  ,  2  , 3
                              'Reset 2' , 'Start 2' , 'End 2' , ...  %4  ,  5  , 6
                              'Reset 3' , 'Start 3' , 'End 3' , ...  %7  ,  8  , 9
                              'Reset 4' , 'Start 4' , 'End 4' , ...  %10 ,  11 , 12
                              'Reset 5' , 'Start 5' , 'End 5' , ...  %13 ,  14 , 15
                              'Reset 6' , 'Start 6' , 'End 6' , ...  %16 ,  17 , 18
                              'Undo'    , ...                        %19
                              'Exit Internet'                   ...  %20
                            };
        
                            
    SHORTCUT_1_BUTTON_NAMES = { 'P&N 600mL'      , ...  %1
                                'H2Go Water'     , ...  %2
                                'Pura Milk 1.0L' , ...  %3
                                'Pura Milk 2.0L' , ...  %4
                                'V 250mL'        , ...  %5
                                'V 350mL'        , ...  %6
                                'Street'         , ...  %7
                                'Others'            ...  %8
                              }; 
                                               
    % consider the shorcut panel 2
    SHORTCUT_2_BUTTON_NAMES = { 'Daily Paper' , ...  1
                                'Milk 250mL'  , ...  2
                                'Milk 600mL'  , ...  3
                                'Villi'       , ...  4
                                'Balfour'     , ...  5
                                'Sauce'       , ...  6
                                'Can 375mL'   , ...  7
                                'Coke 600mL'  , ...  8
                                'Ticket'      , ...  9
                                'Cigarette'   , ...  10
                                'Internet'      ...  11
                              };
      
    [ n , s ] = weekday(date);    
    if n == 1 
         PAPER_TYPE = 'Sunday Mail';
         PAPER_PRICE = 2.00;
    elseif n == 7
         PAPER_TYPE = 'Saturday Advertiser';
         PAPER_PRICE = 2.00;
    else
         PAPER_TYPE = 'The Advertiser';
         PAPER_PRICE = 1.10;
    end                           
                              
    % 4 dollars per hour
    INTERNET_CHARGE_RATE = 4;

    
    % GST percentage
    GST = 0.1;
    
    ARRAY_PRICE_SHORTCUT_1 = [ 1.70  , ...  P_N_600mL    %1
                               3.00  , ...  H2Go Water   %2
                               2.80  , ...  MILK_1L      %3
                               4.50  , ...  MILK_2L      %4
                               3.00  , ...  V_250mL      %5
                               3.50    ...  V_350mL      %6
                             ];
    ARRAY_NAME_SHORTCUT_1 = { 'P&N 600mL'       , ... % 1
                              'H2Go Water'      , ... % 2
                              'Pura Milk 1.0L'  , ... % 3
                              'Pura Milk 2.0L'  , ... % 4
                              'V 250mL'         , ... % 5
                              'V 350mL'           ... % 6
                            };

    ARRAY_PRICE_SHORTCUT_2 = [  PAPER_PRICE , ...  % daily paper    1
                                2.60        , ...  % MILK_250mL     2
                                3.30        , ...  % MILK_600mL     3
                                3.40        , ...  % VILLI          4
                                3.30        , ...  % BALFOURS       5
                                0.20        , ...  % SAUCE          6
                                1.60        , ...  % CAN_375mL      7
                                3.20          ...  % BOTTLE_600mL   8
                             ];
    ARRAY_NAME_SHORTCUT_2 = {  PAPER_TYPE                    , ...   1
                              'Farmer''s Union Coffee 250mL' , ...   2
                              'Farmer''s Union Coffee 600mL' , ...   3
                              'Villi''s Product'             , ...   4
                              'Balfour''s Product'           , ...   5
                              'Masterfood Tomato Sauce'      , ...   6
                              '375mL Can'                    , ...   7
                              '600mL Bottle'                   ...   8
                            };

                        
    [ n , s ] = weekday(date); 
    [ array_price , array_name ] = extract_values_from_file( '\shop_parameters\main.txt' );
    if ~isequal( array_price , 0 ) && ~isequal( array_name , 0 )
         
            v = length( array_price );
            
            if v >= 6
                %parameters for shortcut 1
                for i = 1:1:6
                    ARRAY_PRICE_SHORTCUT_1(i) = array_price(i);
                    ARRAY_NAME_SHORTCUT_1(i) = array_name(i);
                end
            end
            
            if v >= 9
                if n == 1
                     PAPER_PRICE = array_price(1,9);
                     PAPER_TYPE = char( array_name(9) );
                elseif n == 7
                     PAPER_PRICE = array_price(8);
                     PAPER_TYPE = char( array_name(8) );
                else
                     PAPER_PRICE = array_price(7);
                     PAPER_TYPE = char( array_name(7) );
                end  
                ARRAY_NAME_SHORTCUT_2(1) = {PAPER_TYPE};
            end
            
            if v >= 16
                %parameters for shortcut 2
                for i = 1:1:7
                    ARRAY_PRICE_SHORTCUT_2(1+i) = array_price(9+i);;
                    ARRAY_NAME_SHORTCUT_2(1+i) = array_name(9+i);;
                end
            end
            
            if v >= 17
                INTERNET_CHARGE_RATE = array_price(17);
            end
            
            if v >= 18
                GST = array_price(18);
            end
    end


    
    % array of the ticket prices
    TICKET_PRICES = [ 27.80 , ... % multitrip    1
                      13.80 , ... % multitrip    2
                      9.30  , ... % multitrip    3
                      15.10 , ... % multitrip    4
                      15.30 , ... % multitrip    5
                      7.30  , ... % multitrip    6
                      7.30  , ... % multitrip    7
                      11.70 , ... % multitrip    8
                      4.20  , ... % single trip  9
                      2.10  , ... % single trip  10
                      2.00  , ... % single trip  11
                      2.50  , ... % single trip  12
                      2.60  , ... % single trip  13
                      1.20  , ... % single trip  14
                      1.20  , ... % single trip  15
                      1.70  , ... % single trip  16
                      8.00  , ... % daytrip      17
                      4.00  , ... % daytrip      18
                      4.00    ... % daytrip      19
                    ];                     
    TICKET_BUTTON_NAMES = { 'Multi-Trip Regular'              , ...   1
                            'Multi-Trip Tertiary'             , ...   2
                            'Multi-Trip Secondary'            , ...   3
                            'Multi-Trip 2 Section Regular'    , ...   4
                            'Multi-Trip Interpeak Regular'    , ...   5
                            'Multi-Trip Interpeak Tertiary'   , ...   6
                            'Multi-Trip Interpeak Secondary'  , ...   7
                            'Multi-Trip Interpeak 2 Section'  , ...   8
                            'Single-Trip Regular'             , ...   9
                            'Single-Trip Tertiary'            , ...   10
                            'Single-Trip Secondary'           , ...   11
                            'Single-Trip 2 Section Regular'   , ...   12
                            'Single-Trip Interpeak Regular'   , ...   13
                            'Single-Trip Interpeak Tertiary'  , ...   14
                            'Single-Trip Interpeak Secondary' , ...   15
                            'Single-Trip Interpeak 2 Section' , ...   16
                            'Daytrip Regular'                 , ...   17
                            'Daytrip Tertiary'                , ...   18
                            'Daytrip Secondary'               , ...   19
                            'Exit Ticket'                       ...   20
                          };
    [ array_price , array_name ] = extract_values_from_file( '\shop_parameters\ticket.txt' );
    if ~isequal( array_price , 0 ) && ~isequal( array_name , 0 )
            n = length(array_price);
            TICKET_PRICES = array_price;
            for i = 1:1:n
                TICKET_BUTTON_NAMES(i) = array_name(i);
            end
    end
                          
                          

    CIGARETTE_PRICES = [ 17.50 , ... Long Beach 40'         %1
                         13.60 , ... Long Beach 30'         %2
                         9.30  , ... Long Beach 20'         %3
                         21.00 , ... Holiday 50'            %4
                         12.50 , ... Alphine 25'            %5
                         9.30  , ... Peter Jackson 20'      %6
                         11.50 , ... Peter Jackson 25'      %7
                         13.80 , ... Peter Jackson 30'      %8
                         21.00 , ... Horizon 50'            %9
                         13.30 , ... Horizon 30'            %10
                         9.00  , ... Horizon 20'            %11
                         10.50 , ... Stuyvesant 20'         %12
                         2.00  , ... Colts Cigar'           %13
                         12.80 , ... Marlboro 25'           %14
                         12.80 , ... Benson & Hedges 25'    %15
                         16.00 , ... Escort 35'             %16
                         11.80 , ... Escort 25'             %17
                         9.50  , ... Escort 20'             %18
                         9.00  , ... Holiday 20'            %19
                         9.00  , ... Pall Mall 20'          %20
                         9.50  , ... Super King 20'         %21
                         13.00 , ... Dunhill 25'            %22
                         11.00 , ... Choice 25'             %23
                         12.50   ... Winfield 25'           %24
                       ];
    CIGARETTE_BUTTON_NAMES = { 'Long Beach 40'      , ...  %1
                               'Long Beach 30'      , ...  %2
                               'Long Beach 20'      , ...  %3
                               'Holiday 50'         , ...  %4
                               'Alphine  25'        , ...  %5
                               'Peter Jackson  20'  , ...  %6
                               'Peter Jackson  25'  , ...  %7
                               'Peter Jackson  30'  , ...  %8
                               'Horizon 50'         , ...  %9
                               'Horizon 30'         , ...  %10
                               'Horizon 20'         , ...  %11
                               'Stuyvesant 20'      , ...  %12
                               'Colts Cigar'        , ...  %13
                               'Marlboro 25'        , ...  %14
                               'Benson & Hedges 25' , ...  %15
                               'Escort 35'          , ...  %16
                               'Escort 25'          , ...  %17
                               'Escort 20'          , ...  %18
                               'Holiday 20'         , ...  %19
                               'Pall Mall 20'       , ...  %20
                               'Super King 20'      , ...  %21
                               'Dunhill 25'         , ...  %22
                               'Choice 25'          , ...  %23
                               'Winfield 25'        , ...  %24
                               'Exit Cigarette'       ...  %25
                              };
    [ array_price , array_name ] = extract_values_from_file( '\shop_parameters\cigarette.txt' );
    if ~isequal( array_price , 0 ) && ~isequal( array_name , 0 )
            n = length( array_price );
            CIGARETTE_PRICES = array_price;
            for i = 1:1:n
                CIGARETTE_BUTTON_NAMES(i) = array_name(i);
            end
    end
                          
             
                                
                                    
    STREET_PRICES =  [ 3.40 , ... %Magnum                                1
                       3.40 , ... %Cornetto                              2
                       1.60 , ... %Paddle Pop                            3
                       3.00 , ... %Golden Gaytime                        4
                       2.00 , ... %Paddle Pop: Moo                       5
                       2.50 , ... %Paddle Pop: Frozen Thick Shake        6
                       1.50 , ... %Paddle Pop: Pop Icy twist             7
                       3.40 , ... %Cookie Choc Chip                      8
                       2.20 , ... %Splice: Pine-lime                     9
                       3.00 , ... %Splice Exotic Fruits: Berry delight   10
                       3.00 , ... %Splice Exotic Fruits: mango Passion   11
                       2.40 , ... %Bubble O-Bill                         12
                       2.20 , ... %'Calippo: Lemon'                      13
                       2.20 , ... %'Calippo: raspberry pineapple'        14
                       3.20 , ... %'Calippo: Berry                       15  
                       3.20   ... %'Calippo: Mango                       16
                      ];
    STREET_BUTTON_NAMES = { 'Magnum'                , ... %1
                            'Cornetto'              , ... %2
                            'Paddle Pop'            , ... %3
                            'Golden Gaytime'        , ... %4
                            'Paddle Pop: Moo'       , ... %5
                            'Frozen Thick Shake'    , ... %6
                            'Paddle Pop: Icy Twist' , ... %7
                            'Cookie Choc Chip'      , ... %8
                            'Splice: Pine-line'     , ... %9
                            'Splice: Berry'         , ... %10
                            'Splice: Mango'         , ... %11
                            'Bubble O Bill'         , ... %12
                            'Calippo: Lemon'        , ... %13
                            'Calippo: Raspberry'    , ... %14
                            'Calippo Gelato: Berry' , ... %15
                            'Calippo Gelato: Mango' , ... %16
                            'Exit Street' ...             %17
                          };
    STREET_PANELS_NAME = { '' , '' , '' , '' };                        
    [ array_price , array_name ] = extract_values_from_file( '\shop_parameters\street.txt' );
    if ~isequal( array_price , 0 ) && ~isequal( array_name , 0 )
            n = length( array_price );
            STREET_PRICES = array_price;
            for i = 1:1:n
                STREET_BUTTON_NAMES(i) = array_name(i);
            end
    end
                    
           
    EXTRAS_PRICES = [ 10.00 , ...  Optus Prepay $10  %1
                      15.00 , ...  Optus Prepay $15  %2
                      30.00 , ...  Optus Prepay $30  %3
                      50.00 , ...  Optus Prepay $50  %4
                      3.00  , ...  1L Light Start    %5
                      3.00  , ...  1L Skimmer        %6
                      4.00  , ...  1L Ice Coffee     %7
                      4.80  , ...  2L Light Start    %8
                      3.30  , ...  Big M             %9
                      3.00  , ...  Berri Juice       %10
                      2.50  , ...  600mL Pura Milk   %11
                      2.50  , ...  Thick Cream       %12
                      2.50  , ...  Extra             %13
                      2.50  , ...  Eclipse           %14
                      2.00  , ...  Nerds             %15
                      1.20    ...  Hubba Bubba       %16
                    ];
    EXTRAS_BUTTON_NAMES = { 'Optus Prepay $10'     , ... %1
                            'Optus Prepay $15'     , ... %2
                            'Optus Prepay $30'     , ... %3
                            'Optus Prepay $50'     , ... %4
                            'Light Start 1 Litre'  , ... %5
                            'Skimmer 1 Litre'      , ... %6
                            'Ice Coffee 1 Litre'   , ... %7
                            'Light Start 2 Litres' , ... %8
                            'Big M'                , ... %9
                            'Berri Juice'          , ... %10
                            '600mL Pura Milk'      , ... %11
                            'Thick Cream'          , ... %12
                            'Extra'                , ... %13
                            'Eclipse'              , ... %14
                            'Nerds'                , ... %15
                            'Hubba Bubba'          , ... %16                             
                            'Extra Exit'             ... %17
                          };
    EXTRAS_PANELS_NAME = { 'Optus Prepay'        , ...
                           'Other Milk Products' , ...
                           '' , ...
                           '' ... 
                         };
    [ array_price , array_name ] = extract_values_from_file( '\shop_parameters\other.txt' );
    if ~isequal( array_price , 0 ) && ~isequal( array_name , 0 )
            n = length( array_price );
            EXTRAS_PRICES = array_price;
            for i = 1:1:n
                EXTRAS_BUTTON_NAMES(i) = array_name(i);
            end
    end
    
end


if strcmp( action , 'initialize' )
       
       %setup customer view panel
       CUSTOMER_VIEW = customer_figure( SHOP_NAME );
       
       % start the user view panel 
       MAIN_PANELS = shop_figure(  SHOP_NAME               , ...
                                   'shop_program'          , ...
                                   SHORTCUT_1_BUTTON_NAMES , ...
                                   SHORTCUT_2_BUTTON_NAMES , ...
                                   OTHER_BUTTON_NAMES        ...
                                );
                                
       % setup the ticket panel
       TICKET_PANEL = ticket( 'shop_program'      , ...
                              TICKET_BUTTON_NAMES , ...
                              TICKET_PRICES         ...
                            );
                            
       % setup the ticket panel
       CIGARETTE_PANEL = cigarette( 'shop_program'         , ...
                                    CIGARETTE_BUTTON_NAMES , ...
                                    CIGARETTE_PRICES         ...
                                  );
                            
       % setup the internet panel
       INTERNET_PANEL = internet( 'shop_program'        , ...
                                  INTERNET_BUTTON_NAMES   ...
                                );
            
       % setup the street ice cream panel                          
       STREET_PANEL = general_figure( 'shop_program'        , ...
                                      'Street''s Ice Cream' , ...
                                      STREET_PANELS_NAME    , ...
                                      STREET_BUTTON_NAMES     ...
                                    );
       
       % setup the additional items panel                         
       EXTRAS_PANEL = general_figure( 'shop_program'      , ...
                                      'Additional Items'  , ...
                                      EXTRAS_PANELS_NAME  , ...
                                      EXTRAS_BUTTON_NAMES   ...
                                    );
       
                                    
elseif strcmp( action , char(SHORTCUT_2_BUTTON_NAMES(1,1)) )  %'paper_button'
              
                  data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                  ARRAY_COUNT_SHORTCUT_2(1,1) = ARRAY_COUNT_SHORTCUT_2(1,1) + 1;

                  SUB_TOTAL = SUB_TOTAL + ARRAY_PRICE_SHORTCUT_2(1,1);

                  value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                  comment = num2str( value, '%3.2f');
                  comment = [ '$' , comment ];
                  %display total to main panel
                  set( data_list_user(36) , 'String' , comment );
                  
                  
                  % Clear user display
                  % 16 display in total
                  for i = 1:1:16
                      %display to customer
                      set( data_list_user(38+i) , 'String' , '' );
                  end
                  
                  comment = num2str( ARRAY_PRICE_SHORTCUT_2(1,1) , '%3.2f');
                  comment = [ '' , num2str( ARRAY_COUNT_SHORTCUT_2(1,1) ) , ' * ' , '$' , comment , '   ' ,  char( ARRAY_NAME_SHORTCUT_2(1,1) ) , '' ];
                  %display what was selectedin the main panel
                  set( data_list_user(39) , 'String' , comment );
              
                      
              catch
                  % when error occurs
                  error('An error has occurred: paper_button' );
                  
              end
              
              
elseif strcmp( action , char(SHORTCUT_2_BUTTON_NAMES(1,2)) )   % 'milk_250mL_button'
              
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                      ARRAY_COUNT_SHORTCUT_2(1,2) = ARRAY_COUNT_SHORTCUT_2(1,2) + 1;

                      SUB_TOTAL = SUB_TOTAL + ARRAY_PRICE_SHORTCUT_2(1,2);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
                  
                      % Clear user display
                      % 16 display in total
                      for i = 1:1:16
                          %display to customer
                          set( data_list_user(38+i) , 'String' , '' );
                      end
                  
                      comment = num2str( ARRAY_PRICE_SHORTCUT_2(1,2) , '%3.2f');
                      comment = [ '' , num2str( ARRAY_COUNT_SHORTCUT_2(1,2) ) , ' * ' , '$' , comment , '   ' ,  char( ARRAY_NAME_SHORTCUT_2(1,2) ) , '' ];
                      set( data_list_user(39) , 'String' , comment );
              
                    
              catch
                      % when error occurs
                      error('An error has occurred: milk_250mL_button' );
  
                      
              end
              
              
elseif strcmp( action , char(SHORTCUT_2_BUTTON_NAMES(1,3)) ) %'milk_600mL_button' 
              
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
               
               try
                      ARRAY_COUNT_SHORTCUT_2(1,3) = ARRAY_COUNT_SHORTCUT_2(1,3) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + ARRAY_PRICE_SHORTCUT_2(1,3);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
                  
                      % Clear user display
                      % 16 display in total
                      for i = 1:1:16
                          %display to customer
                          set( data_list_user(38+i) , 'String' , '' );
                      end
                  
                      comment = num2str( ARRAY_PRICE_SHORTCUT_2(1,3) , '%3.2f' );
                      comment = [ '' , num2str( ARRAY_COUNT_SHORTCUT_2(1,3) ) , ' * ' , '$' , comment , '   ' ,  char( ARRAY_NAME_SHORTCUT_2(1,3) ) , '' ];
                      set( data_list_user(39) , 'String' , comment );
              
                      
               catch
                      % when error occurs
                      error('An error has occurred: milk_600mL_button' );
                 
               end
              
               
elseif strcmp( action , char(SHORTCUT_2_BUTTON_NAMES(1,4)) )  %'villi_button' 
             
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
               
               try
                      ARRAY_COUNT_SHORTCUT_2(1,4) = ARRAY_COUNT_SHORTCUT_2(1,4) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + ARRAY_PRICE_SHORTCUT_2(1,4);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f' );
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
                  
                      % Clear user display
                      % 16 display in total
                      for i = 1:1:16
                          %display to customer
                          set( data_list_user(38+i) , 'String' , '' );
                      end
                  
                      comment = num2str( ARRAY_PRICE_SHORTCUT_2(1,4) , '%3.2f' );
                      comment = [ '' , num2str( ARRAY_COUNT_SHORTCUT_2(1,4) ) , ' * ' , '$' , comment , '   ' ,  char( ARRAY_NAME_SHORTCUT_2(1,4) ) , '' ];
                      set( data_list_user(39) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred: villi_button' );

              end
              
elseif strcmp( action , char(SHORTCUT_2_BUTTON_NAMES(1,5)) )  %'balfours_button'
              
                  data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                  ARRAY_COUNT_SHORTCUT_2(1,5) = ARRAY_COUNT_SHORTCUT_2(1,5) + 1;
                  
                  SUB_TOTAL= SUB_TOTAL + ARRAY_PRICE_SHORTCUT_2(1,5);
                  value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                  comment = num2str( value , '%3.2f');
                  comment = [ '$' , comment ];
                  set( data_list_user(36) , 'String' , comment );
                  
                  
                  % Clear user display
                  % 16 display in total
                  for i = 1:1:16
                      %display to customer
                      set( data_list_user(38+i) , 'String' , '' );
                  end
                  
                  comment = num2str( ARRAY_PRICE_SHORTCUT_2(1,5) , '%3.2f' );
                  comment = [ '' , num2str( ARRAY_COUNT_SHORTCUT_2(1,5) ) , ' * ' , '$' , comment , '   ' ,  char( ARRAY_NAME_SHORTCUT_2(1,5) ) , '' ];
                  set( data_list_user(39) , 'String' , comment );
              
                      
              catch
                  % when error occurs
                  error('An error has occurred: balfours_button' );
                  
              end
              
elseif strcmp( action , char(SHORTCUT_2_BUTTON_NAMES(1,6)) )  % 'sauce_button'
              
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try 
                      ARRAY_COUNT_SHORTCUT_2(1,6) = ARRAY_COUNT_SHORTCUT_2(1,6) + 1;

                      SUB_TOTAL= SUB_TOTAL + ARRAY_PRICE_SHORTCUT_2(1,6);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
                      
                      % Clear user display
                      % 16 display in total
                      for i = 1:1:16
                          %display to customer
                          set( data_list_user(38+i) , 'String' , '' );
                      end
                  
                      comment = num2str( ARRAY_PRICE_SHORTCUT_2(1,6) , '%3.2f' );
                      comment = [ '' , num2str( ARRAY_COUNT_SHORTCUT_2(1,6) ) , ' * ' , '$' , comment , '   ' ,  char( ARRAY_NAME_SHORTCUT_2(1,6) ) , '' ];
                      set( data_list_user(39) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred: sauce_button' );
                  
                      
              end

              
elseif strcmp( action , char(SHORTCUT_2_BUTTON_NAMES(1,7)) ) %'coke_375ml_button' 
              
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                      ARRAY_COUNT_SHORTCUT_2(1,7) = ARRAY_COUNT_SHORTCUT_2(1,7) + 1;

                      SUB_TOTAL= SUB_TOTAL + ARRAY_PRICE_SHORTCUT_2(1,7);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
                      
                      % Clear user display
                      % 16 display in total
                      for i = 1:1:16
                          %display to customer
                          set( data_list_user(38+i) , 'String' , '' );
                      end
                  
                      comment = num2str( ARRAY_PRICE_SHORTCUT_2(1,7) , '%3.2f' );
                      comment = [ '' , num2str( ARRAY_COUNT_SHORTCUT_2(1,7) ) , ' * ' , '$' , comment , '   ' ,  char( ARRAY_NAME_SHORTCUT_2(1,7) ) , '' ];
                      set( data_list_user(39) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred: coke_375ml_button' );
                  
              end
              
elseif strcmp( action , char(SHORTCUT_2_BUTTON_NAMES(1,8)) )  %'coke_600ml_button' 
    
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                      ARRAY_COUNT_SHORTCUT_2(1,8) = ARRAY_COUNT_SHORTCUT_2(1,8) + 1;
                  
                      SUB_TOTAL= SUB_TOTAL + ARRAY_PRICE_SHORTCUT_2(1,8);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      

                      % Clear user display
                      % 16 display in total
                      for i = 1:1:16
                          %display to customer
                          set( data_list_user(38+i) , 'String' , '' );
                      end
                  
                      comment = num2str( ARRAY_PRICE_SHORTCUT_2(1,8) , '%3.2f' );
                      comment = [ '' , num2str( ARRAY_COUNT_SHORTCUT_2(1,8) ) , ' * ' , '$' , comment , '   ' ,  char( ARRAY_NAME_SHORTCUT_2(1,8) ) , '' ];
                      set( data_list_user(39) , 'String' , comment );
              
              catch
                      % when error occurs
                      error('An error has occurred: coke_600ml_button' );
              end
              
              
            
% Ticket button              
elseif strcmp( action , char(SHORTCUT_2_BUTTON_NAMES(1,9)) )     
    
              try 
                  
                  data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
                  for i = 1:1:26
                       set( data_list_user(i) , 'Enable' , 'off' );
                  end
              
                  % The ticket button is left enable
                  set( data_list_user(14) , 'Enable' , 'on' );
                  
                  set( TICKET_PANEL , 'Visible' , 'on' );
                  
              catch
                  
                  for i = 1:1:26
                       set( data_list_user(i) , 'Enable' , 'on' );
                  end
                  
                  % setup the ticket panel
                  TICKET_PANEL = ticket( 'shop_program' , ...
                                         TICKET_BUTTON_NAMES , ...
                                         TICKET_PRICES ...
                                       );
              end            
          
%cigarette                    
elseif strcmp( action , char(SHORTCUT_2_BUTTON_NAMES(1,10)) )  
    
                  data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
                  for i = 1:1:26
                       set( data_list_user(i) , 'Enable' , 'off' );
                  end
              
                  % The cigarette button is left enable
                  set( data_list_user(15) , 'Enable' , 'on' );
               
              try
                  
                  set( CIGARETTE_PANEL , 'Visible' , 'on' );
                  data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' );
                  set( data_list_cigarette(26) , 'String' , '' );
                  
              catch
                  
                  for i = 1:1:26
                       set( data_list_user(i) , 'Enable' , 'on' );
                  end
                  
                  % setup the cigarette panel
                  CIGARETTE_PANEL = cigarette( 'shop_program'         , ...
                                               CIGARETTE_BUTTON_NAMES , ...
                                               CIGARETTE_PRICES         ...
                                             );
              end     
              
              
% internet access
elseif strcmp( action , char(SHORTCUT_2_BUTTON_NAMES(1,11)) )  
    
              data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              for i = 1:1:26
                    set( data_list_user(i) , 'Enable' , 'off' );
              end
              % The internet button is left enable
              set( data_list_user(16) , 'Enable' , 'on' );
              
              
              % Clear user display
              % 16 display in total
              for i = 1:1:16
                   %display to customer
                   set( data_list_user(38+i) , 'String' , '' );
              end
                  
              %reset this variable
              INTERNET_BOOLEAN_PAYMENT_ARRAY = zeros(1,NUMBER_OF_COMPUTERS);
              
              try   
                  
                    set( INTERNET_PANEL , 'Visible' , 'on' );
                    data_list_internet = get( INTERNET_PANEL , 'UserData' );
                    
                    % Load in the parameters of the panel  
                    for  i = 1:1:NUMBER_OF_COMPUTERS
                        
                            %load in previous values
                            INTERNET_START_TIME_ARRAY(i) = INTERNET_SAVE_PARAMETERS(i).start_time;
                            INTERNET_END_TIME_ARRAY(i) = INTERNET_SAVE_PARAMETERS(i).end_time;
                            
                            %start time display
                            set( data_list_internet(18+i) , 'String' , INTERNET_SAVE_TEXT_FIELDS(i).start_time );
                            
                            %end time display
                            set( data_list_internet(24+i) , 'String' , INTERNET_SAVE_TEXT_FIELDS(i).end_time );
                            
                            %elapsed time display
                            set( data_list_internet(30+i) , 'String' , INTERNET_SAVE_TEXT_FIELDS(i).elapsed_time );
                            
                            %input value
                            set( data_list_internet(36+i) , 'String' , INTERNET_SAVE_TEXT_FIELDS(i).input );
                            
                            %money display
                            set( data_list_internet(42+i) , 'String' , INTERNET_SAVE_TEXT_FIELDS(i).money );
                    
                    end
                    
              catch
                  
                  for i = 1:1:26
                        set( data_list_user(i) , 'Enable' , 'on' );
                  end
                  % setup the internet panel
                  INTERNET_PANEL = internet( 'shop_program'        , ...
                                             INTERNET_BUTTON_NAMES   ...
                                           );
              end     
                                   
              
elseif strcmp( action , char(SHORTCUT_1_BUTTON_NAMES(1,1)) )  % 'P&N 600mL bottle'
    
                  data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                  ARRAY_COUNT_SHORTCUT_1(1,1) = ARRAY_COUNT_SHORTCUT_1(1,1) + 1;

                  SUB_TOTAL = SUB_TOTAL + ARRAY_PRICE_SHORTCUT_1(1,1);
                  value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                  comment = num2str( value , '%3.2f');
                  comment = [ '$' , comment ];
                  % disply total amount in main panel
                  set( data_list_user(36) , 'String' , comment );
                  
                  
                  % Clear user display
                  % 16 display in total
                  for i = 1:1:16
                       %display to customer
                       set( data_list_user(38+i) , 'String' , '' );
                  end
                  
                  comment = num2str( ARRAY_PRICE_SHORTCUT_1(1,1) , '%3.2f');
                  comment = [ '' , num2str( ARRAY_COUNT_SHORTCUT_1(1,1) ) , ' * ' , '$' , comment , '   ' ,  char( ARRAY_NAME_SHORTCUT_1(1,1) ) , '' ];
                  set( data_list_user(39) , 'String' , comment );
              
                  
              catch
                  
                  % when error occurs
                  error('An error has occurred: coke_1250mL_button' );
              
              end
                   
              
elseif strcmp( action , char(SHORTCUT_1_BUTTON_NAMES(1,2)) )  %'H2Go water'
    
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                      ARRAY_COUNT_SHORTCUT_1(1,2) = ARRAY_COUNT_SHORTCUT_1(1,2) + 1;

                      SUB_TOTAL = SUB_TOTAL + ARRAY_PRICE_SHORTCUT_1(1,2);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
                      
                      % Clear user display
                      % 11 display in total
                      for i = 1:1:11
                            %display to customer
                            set( data_list_user(38+i) , 'String' , '' );
                      end
                  
                      comment = num2str( ARRAY_PRICE_SHORTCUT_1(1,2) , '%3.2f');
                      comment = [ '' , num2str( ARRAY_COUNT_SHORTCUT_1(1,2) ) , ' * ' , '$' , comment , '   ' ,  char( ARRAY_NAME_SHORTCUT_1(1,2) ) , '' ];
                      set( data_list_user(39) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred: coke_2L_button' );
              end
              
              
elseif strcmp( action , char(SHORTCUT_1_BUTTON_NAMES(1,3)) ) %'milk_1L_button'
    
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                      ARRAY_COUNT_SHORTCUT_1(1,3) = ARRAY_COUNT_SHORTCUT_1(1,3) + 1;

                      SUB_TOTAL = SUB_TOTAL + ARRAY_PRICE_SHORTCUT_1(1,3);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
                      
                      % Clear user display
                      % 16 display in total
                      for i = 1:1:16
                            %display to customer
                            set( data_list_user(38+i) , 'String' , '' );
                      end
                  
                      comment = num2str( ARRAY_PRICE_SHORTCUT_1(1,3) , '%3.2f');
                      comment = [ '' , num2str( ARRAY_COUNT_SHORTCUT_1(1,3) ) , ' * ' , '$' , comment , '   ' ,  char( ARRAY_NAME_SHORTCUT_1(1,3) ) , '' ];
                      set( data_list_user(39) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred: milk_1L_button' );
              end
              
              
elseif strcmp( action , char(SHORTCUT_1_BUTTON_NAMES(1,4)) ) %'milk_2L_button'
    
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
               
              try
                      ARRAY_COUNT_SHORTCUT_1(1,4) = ARRAY_COUNT_SHORTCUT_1(1,4) + 1;

                      SUB_TOTAL = SUB_TOTAL + ARRAY_PRICE_SHORTCUT_1(1,4);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
                      
                      % Clear user display
                      % 16 display in total
                      for i = 1:1:16
                            %display to customer
                            set( data_list_user(38+i) , 'String' , '' );
                      end
                  
                      comment = num2str( ARRAY_PRICE_SHORTCUT_1(1,4) , '%3.2f');
                      comment = [ '' , num2str( ARRAY_COUNT_SHORTCUT_1(1,4) ) , ' * ' , '$' , comment , '   ' ,  char( ARRAY_NAME_SHORTCUT_1(1,4) ) , '' ];
                      set( data_list_user(39) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred: milk_2L_button' );
                      
              end
                
                         
elseif strcmp( action , char(SHORTCUT_1_BUTTON_NAMES(1,5)) )  %'v_250mL_button'
    
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                  
                      ARRAY_COUNT_SHORTCUT_1(1,5) = ARRAY_COUNT_SHORTCUT_1(1,5) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + ARRAY_PRICE_SHORTCUT_1(1,5);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
                      
                      % Clear user display
                      % 16 display in total
                      for i = 1:1:16
                            %display to customer
                            set( data_list_user(38+i) , 'String' , '' );
                      end
                  
                      comment = num2str( ARRAY_PRICE_SHORTCUT_1(1,5) , '%3.2f');
                      comment = [ '' , num2str( ARRAY_COUNT_SHORTCUT_1(1,5) ) , ' * ' , '$' , comment , '   ' ,  char( ARRAY_NAME_SHORTCUT_1(1,5) ) , '' ];
                      set( data_list_user(39) , 'String' , comment );
              
              catch
                      % when error occurs
                      error('An error has occurred: v_250mL_button' );
                       
              end

                           
elseif strcmp( action , char(SHORTCUT_1_BUTTON_NAMES(1,6)) )  %'v_350mL_button'
    
                  data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                  ARRAY_COUNT_SHORTCUT_1(1,6) = ARRAY_COUNT_SHORTCUT_1(1,6) + 1;
                  
                  SUB_TOTAL = SUB_TOTAL + ARRAY_PRICE_SHORTCUT_1(1,6);
                  value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                  comment = num2str( value , '%3.2f');
                  comment = [ '$' , comment ];
                  set( data_list_user(36) , 'String' , comment );
                  
                  
                  % Clear user display
                  % 16 display in total
                  for i = 1:1:16
                       %display to customer
                       set( data_list_user(38+i) , 'String' , '' );
                  end
                  
                  comment = num2str( ARRAY_PRICE_SHORTCUT_1(1,6) , '%3.2f');
                  comment = [ '' , num2str( ARRAY_COUNT_SHORTCUT_1(1,6) ) , ' * ' , '$' , comment , '   ' ,  char( ARRAY_NAME_SHORTCUT_1(1,6) ) , '' ];
                  set( data_list_user(39) , 'String' , comment );
              
                  
              catch
                  % when error occurs
                  error('An error has occurred: v_350mL_button' );
                  
              end
                        
              
elseif strcmp( action , char(SHORTCUT_1_BUTTON_NAMES(1,7)) ) %'Street Ice Cream'
    
                  data_list_user = get( MAIN_PANELS , 'UserData' );               
                  for i = 1:1:26
                       set( data_list_user(i) , 'Enable' , 'off' );
                  end
              
                  % The street button is left enable
                  set( data_list_user(23) , 'Enable' , 'on' );
               
              try
                  
                  set( STREET_PANEL , 'Visible' , 'on' );
                  data_list_street = get( STREET_PANEL , 'UserData' );
                  set( data_list_street(18) , 'String' , '' );
                  
              catch
                  
                  for i = 1:1:26
                       set( data_list_user(i) , 'Enable' , 'on' );
                  end
              
                  % setup the cigarette panel
                  STREET_PANEL = general_figure( 'shop_program'        , ...
                                                 'Street''s Ice Cream' , ...
                                                 STREET_PANELS_NAME    , ...
                                                 STREET_BUTTON_NAMES     ...
                                               );
              end     
              
              
elseif strcmp( action , char(SHORTCUT_1_BUTTON_NAMES(1,8)) )  %'Additional buttons' 
    
                  data_list_user = get( MAIN_PANELS , 'UserData' );               
                  for i = 1:1:26
                       set( data_list_user(i) , 'Enable' , 'off' );
                  end
              
                  % The others button is left enable
                  set( data_list_user(24) , 'Enable' , 'on' );
               
              try
                  
                  set( EXTRAS_PANEL , 'Visible' , 'on' );
                  data_list_extras = get( EXTRAS_PANEL , 'UserData' );
                  set( data_list_extras(18) , 'String' , '' );
                  
              catch
                  
                  for i = 1:1:26
                       set( data_list_user(i) , 'Enable' , 'on' );
                  end
              
                  % setup the cigarette panel
                  CIGARETTE_PANEL = cigarette( 'shop_program'         , ...
                                               CIGARETTE_BUTTON_NAMES , ...
                                               CIGARETTE_PRICES         ...
                                             );
              end     
              
              
% case of new transaction                                                    
elseif strcmp( action , char(OTHER_BUTTON_NAMES(1,1)) ) 
    
              data_list_user = get( MAIN_PANELS , 'UserData' ); 
    
        try
              data_list_cust = get( CUSTOMER_VIEW , 'UserData' ); 
              data_list_internet = get( INTERNET_PANEL , 'UserData' );
                
              %reset scroll
              SCROLL_DIRECTION = 0;    
 
              BOOLEAN_CUST = 0;
              
              SUB_TOTAL = 0;
              TOTAL_AMOUNT = 0;
              INPUT_CASH = 0;
              SUB_INTERNET_TOTAL = 0;
              
              %reset the values
              ARRAY_COUNT_SHORTCUT_1 = zeros(1,6); 
              ARRAY_COUNT_SHORTCUT_2 = zeros(1,8);
              TICKET_QUANTITIES = zeros(1,19);
              CIGARETTE_QUANTITIES = zeros(1,24);
              STREET_QUANTITIES = zeros(1,16);
              EXTRAS_QUANTITIES = zeros(1,16);
              INTERNET_BOOLEAN_PAYMENT_ARRAY = zeros(1,NUMBER_OF_COMPUTERS);
              
              %----------------------------------------------
              % clear ARRAYLIST
              n = length( ARRAYLIST ); 
              for i = 1:1:n
                  ARRAYLIST(i).quantity = 0;
                  ARRAYLIST(i).money = '';
                  ARRAYLIST(i).name = '';
              end
              
              for i = 27:1:54
                  set( data_list_user(i) , 'String' , '' );
              end
              
              for i = 1:1:35
                  set( data_list_cust(i) , 'String' , '' );
              end
              
              % customer panel is made invisible
              set( CUSTOMER_VIEW , 'Visible' , 'off' );  
                 
        catch  
              % re-initialize setup customer view panel
              CUSTOMER_VIEW = customer_figure( SHOP_NAME );
        end       
              
% case of calculating total amount              
elseif strcmp( action , char(OTHER_BUTTON_NAMES(1,2)) ) 
              
                  data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                  
                  data_list_cust = get( CUSTOMER_VIEW , 'UserData' ); 
            
                  % customer panel is made visible
                  set( CUSTOMER_VIEW , 'Visible' , 'on' );  
                  
                  %The scroll mode is at initial state
                  SCROLL_DIRECTION = 0;

                  BOOLEAN_CUST = 0;
    
                  % text inputs
                  %---------------------------------------------
                  string_input_array = {};
                  % input text start at index 27
                  for i = 1:1:9   
                        string_input_array(1,i) = { get(data_list_user(i+26),'String') };
                  end
                  
                  % extract out the values
                  quantity_array = [];
                  values_array = [];
                  for i = 1:1:9
                      c = char( string_input_array(1,i) );
                      [ a , b ] = extract_quantity_and_price( c );
                      quantity_array = [ quantity_array , a ];
                      values_array = [ values_array , b ];
                  end
                  
                  % extract out the items name
                  item_name_array = {};
                  for i = 1:1:9
                      a = char( string_input_array(1,i) );
                      b = extract_string( a );
                      item_name_array(1,i) = {b};
                  end
                  %---------------------------------------------
                  
                  
                  
                  TOTAL_AMOUNT = sum(quantity_array.*values_array);
                  value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                  
                  comment = num2str( value , '%3.2f');
                  comment = [ '$' , comment ];
                  
                  % display result
                  set( data_list_user(36) , 'String' , comment );
                  set( data_list_cust(1) , 'String' , comment );
                  
                  
                  
                  % consider values in shortcut 2
                  for i = 1:1:8
                        ARRAYLIST(i).quantity = ARRAY_COUNT_SHORTCUT_2(1,i);
                        ARRAYLIST(i).money = num2str( ARRAY_PRICE_SHORTCUT_2(1,i) , '%3.2f' );
                        ARRAYLIST(i).name = char(ARRAY_NAME_SHORTCUT_2(1,i));
                  end
                  
                  % consider values in shortcut 1
                  % start at index 9
                  for i = 1:1:6
                        ARRAYLIST(8+i).quantity = ARRAY_COUNT_SHORTCUT_1(1,i);
                        ARRAYLIST(8+i).money = num2str( ARRAY_PRICE_SHORTCUT_1(1,i) , '%3.2f' );
                        ARRAYLIST(8+i).name = char(ARRAY_NAME_SHORTCUT_1(1,i));
                        
                  end
                  
                  % consider the text input
                  % start at index 15
                  for i = 1:1:9
                        ARRAYLIST(14+i).quantity = quantity_array(1,i);
                        ARRAYLIST(14+i).money = num2str( values_array(1,i) , '%3.2f' );
                        ARRAYLIST(14+i).name = char( item_name_array(1,i) );
                  end
                  
                  % consider values in Ticket panel
                  % start at index 24
                  for i = 1:1:19
                        ARRAYLIST(23+i).quantity = TICKET_QUANTITIES(1,i);
                        ARRAYLIST(23+i).money = num2str( TICKET_PRICES(1,i) , '%3.2f' );
                        ARRAYLIST(23+i).name = char(TICKET_BUTTON_NAMES(1,i));
                  end
                  
                  % consider values in Cigarette panel
                  % start at index 43
                  for i = 1:1:24
                        ARRAYLIST(42+i).quantity = CIGARETTE_QUANTITIES(1,i);
                        ARRAYLIST(42+i).money = num2str( CIGARETTE_PRICES(1,i) , '%3.2f' );
                        ARRAYLIST(42+i).name = char(CIGARETTE_BUTTON_NAMES(1,i));
                  end
                  
                
                  % consider values in Internet panel
                  % start at index 67
                  for i = 1:1:NUMBER_OF_COMPUTERS
                        
                         if INTERNET_BOOLEAN_PAYMENT_ARRAY(1,i) == 1
                             
                               ARRAYLIST(66+i).quantity = 1;
                               
                               a = INTERNET_END_TIME_ARRAY(1,i) - INTERNET_START_TIME_ARRAY(1,i);
                               b = 0;
                               if a <= MINIMUM_INTERNET_USAGE
                                    %two dollars 
                                    b = 2;
                               else
                                    b = roundby5cent( a*INTERNET_CHARGE_RATE );
                               end
                               
                               b = b - INTERNET_SAVE_PARAMETERS(i).deposit;
                               
                               ARRAYLIST(66+i).money = num2str( b , '%3.2f' );
                             
                               comment = time_difference_to_string( a );
                               ARRAYLIST(66+i).name = [ 'Computer Number' , ' ' , num2str(i) , ' >>>  ', ...
                                                        comment ...
                                                      ];
                                                    
                           else % the case where the 'end buttons' were not pressed
                             
                               ARRAYLIST(66+i).quantity = 0;
                               ARRAYLIST(66+i).money = '';
                               ARRAYLIST(66+i).name = '';
                             
                           end
                      
                  end
                  
                  
                  % consider values in Street Ice Cream panel
                  % start at index 73
                  for i = 1:1:16
                        ARRAYLIST(72+i).quantity = STREET_QUANTITIES(1,i);
                        ARRAYLIST(72+i).money = num2str( STREET_PRICES(1,i) , '%3.2f' );
                        ARRAYLIST(72+i).name = char(STREET_BUTTON_NAMES(1,i));
                  end
                  
                
                  % consider values in Extras panel
                  % start at index 89
                  for i = 1:1:16
                        ARRAYLIST(88+i).quantity = EXTRAS_QUANTITIES(1,i);
                        ARRAYLIST(88+i).money = num2str( EXTRAS_PRICES(1,i) , '%3.2f' );
                        ARRAYLIST(88+i).name = char(EXTRAS_BUTTON_NAMES(1,i));
                  end
                  
                  
                  % Clear user display
                  % 16 display in total
                  for i = 1:1:16
                       %display to customer
                       set( data_list_user(38+i) , 'String' , '' );
                  end
                  
                  
                  % Clear customer display
                  % 32 display in total
                  for i = 1:1:32
                       %display to customer
                       set( data_list_cust(3+i) , 'String' , '' );
                  end
                  
                  
                  % calculate the length of ARRAYLIST
                  n = length( ARRAYLIST ); 
                  
                  no_of_display = 16;
                  k = 1;
                  i = 1;
                  
                  % display to user
                  while i <= no_of_display && k <= n
                      
                      if ARRAYLIST(k).quantity>0 && i<no_of_display
                         comment = [ num2str( ARRAYLIST(k).quantity )  , ' * ' , '$' , ARRAYLIST(k).money , '   ' ,  ARRAYLIST(k).name ]; 
                         set( data_list_user(38+i) , 'String' , comment );  % start at index 37
                         i = i + 1;
                         k = k + 1;
                      
                      elseif i >= no_of_display
                           %p = n+1 - k;
                           %comment = '';
                           %for j = 1:1:p
                           %     if ARRAYLIST(j-1+k).quantity>0
                           %          comment = [ comment , num2str( ARRAYLIST(j-1+k).quantity ) , ' * ' , '$' , ARRAYLIST(j-1+k).money , ' ' ,  ARRAYLIST(j-1+k).name , ',   ' ];
                           %          
                           %     end
                           %end 
                           comment = '..................................';
                           % set the values to the output text_16 
                           set( data_list_user(54) , 'String' , comment );
                           k = k + 1;
                           
                           % done to exit loop
                           i = i + 1;
                      else
                           % go to the next item element
                           k = k + 1;
                      end
                      
                  end
                  
                  
                  no_of_display = 32;
                  k = 1;
                  i = 1;
                  % display to customer
                  while i <= no_of_display && k <= n
                      
                      if ARRAYLIST(k).quantity>0 && i<no_of_display
                         comment = [ num2str( ARRAYLIST(k).quantity )  , ' * ' , '$' , ARRAYLIST(k).money , '   ' ,  ARRAYLIST(k).name ]; 
                         set( data_list_cust(3+i) , 'String' , comment );  % start at index 4
                         i = i + 1;
                         k = k + 1;
                         
                      elseif i >= no_of_display
                           %p = n+1 - k;
                           %comment = '';
                           %for j = 1:1:p
                           %     if ARRAYLIST(j-1+k).quantity>0
                           %          comment = [ comment  ,  num2str( ARRAYLIST(j-1+k).quantity ) , ' * ' , '$' , ARRAYLIST(j-1+k).money , ' ' ,  ARRAYLIST(j-1+k).name , ',   ' ];
                           %     end
                           %end 
                          
                           % set the values to the output cust_display_32 
                           comment = '................................';
                           set( data_list_cust(3+i) , 'String' , comment );
                           
                           k = k + 1;
                           
                           % done to exit loop
                           i = i + 1;
                      else
                           % go to the next item element
                           k = k + 1;
                      end
                      
                  end
                 
                  
                  % if RECORD button is green commence recording
                  if isequal( RECORD_BOOLEAN , 1 ) & ~isequal( OUTPUT_DIRECTORY , 0 ) & value > 0
                            
                             % store the indice with a purchase 
                             items_index = [];
                                     
                             % examine purchased values
                             for i = 1:1:n
                                     c = ARRAYLIST(i).quantity;
                                     if  c >= 1
                                          items_index = [ items_index ; i];
                                     end
                             end  
                             
                             % record to file
                             if ~isempty( items_index ) 
                                 
                                     % the number different items purchased
                                     n = length( items_index );

                                     time_of_purchase = clock();
                                     c = time_of_purchase(1,4) + time_of_purchase(1,5)./100;
                                     time_of_purchase = num2str( c , '%2.2f' );

                                     % open write file
                                     file = [ OUTPUT_DIRECTORY , '\' , date() , '.txt' ];
                                     fid = fopen( file , 'a' );
                                     
                                     % write in data
                                     for i = 1:1:n 
                                              %              time    name    quantity    price     
                                              fprintf( fid , '%s  \t  %2.1f  \t  %s  \t  %6s\r\n' , ...
                                                       time_of_purchase , ...
                                                       ARRAYLIST( items_index(i,1) ).quantity , ...
                                                       ARRAYLIST( items_index(i,1) ).money ,...
                                                       ARRAYLIST( items_index(i,1) ).name  ...
                                                    );
                                     end
                                     fclose('all');
                                     
                             end
                  end
                  
                  
              catch
                  
                  % re-initialize setup customer view panel
                  CUSTOMER_VIEW = customer_figure( SHOP_NAME );
                  
              end
           
              
elseif strcmp( action , char(OTHER_BUTTON_NAMES(1,3)) )   % change button

                  data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                  
                  data_list_cust = get( CUSTOMER_VIEW , 'UserData' ); 
              
                  % customer panel is made visible
                  set( CUSTOMER_VIEW , 'Visible' , 'on' );  
               
                  %obtain input amount by customer
                  input_string = get( data_list_user(37) , 'String' );
                  input_string = extract_equation(input_string);
                  INPUT_CASH = str2num(input_string);
                  input_string = num2str( INPUT_CASH , '%3.2f');
                  input_string = [ '$' , input_string ];
                  % display input money by customer
                  set( data_list_cust(2) , 'String' , input_string );
                  
                  
                  % total cost
                  result = SUB_TOTAL + TOTAL_AMOUNT + SUB_INTERNET_TOTAL;
                  comment = num2str( result , '%3.2f');
                  total_amount = [ '$' , comment ];
                  % display total cost
                  set( data_list_user(36) , 'String' , total_amount );
                  set( data_list_cust(1) , 'String' , total_amount );
                  
                  
                  % change given to customer
                  result = INPUT_CASH - SUB_TOTAL - TOTAL_AMOUNT - SUB_INTERNET_TOTAL;
                  comment = num2str( result , '%3.2f');
                  total_change = [ '$' , comment ];
                  % display change
                  set( data_list_user(38) , 'String' , total_change );
                  set( data_list_cust(3) , 'String' , total_change );
          
              catch
                  
                  % re-initialize setup customer view panel
                  CUSTOMER_VIEW = customer_figure( SHOP_NAME );
                  
              end
              
%RECORD_BOOLEAN              
% The record button             
elseif strcmp( action , char(OTHER_BUTTON_NAMES(1,4)) )     
    
              window_panel = gcf();
              data_list_user = get( window_panel , 'UserData' ); 
              set( data_list_user , 'Enable' , 'off' );
              set( data_list_user(55) , 'Enable' , 'on' );
              
              try     
                             if isequal( OUTPUT_DIRECTORY , 0 )
                                   OUTPUT_DIRECTORY = uigetdir;
                                   
                                   % consider the case when user use 'cancel'
                                   if isequal( OUTPUT_DIRECTORY , 0 )
                                           RECORD_BOOLEAN = 0;
                                           set( data_list_user(4) , 'ForegroundColor' , [ 0 0 0 ] ); % set to black
                                   else
                                           RECORD_BOOLEAN = 1;
                                           set( data_list_user(4) , 'ForegroundColor' , [ 0.1 1  0.2 ] ); %set to green

                                             % insert a return character
                                             file = [ OUTPUT_DIRECTORY , '\' , date() , '.txt' ];
                                             fid = fopen( file , 'a' );
                                             fprintf( fid , '\r\n');
                                             fclose('all');
                                           
                                             n = length( ARRAYLIST );
                                             % store the indice with a purchase 
                                             items_index = [];

                                             % examine purchased values
                                             for i = 1:1:n
                                                     c = ARRAYLIST(i).quantity;
                                                     if  c >= 1
                                                          items_index = [ items_index ; i];
                                                     end
                                             end  

                                             % record to file
                                             if ~isempty( items_index ) 

                                                     % the number different items purchased
                                                     n = length( items_index );

                                                     time_of_purchase = clock();
                                                     c = time_of_purchase(1,4) + time_of_purchase(1,5)./100;
                                                     time_of_purchase = num2str( c , '%2.2f' );

                                                     file = [ OUTPUT_DIRECTORY , '\' , date() , '.txt' ];
                                                     fid = fopen( file , 'a' );

                                                     % write in data
                                                     for i = 1:1:n 
                                                              %              time    name    quantity    price     
                                                              fprintf( fid , '%s  \t  %2.1f  \t  %s  \t  %6s\r\n' , ...
                                                                       time_of_purchase , ...
                                                                       ARRAYLIST( items_index(i,1) ).quantity , ...
                                                                       ARRAYLIST( items_index(i,1) ).money ,...
                                                                       ARRAYLIST( items_index(i,1) ).name  ...
                                                                     );
                                                     end
                                                     fclose('all');

                                             end

                                   end
                                   
                             else   % directory has already been set
                                 
                                     if isequal( RECORD_BOOLEAN , 1 )
                                           RECORD_BOOLEAN = 0;
                                           set( data_list_user(4) , 'ForegroundColor' , [ 0 0 0 ] ); % set to black
                                     else   % turning recording on
                                           RECORD_BOOLEAN = 1; 
                                           
                                            % insert a return character
                                            file = [ OUTPUT_DIRECTORY , '\' , date() , '.txt' ];
                                            fid = fopen( file , 'a' );
                                            fprintf( fid , '\r\n');
                                            fclose('all');
                                            
                                            set( data_list_user(4) , 'ForegroundColor' , [ 0.1 1  0.2 ] ); %set to green
                                     end
                             end
                             
                             set( data_list_user , 'Enable' , 'on' ); 
               catch
                  set( data_list_user , 'Enable' , 'on' ); 
                  error('An error has occurred: record_button' );
              end

               
              
%print button              
elseif strcmp( action , char(OTHER_BUTTON_NAMES(1,5)) )     
              
              % set the format of the number 
              format short g;
    
              window_panel = gcf();
              data_list_user = get( window_panel , 'UserData' ); 
              set( data_list_user , 'Enable' , 'off' );
              set( data_list_user(55) , 'Enable' , 'on' );
              
              
               try
                  %At the first time, demand use to specify directory
                  if OUTPUT_DIRECTORY_PRINT == 0
                       OUTPUT_DIRECTORY_PRINT = uigetdir;
                  end  

                  TOTAL = SUB_TOTAL + TOTAL_AMOUNT + SUB_INTERNET_TOTAL;
                  if TOTAL > 0
                      
                        % compute invoice number
                        a = clock();      
                        a(1,6) = ceil( a(1,6) );
                        
                        a2 = a(1,2);
                        if a2 < 10
                            a2 = [ '0' , num2str(a(1,2)) ];
                        else
                            a2 = num2str(a(1,2));
                        end

                        a3 = a(1,3);
                        if a3 < 10
                            a3 = [ '0' , num2str(a(1,3)) ];
                        else
                            a3 = num2str(a(1,3));
                        end

                        a4 = a(1,4);
                        if a4 < 10
                            a4 = [ '0' , num2str(a(1,4)) ];
                        else
                            a4 = num2str(a(1,4));
                        end

                        a5 = a(1,5);
                        if a5 < 10
                            a5 = [ '0' , num2str(a(1,5)) ];
                        else
                            a5 = num2str(a(1,5));
                        end

                        a6 = a(1,6);
                        if a6 < 10
                            a6 = [ '0' , num2str(a(1,6)) ];
                        else
                            a6 = num2str(a(1,6));
                        end

                        
                        invoice_no = [ a4 , ...
                                       a5 , ...
                                       a6 , ...
                                       a3 , ...
                                       a2 , ...
                                       num2str( a(1,1) )  ...
                                     ];
                        mydir = [ OUTPUT_DIRECTORY_PRINT , '\' , invoice_no  , '.txt' ];
                        fid = fopen( mydir , 'a' );
                   
                        fprintf( fid , '\t  \t  %s  \r\n\r\n' , ...
                                 SHOP_NAME ...     
                               );
                        
 


                        fprintf( fid , '%s \t  %s%s \r\n%s  \r\n%s  \r\n', ...
                                 char(SHOP_ADDRESS(1,1)) , ...
                                 'ABN: ' , ...
                                 ABN_NUMBER , ... 
                                 char(SHOP_ADDRESS(1,2)) , ...
                                 char(SHOP_ADDRESS(1,3))  ...
                               );
                               
                         


                         fprintf( fid , '%s%s \t  %s%s \r\n %s \r\n', ...
                                  'Phone: ' , ...
                                  PHONE_NUMBER , ...
                                  'Invoice Number: ' , ...  
                                  invoice_no , ...
                                  '' ...
                                );
                         
                         % time of purchase       
                         time = time_to_string( a(4)+a(5)/60+a(6)/3600 );


                         today_date = date(); 
                         fprintf( fid , '%s%s \r\n%s%s \r\n% s \r\n \r\n', ...
                                  'Date: ' , ...
                                  today_date , ...
                                  'Time: ' , ...  
                                  time ,...
                                  '' ...
                                ); 
                                
                         fprintf( fid , '%s\t %s\t %s\t \r\n' , ...
                                  'Quantity' , ...
                                  'Price' , ...
                                  'Amount' ...
                                );
                         
                         %fprintf( fid , '%s\t %s\t %s\t %s\r\n' , ...
                         %         'Quantity' , ...
                         %         'Price' , ...
                         %         'Amount', ...
                         %         'Items' ...
                         %       );
                            
                        
                         n = length( ARRAYLIST );                        
                         % write in data
                         for i = 1:1:n 
                              c = ARRAYLIST(i).quantity;
                              if  c >= 1
                                  
                                   a = [ ARRAYLIST(i).money , '+0' ] ;
                                   a = str2num(a);
                                   b = ARRAYLIST(i).quantity;
                                   c = a*b;
                                   
                                   %             quantity   price    amount    
                                   fprintf(  fid , '%1.0f \t\t %s%s\t %s%3.2f\t %s\r\n' , ...
                                             ARRAYLIST(i).quantity , ...
                                             '$' , ...
                                             ARRAYLIST(i).money ,...
                                             '$' , ...
                                             c , ...
                                             ARRAYLIST(i).name ...
                                          );
                              end
                         end    
                         
                         
                        

                         fprintf( fid , '\r\n\r\n%s  \r\n\r\n' , ...
                                 '--------------------------------------------' ...     
                               );
                         
                         rounding = roundby5cent( TOTAL ) - TOTAL;
                         fprintf( fid , '\t %s  \t\t %s%4.2f  \r\n\r\n' , ...
                                  'Rounding: ' ,  ...
                                  '$' , ...
                                  rounding ...
                                );
                         
                         fprintf( fid , '\t %s  \t %s%4.2f  \r\n' , ...
                                  'Total Amount: ' ,  ...
                                  '$' , ...
                                  TOTAL ...
                                );
                            
                         fprintf( fid , '\t %s \t %s%4.2f  \r\n' , ...
                                  'Input Amount: ' ,  ...
                                  '$' , ...
                                  INPUT_CASH ...
                                );
                                
                        cash_change = INPUT_CASH - TOTAL;
                        fprintf( fid , '\t %s  \t\t %s%4.2f  \r\n\r\n\r\n' , ...
                                  'Change: ' ,  ...
                                  '$' , ...
                                  cash_change ...
                               );        
                                
                               
                         value = GST*TOTAL;
                         fprintf(  fid , '\t %s   \t %s%3.2f \r\n \r\n' , ...
                                   'Total Included GST:' ,  ...
                                   '$' , ...
                                   value ...
                                );        
                                
                         
                         fprintf( fid , '\r\n%s  \r\n' , ...
                                 '--------------------------------------------' ...     
                               );
                         
                              
                         fprintf( fid , '\r\n%s' , ...
                                 'TRADING HOURS'  ...     
                               );      
                           
                         fprintf( fid , '\r\n%s  \r\n%s  \r\n%s  \r\n\r\n\r\n' , ...
                                 char( TRADING_HOURS(1,1) ) ,   ...   
                                 char( TRADING_HOURS(1,2) ) ,   ...  
                                 char( TRADING_HOURS(1,3) )    ...  
                               );      
                           
                               
                         fprintf( fid , '\t  \t  %s  \r\n \t  \t  %s  \r\n \t  \t  %s  \r\n' , ...
                                 '*******THANK-YOU********' ...
                               ); 
                           
                         fclose('all');
                         
                  end
                  
                  set( data_list_user , 'Enable' , 'on' ); 
               catch
                   set( data_list_user , 'Enable' , 'on' ); 
                   error('An error has occurred: print_button' );
               end

              
%exit main program
elseif strcmp( action , char(OTHER_BUTTON_NAMES(1,6)) )
           close( gcf() );
           close all;
           close all hidden;
          

           
           
% Button to scroll up                                                    
elseif strcmp( action , char(OTHER_BUTTON_NAMES(1,7)) ) 
         
                  data_list_user = get( MAIN_PANELS , 'UserData' ); 
                  
           try
                  data_list_cust = get( CUSTOMER_VIEW , 'UserData' ); 
                  
                  
                  % calculate the length of ARRAYLIST
                  n = length( ARRAYLIST );
                  
                  SCROLL_DIRECTION = SCROLL_DIRECTION - 1;
                  
                  if SCROLL_DIRECTION < 0
                      SCROLL_DIRECTION = 0;
                  end
                  
                  
                  % Transverse through the list for user view
                  %-----------------------------------------------
                  
                  no_of_display = 16;
                  k = 1;
                  i = 1;
                  j = 1;
                  
                  % display to user
                  while k <= n && i <= no_of_display 
                      if ARRAYLIST(k).quantity>0 && i<no_of_display
                           %Used to produce the scrolling effect
                           if j > SCROLL_DIRECTION
                               comment = [ num2str( ARRAYLIST(k).quantity )  , ' * ' , '$' , ARRAYLIST(k).money , '   ' ,  ARRAYLIST(k).name ]; 
                               % start at index 39
                               set( data_list_user(38+i) , 'String' , comment ); 
                               %increment to next display
                               i = i + 1;
                           end
                           j = j+1;
                           %increment to next arraylist item
                           k = k + 1;
                      elseif i >= no_of_display
                           %p = n+1 - k;
                           %comment = '';
                           %for j = 1:1:p
                           %     if ARRAYLIST(j-1+k).quantity>0
                           %          comment = [ comment , num2str( ARRAYLIST(j-1+k).quantity ) , ' * ' , '$' , ARRAYLIST(j-1+k).money , ' ' ,  ARRAYLIST(j-1+k).name , ',   ' ];
                           %     end
                           %end 
                           % set the values to the output text_16 
                           comment = '..................................';
                           set( data_list_user(38+i) , 'String' , comment );
                           k = k + 1;
                           % Result in exit of the loop
                           i = i + 1;
                      else
                          % go to the next item element
                           k = k + 1;
                      end
                  end
                  %the value of i continue from previous computation
                  while i <= no_of_display
                        % start at index 39
                        set( data_list_user(38+i) , 'String' , '' );
                        %increment to next display
                        i = i + 1;
                  end
                  
                  
                  
                  
                  
                  % Transverse through the list for customer view
                  %-----------------------------------------------
                  
                  no_of_display = 32;
                  k = 1;
                  i = 1;
                  j = 1;
                  
                  % display to customer
                  while k <= n && i <= no_of_display 
                      if ARRAYLIST(k).quantity>0 && i<no_of_display
                           %Used to produce the scrolling effect
                           if j > SCROLL_DIRECTION
                               comment = [ num2str( ARRAYLIST(k).quantity )  , ' * ' , '$' , ARRAYLIST(k).money , '   ' ,  ARRAYLIST(k).name ]; 
                               % start at index 4
                               set( data_list_cust(3+i) , 'String' , comment ); 
                               %increment to next display
                               i = i + 1;
                           end
                           j = j+1;
                           %increment to next arraylist item
                           k = k + 1;
                      elseif i >= no_of_display
                           %p = n+1 - k;
                           %comment = '';
                           %for j = 1:1:p
                           %     if ARRAYLIST(j-1+k).quantity>0
                           %          comment = [ comment , num2str( ARRAYLIST(j-1+k).quantity ) , ' * ' , '$' , ARRAYLIST(j-1+k).money , ' ' ,  ARRAYLIST(j-1+k).name , ',   ' ];
                           %     end
                           %end 
                           % set the values to the output cust_display_32
                           comment = '................................';
                           set( data_list_cust(3+i) , 'String' , comment );
                           k = k + 1;
                           % Result in exit of the loop
                           i = i + 1;
                      else
                          % go to the next item element
                           k = k + 1;
                      end
                  end
                  %the value of i continue from previous computation
                  while i <= no_of_display
                        % start at index 4
                        set( data_list_cust(3+i) , 'String' , '' );
                        %increment to next display
                        i = i + 1;
                  end
                  
                  
           catch  
                  set( data_list_user , 'Enable' , 'on' ); 
                  
                  % re-initialize setup customer view panel
                  CUSTOMER_VIEW = customer_figure( SHOP_NAME );
           end
                  
              
           
% Button to scroll down                                                    
elseif strcmp( action , char(OTHER_BUTTON_NAMES(1,8)) ) 
                  
             
                  data_list_user = get( MAIN_PANELS , 'UserData' ); 
                  
           try
                  data_list_cust = get( CUSTOMER_VIEW , 'UserData' ); 
               
                  
                  % calculate the length of ARRAYLIST
                  n = length( ARRAYLIST );
                  no_of_display = 16;
                  
                  
                  if BOOLEAN_CUST == 0
                      SCROLL_DIRECTION = SCROLL_DIRECTION + 1;
                  end


                  if SCROLL_DIRECTION > n;
                      SCROLL_DIRECTION = n;
                  end
                  
                  
                  % Transverse through the list
                  %-----------------------------------------------
                  
                  
                  k = 1;
                  i = 1;
                  j = 1;
                  
                  % display to user
                  while k <= n && i <= no_of_display 
                      if ARRAYLIST(k).quantity>0 && i<no_of_display
                           %Used to produce the scrolling effect
                           if j > SCROLL_DIRECTION
                               comment = [ num2str( ARRAYLIST(k).quantity )  , ' * ' , '$' , ARRAYLIST(k).money , '   ' ,  ARRAYLIST(k).name ]; 
                               % start at index 39
                               set( data_list_user(38+i) , 'String' , comment ); 
                               %increment to next display
                               i = i + 1;
                           end
                           j = j+1;
                           %increment to next arraylist item
                           k = k + 1;
                      elseif i >= no_of_display
                           %p = n+1 - k;
                           %comment = '';
                           %for j = 1:1:p
                           %     if ARRAYLIST(j-1+k).quantity>0
                           %          comment = [ comment , num2str( ARRAYLIST(j-1+k).quantity ) , ' * ' , '$' , ARRAYLIST(j-1+k).money , ' ' ,  ARRAYLIST(j-1+k).name , ',   ' ];
                           %     end
                           %end 
                           % set the values to the output text_16 
                           comment = '..................................';
                           set( data_list_user(38+i) , 'String' , comment );
                           k = k + 1;
                           % Result in exit of the loop
                           i = i + 1;
                      else
                          % go to the next item element
                           k = k + 1;
                      end
                  end


                  % Used to limit the incrementation 
                  % of the SCROLL_DIRECTION
                  if i <= 1
                       BOOLEAN_CUST = 1;
                  else
                       BOOLEAN_CUST = 0;
                  end
                  

                  %the value of i continue from previous computation
                  while i <= no_of_display
                        % start at index 39
                        set( data_list_user(38+i) , 'String' , '' );    
                        %increment to next display
                        i = i + 1;
                  end
                  
                  
                  
                  
                  % Transverse through the list for customer view
                  %-----------------------------------------------
                  
                  no_of_display = 32;
                  k = 1;
                  i = 1;
                  j = 1;
                  
                  % display to customer
                  while k <= n && i <= no_of_display 
                      if ARRAYLIST(k).quantity>0 && i<no_of_display
                           %Used to produce the scrolling effect
                           if j > SCROLL_DIRECTION
                               comment = [ num2str( ARRAYLIST(k).quantity )  , ' * ' , '$' , ARRAYLIST(k).money , '   ' ,  ARRAYLIST(k).name ]; 
                               % start at index 4
                               set( data_list_cust(3+i) , 'String' , comment ); 
                               %increment to next display
                               i = i + 1;
                           end
                           j = j+1;
                           %increment to next arraylist item
                           k = k + 1;
                      elseif i >= no_of_display
                           %p = n+1 - k;
                           %comment = '';
                           %for j = 1:1:p
                           %     if ARRAYLIST(j-1+k).quantity>0
                           %          comment = [ comment , num2str( ARRAYLIST(j-1+k).quantity ) , ' * ' , '$' , ARRAYLIST(j-1+k).money , ' ' ,  ARRAYLIST(j-1+k).name , ',   ' ];
                           %     end
                           %end 
                           % set the values to the output cust_display_32
                           comment = '................................';
                           set( data_list_cust(3+i) , 'String' , comment );
                           k = k + 1;
                           % Result in exit of the loop
                           i = i + 1;
                      else
                          % go to the next item element
                           k = k + 1;
                      end
                  end
                  %the value of i continue from previous computation
                  while i <= no_of_display
                        % start at index 4
                        set( data_list_cust(3+i) , 'String' , '' );
                        %increment to next display
                        i = i + 1;
                  end

                  
           catch  
                  set( data_list_user , 'Enable' , 'on' ); 
                  
                  % re-initialize setup customer view panel
                  CUSTOMER_VIEW = customer_figure( SHOP_NAME );
           end
                  
        
        
% Reset A           
elseif strcmp( action , char(INTERNET_BUTTON_NAMES(1,1)) )  
              
        try   
              data_list_internet = get( INTERNET_PANEL , 'UserData' ); 
              
              %reset these variables
              INTERNET_SAVE_PARAMETERS(1).deposit = 0;
              INTERNET_START_TIME_ARRAY(1) = -1;
              INTERNET_END_TIME_ARRAY(1) = -1;
              INTERNET_BOOLEAN_PAYMENT_ARRAY(1) = 0;
              

              % start button is enabled
              set( data_list_internet(7) , 'Enable' , 'on' );
              
              % end button is disabled 
              set( data_list_internet(13) , 'Enable' , 'off' );

              number_of_text_field = 5;
              i = 0;
              while i < number_of_text_field

                     %---clear the text----
                     %start time
                     %end time
                     %elapsed time
                     %input value
                     %display money

                     set( data_list_internet(19+i*NUMBER_OF_COMPUTERS) , 'String' , '' );
                     i = i + 1;

              end

  
        catch
              error('An error has occurred: Reset A ' );
        end
       
              
% Start A          
elseif strcmp( action , char(INTERNET_BUTTON_NAMES(1,2)) )  
       
       try
              data_list_internet = get( INTERNET_PANEL , 'UserData' ); 
              
              time_in_array = clock();
              time = time_in_array(1,4) + time_in_array(1,5)/60 + time_in_array(1,6)/3600;
              
              INTERNET_START_TIME_ARRAY(1) = time;
              
              comment = time_to_string( time );
              
              %start time
              set( data_list_internet(19) , 'String' , comment );
                   
              %start button is switched off
              set( data_list_internet(7) , 'Enable' , 'off' );
              
              %end button
              set( data_list_internet(13) , 'Enable' , 'on' );
              
       catch  
              error('An error has occurred: Start A' );
       end    
       
       
              
% End A              
elseif strcmp( action , char(INTERNET_BUTTON_NAMES(1,3)) )  
     
       try
              data_list_internet = get( INTERNET_PANEL , 'UserData' ); 
              
                  % set the value to true
                  % to indicate the button was activated 
                  INTERNET_BOOLEAN_PAYMENT_ARRAY(1) = 1;

                  %Obtain the end time
                  time_in_array = clock();
                  time = time_in_array(1,4) + time_in_array(1,5)/60 + time_in_array(1,6)/3600;
                  INTERNET_END_TIME_ARRAY(1) = time;

                  %obtain the deposit amount
                  a =  get( data_list_internet(37) , 'String' );
                  b =  extract_equation(a);
                  input_value = str2num(b);

                  INTERNET_SAVE_PARAMETERS(1).deposit = input_value;
                  
                  %compute the elapsed time
                  time_elapsed = time - INTERNET_START_TIME_ARRAY(1);

                  %Compute the amount the customer will need to pay
                  money = 0;
                  if time_elapsed <= MINIMUM_INTERNET_USAGE
                         %two dollars
                         money = 2;
                  else
                         money = roundby5cent( time_elapsed*INTERNET_CHARGE_RATE );
                  end         

                  %For cases where the user deposit an initial amount
                  money = money - input_value;


                  %display the result
                  %----------------------------------------------------

                  %compute the current clock time
                  comment = time_to_string( time );
                  %end time
                  set( data_list_internet(25) , 'String' , comment );

                  %display the elapsed time
                  comment = time_difference_to_string( time_elapsed );
                  set( data_list_internet(31) , 'String' , comment );

                  %display to user what the customer needs to pay
                  money = num2str( money , '%2.2f');
                  comment = [ '$' , money ];
                  set( data_list_internet(43) , 'String' , comment );    
               
       
       catch  
              error('An error has occurred: End A ' );
       end    
              
       
% Reset B              
elseif strcmp( action , char(INTERNET_BUTTON_NAMES(1,4)) )  
            
        try
              data_list_internet = get( INTERNET_PANEL , 'UserData' ); 
              
              %reset these variables
              INTERNET_SAVE_PARAMETERS(2).deposit = 0;
              INTERNET_START_TIME_ARRAY(2) = -1;
              INTERNET_END_TIME_ARRAY(2) = -1;
              INTERNET_BOOLEAN_PAYMENT_ARRAY(2) = 0;
              

              % start button is enabled
              set( data_list_internet(8) , 'Enable' , 'on' );
              
              % end button is disabled 
              set( data_list_internet(14) , 'Enable' , 'off' );

              number_of_text_field = 5;
              i = 0;
              while i < number_of_text_field

                     %----clear the text------
                     %start time
                     %end time
                     %elapsed time
                     %input value
                     %display money

                     set( data_list_internet(20+i*NUMBER_OF_COMPUTERS) , 'String' , '' );
                     i = i + 1;

              end


        catch
              error('An error has occurred: Reset B ' );
        end    
    
% Start B           
elseif strcmp( action , char(INTERNET_BUTTON_NAMES(1,5)) )  
     
       try
              data_list_internet = get( INTERNET_PANEL , 'UserData' ); 
              
              time_in_array = clock();
              time = time_in_array(1,4) + time_in_array(1,5)/60 + time_in_array(1,6)/3600;
              
              INTERNET_START_TIME_ARRAY(2) = time;
              
              comment = time_to_string( time );
              %start time
              set( data_list_internet(20) , 'String' , comment );
                   
              %start button is disabled
              set( data_list_internet(8) , 'Enable' , 'off' );
              
              %end button
              set( data_list_internet(14) , 'Enable' , 'on' );
       catch  
              error('An error has occurred: Start A' );
       end    
          
          
% End B           
elseif strcmp( action , char(INTERNET_BUTTON_NAMES(1,6)) )  
      
       try
              data_list_internet = get( INTERNET_PANEL , 'UserData' ); 
                      
              % set the value to true
              % to indicate the button was activated 
              INTERNET_BOOLEAN_PAYMENT_ARRAY(2) = 1;
              
              %Obtain the end time
              time_in_array = clock();
              time = time_in_array(1,4) + time_in_array(1,5)/60 + time_in_array(1,6)/3600;
              INTERNET_END_TIME_ARRAY(2) = time;
              
              %obtain the deposit amount
              a =  get( data_list_internet(38) , 'String' );
              b = extract_equation(a);
              input_value = str2num(b);
              
              INTERNET_SAVE_PARAMETERS(2).deposit = input_value;
              
              %compute the elapsed time
              time_elapsed = time - INTERNET_START_TIME_ARRAY(2);
              
              %the amount the customer will need to pay
              money = 0;
              if time_elapsed <= MINIMUM_INTERNET_USAGE
                     %two dollars
                     money = 2;
              else
                     money = roundby5cent( time_elapsed*INTERNET_CHARGE_RATE );
              end         
                     
              %For cases where the user deposit an initial amount
              money = money - input_value;
              
              %display the result
              %----------------------------------------------------
              
              %display the end time
              comment = time_to_string( time );
              %end time
              set( data_list_internet(26) , 'String' , comment );
              
              %display the elapsed time
              comment = time_difference_to_string( time_elapsed );
              set( data_list_internet(32) , 'String' , comment );
              
              %display to user what the customer needs to pay
              money = num2str( money , '%2.2f');
              comment = [ '$' , money ];
              set( data_list_internet(44) , 'String' , comment );
              

       catch
              error('An error has occurred: Reset B ' );
       end    
       
       
% Reset C           
elseif strcmp( action , char(INTERNET_BUTTON_NAMES(1,7)) )  
     
       try
              data_list_internet = get( INTERNET_PANEL , 'UserData' ); 
              
              %reset these variables
              INTERNET_SAVE_PARAMETERS(3).deposit = 0;
              INTERNET_START_TIME_ARRAY(3) = -1;
              INTERNET_END_TIME_ARRAY(3) = -1;
              INTERNET_BOOLEAN_PAYMENT_ARRAY(3) = 0;
              

              % start button is enabled
              set( data_list_internet(9) , 'Enable' , 'on' );
              
              % end button is disabled 
              set( data_list_internet(15) , 'Enable' , 'off' );

              number_of_text_field = 5;
              i = 0;
              while i < number_of_text_field

                     %----clear the text------
                     %start time
                     %end time
                     %elapsed time
                     %input value
                     %display money

                     set( data_list_internet(21+i*NUMBER_OF_COMPUTERS) , 'String' , '' );
                     i = i + 1;

              end


       catch
              error('An error has occurred: Reset C ' );
       end    
       
    
% Start C           
elseif strcmp( action , char(INTERNET_BUTTON_NAMES(1,8)) )  
     
       try
              data_list_internet = get( INTERNET_PANEL , 'UserData' ); 
              
              time_in_array = clock();
              time = time_in_array(1,4) + time_in_array(1,5)/60 + time_in_array(1,6)/3600;
              
              INTERNET_START_TIME_ARRAY(3) = time;
              
              comment = time_to_string( time );
              %start time display text
              set( data_list_internet(21) , 'String' , comment );
                   
              %start button is disabled
              set( data_list_internet(9) , 'Enable' , 'off' );
              
              %end button
              set( data_list_internet(15) , 'Enable' , 'on' );  
       catch  
              error('An error has occurred: Start A' );
       end    
             
              
% End C              
elseif strcmp( action , char(INTERNET_BUTTON_NAMES(1,9)) )  
              
          
       try
              data_list_internet = get( INTERNET_PANEL , 'UserData' ); 
        
              % set the value to true
              % to indicate the button was activated 
              INTERNET_BOOLEAN_PAYMENT_ARRAY(3) = 1;
              
              %Obtain the end time
              time_in_array = clock();
              time = time_in_array(1,4) + time_in_array(1,5)/60 + time_in_array(1,6)/3600;
              INTERNET_END_TIME_ARRAY(3) = time;
              
              %obtain the deposit amount
              a =  get( data_list_internet(39) , 'String' );
              b =  extract_equation(a);
              input_value = str2num(b);
              
              INTERNET_SAVE_PARAMETERS(3).deposit = input_value;
              
              %compute the elapsed time
              time_elapsed = time - INTERNET_START_TIME_ARRAY(3);
              
              %the amount the customer will need to pay
              money = 0;
              if time_elapsed <= MINIMUM_INTERNET_USAGE
                     %two dollars
                     money = 2;
              else
                     money = roundby5cent( time_elapsed*INTERNET_CHARGE_RATE );
              end         
                     
              %For cases where the user deposit an initial amount
              money = money - input_value;
              
              %display the result
              %----------------------------------------------------
              
              %display the end time
              comment = time_to_string( time );
              %end time
              set( data_list_internet(27) , 'String' , comment );
              
              %display the elapsed time
              comment = time_difference_to_string( time_elapsed );
              set( data_list_internet(33) , 'String' , comment );
              
              %display to user what the customer needs to pay
              money = num2str( money , '%2.2f');
              comment = [ '$' , money ];
              set( data_list_internet(45) , 'String' , comment );
          
         
       catch  
              error('An error has occurred: End C' );
       end   
       
         
% Reset D              
elseif strcmp( action , char(INTERNET_BUTTON_NAMES(1,10)) )  
     
       try
              data_list_internet = get( INTERNET_PANEL , 'UserData' ); 
              
              %reset these variables
              INTERNET_SAVE_PARAMETERS(4).deposit = 0;
              INTERNET_START_TIME_ARRAY(4) = -1;
              INTERNET_END_TIME_ARRAY(4) = -1;
              INTERNET_BOOLEAN_PAYMENT_ARRAY(4) = 0;
              
              
              % start button is enabled
              set( data_list_internet(10) , 'Enable' , 'on' );
              
              % end button is disabled 
              set( data_list_internet(16) , 'Enable' , 'off' );

              number_of_text_field = 5;
              i = 0;
              while i < number_of_text_field

                     %----clear the text------
                     %start time
                     %end time
                     %elapsed time
                     %input value
                     %display money

                     set( data_list_internet(22+i*NUMBER_OF_COMPUTERS) , 'String' , '' );
                     i = i + 1;

              end

 
       catch
              error('An error has occurred: Reset D ' );
       end    
   
              
% Start D           
elseif strcmp( action , char(INTERNET_BUTTON_NAMES(1,11)) )  
      
       try
              data_list_internet = get( INTERNET_PANEL , 'UserData' ); 
              
              time_in_array = clock();
              time = time_in_array(1,4) + time_in_array(1,5)/60 + time_in_array(1,6)/3600;
              
              INTERNET_START_TIME_ARRAY(4) = time;
              
              comment = time_to_string( time );
              %start time display text
              set( data_list_internet(22) , 'String' , comment );
                   
              %start button is disabled
              set( data_list_internet(10) , 'Enable' , 'off' );

              %end button
              set( data_list_internet(16) , 'Enable' , 'on' );  
       catch  
              error('An error has occurred: Start A' );
       end
                  
              
% End D    
elseif strcmp( action , char(INTERNET_BUTTON_NAMES(1,12)) )  
     
       try
              data_list_internet = get( INTERNET_PANEL , 'UserData' ); 
              
              % set the value to true
              % to indicate the button was activated 
              INTERNET_BOOLEAN_PAYMENT_ARRAY(4) = 1;
              
              %Obtain the end time
              time_in_array = clock();
              time = time_in_array(1,4) + time_in_array(1,5)/60 + time_in_array(1,6)/3600;
              INTERNET_END_TIME_ARRAY(4) = time;
              
              %obtain the deposit amount
              a = get( data_list_internet(40) , 'String' );
              b = extract_equation(a);
              input_value = str2num(b);
              
              INTERNET_SAVE_PARAMETERS(4).deposit = input_value;
              
              
              %compute the elapsed time
              time_elapsed = time - INTERNET_START_TIME_ARRAY(1,4);
              
              %the amount the customer will need to pay
              money = 0;
              if time_elapsed <= MINIMUM_INTERNET_USAGE
                     %two dollars
                     money = 2;
              else
                     money = roundby5cent( time_elapsed*INTERNET_CHARGE_RATE );
              end         
                     
              %For cases where the user deposit an initial amount
              money = money - input_value;
              
              %display the result
              %----------------------------------------------------
              
              %display the end time
              comment = time_to_string( time );
              %end time
              set( data_list_internet(28) , 'String' , comment );
              
              %display the elapsed time
              comment = time_difference_to_string( time_elapsed );
              set( data_list_internet(34) , 'String' , comment );
              
              %display to user what the customer needs to pay
              money = num2str( money , '%2.2f');
              comment = [ '$' , money ];
              set( data_list_internet(46) , 'String' , comment );
       
       

       catch  
              error('An error has occurred: End D' );
       end    
      


% Reset E              
elseif strcmp( action , char(INTERNET_BUTTON_NAMES(1,13)) )  
     
       try
              data_list_internet = get( INTERNET_PANEL , 'UserData' ); 
              
              %reset these variables
              INTERNET_SAVE_PARAMETERS(5).deposit = 0;
              INTERNET_START_TIME_ARRAY(5) = -1;
              INTERNET_END_TIME_ARRAY(5) = -1;
              INTERNET_BOOLEAN_PAYMENT_ARRAY(5) = 0;
                            

              % start button is enabled
              set( data_list_internet(11) , 'Enable' , 'on' );
              
              % end button is disabled 
              set( data_list_internet(17) , 'Enable' , 'off' );

              number_of_text_field = 5;
              i = 0;
              while i < number_of_text_field

                     %----clear the text------
                     %start time
                     %end time
                     %elapsed time
                     %input value
                     %display money

                     set( data_list_internet(23+i*NUMBER_OF_COMPUTERS) , 'String' , '' );
                     i = i + 1;

              end

    
       catch
              error('An error has occurred: Reset D ' );
       end    
   
              
% Start E           
elseif strcmp( action , char(INTERNET_BUTTON_NAMES(1,14)) )  
      
       try
              data_list_internet = get( INTERNET_PANEL , 'UserData' ); 
              
              time_in_array = clock();
              time = time_in_array(1,4) + time_in_array(1,5)/60 + time_in_array(1,6)/3600;
              
              INTERNET_START_TIME_ARRAY(5) = time;
              
              comment = time_to_string( time );
              %start time display text
              set( data_list_internet(23) , 'String' , comment );
                   
              %start button is disabled
              set( data_list_internet(11) , 'Enable' , 'off' );

              %end button
              set( data_list_internet(17) , 'Enable' , 'on' );  
       catch  
              error('An error has occurred: Start A' );
       end
                  
              
% End E    
elseif strcmp( action , char(INTERNET_BUTTON_NAMES(1,15)) )  
     
       try
              data_list_internet = get( INTERNET_PANEL , 'UserData' ); 
              
              % set the value to true
              % to indicate the button was activated 
              INTERNET_BOOLEAN_PAYMENT_ARRAY(5) = 1;
              
              %Obtain the end time
              time_in_array = clock();
              time = time_in_array(1,4) + time_in_array(1,5)/60 + time_in_array(1,6)/3600;
              INTERNET_END_TIME_ARRAY(5) = time;
              
              %obtain the deposit amount
              a = get( data_list_internet(41) , 'String' );
              b = extract_equation(a);
              input_value = str2num(b);
              
              INTERNET_SAVE_PARAMETERS(4).deposit = input_value;
              
              
              %compute the elapsed time
              time_elapsed = time - INTERNET_START_TIME_ARRAY(1,5);
              
              %the amount the customer will need to pay
              money = 0;
              if time_elapsed <= MINIMUM_INTERNET_USAGE
                     %two dollars
                     money = 2;
              else
                     money = roundby5cent( time_elapsed*INTERNET_CHARGE_RATE );
              end         
                     
              %For cases where the user deposit an initial amount
              money = money - input_value;
              
              %display the result
              %----------------------------------------------------
              
              %display the end time
              comment = time_to_string( time );
              %end time
              set( data_list_internet(29) , 'String' , comment );
              
              %display the elapsed time
              comment = time_difference_to_string( time_elapsed );
              set( data_list_internet(35) , 'String' , comment );
              
              %display to user what the customer needs to pay
              money = num2str( money , '%2.2f');
              comment = [ '$' , money ];
              set( data_list_internet(47) , 'String' , comment );
       

       catch  
              error('An error has occurred: End D' );
       end    



% Reset F              
elseif strcmp( action , char(INTERNET_BUTTON_NAMES(1,16)) )  
     
       try
              data_list_internet = get( INTERNET_PANEL , 'UserData' ); 
              
              %reset these variables
              INTERNET_SAVE_PARAMETERS(6).deposit = 0;
              INTERNET_START_TIME_ARRAY(6) = -1;
              INTERNET_END_TIME_ARRAY(6) = -1;
              INTERNET_BOOLEAN_PAYMENT_ARRAY(6) = 0;
                             

              % start button is enabled
              set( data_list_internet(12) , 'Enable' , 'on' );
              
              % end button is disabled 
              set( data_list_internet(18) , 'Enable' , 'off' );

              number_of_text_field = 5;
              i = 0;
              while i < number_of_text_field

                     %----clear the text------
                     %start time
                     %end time
                     %elapsed time
                     %input value
                     %display money

                     set( data_list_internet(24+i*NUMBER_OF_COMPUTERS) , 'String' , '' );
                     i = i + 1;

              end

   
       catch
              error('An error has occurred: Reset D ' );
       end    
   
              
% Start F           
elseif strcmp( action , char(INTERNET_BUTTON_NAMES(1,17)) )  
      
       try
              data_list_internet = get( INTERNET_PANEL , 'UserData' ); 
              
              time_in_array = clock();
              time = time_in_array(1,4) + time_in_array(1,5)/60 + time_in_array(1,6)/3600;
              
              INTERNET_START_TIME_ARRAY(6) = time;
              
              comment = time_to_string( time );
              %start time display text
              set( data_list_internet(24) , 'String' , comment );
                   
              %start button is disabled
              set( data_list_internet(12) , 'Enable' , 'off' );

              %end button
              set( data_list_internet(18) , 'Enable' , 'on' );  
       catch  
              error('An error has occurred: Start A' );
       end
                  
              
% End F    
elseif strcmp( action , char(INTERNET_BUTTON_NAMES(1,18)) )  
     
       try
              data_list_internet = get( INTERNET_PANEL , 'UserData' ); 
              
              % set the value to true
              % to indicate the button was activated 
              INTERNET_BOOLEAN_PAYMENT_ARRAY(6) = 1;
              
              %Obtain the end time
              time_in_array = clock();
              time = time_in_array(1,4) + time_in_array(1,5)/60 + time_in_array(1,6)/3600;
              INTERNET_END_TIME_ARRAY(6) = time;
              
              %obtain the deposit amount
              a = get( data_list_internet(42) , 'String' );
              b = extract_equation(a);
              input_value = str2num(b);
              
              INTERNET_SAVE_PARAMETERS(4).deposit = input_value;
              
              
              %compute the elapsed time
              time_elapsed = time - INTERNET_START_TIME_ARRAY(1,6);
              
              %the amount the customer will need to pay
              money = 0;
              if time_elapsed <= MINIMUM_INTERNET_USAGE
                     %two dollars
                     money = 2;
              else
                     money = roundby5cent( time_elapsed*INTERNET_CHARGE_RATE );
              end         
                     
              %For cases where the user deposit an initial amount
              money = money - input_value;
              
              %display the result
              %----------------------------------------------------
              
              %display the end time
              comment = time_to_string( time );
              %end time
              set( data_list_internet(30) , 'String' , comment );
              
              %display the elapsed time
              comment = time_difference_to_string( time_elapsed );
              set( data_list_internet(36) , 'String' , comment );
              
              %display to user what the customer needs to pay
              money = num2str( money , '%2.2f');
              comment = [ '$' , money ];
              set( data_list_internet(48) , 'String' , comment );
       
       
       catch  
              error('An error has occurred: End D' );
       end    



%Undo button    
elseif strcmp( action , char(INTERNET_BUTTON_NAMES(1,19)) )  
              
              data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              %reset this variable
              INTERNET_BOOLEAN_PAYMENT_ARRAY = [ 0 , 0 , 0 , 0 , 0 , 0 ];
              
              try   
                    data_list_internet = get( INTERNET_PANEL , 'UserData' ); 
                    
                    % Load in the parameters of the panel  
                    for i = 1:1:NUMBER_OF_COMPUTERS
                            
                            %load in previous values
                            INTERNET_START_TIME_ARRAY(i) = INTERNET_SAVE_PARAMETERS(i).start_time;
                            INTERNET_END_TIME_ARRAY(i) = INTERNET_SAVE_PARAMETERS(i).end_time;
                            
                            
                            if INTERNET_START_TIME_ARRAY(1,i) < 0
                                   %start button is switched on
                                   set( data_list_internet(6+i) , 'Enable' , 'on' );
                                   
                                   %end button is switched off
                                   set( data_list_internet(12+i) , 'Enable' , 'off' );
                            end    
                            
                            %start time display
                            set( data_list_internet(18+i) , 'String' , INTERNET_SAVE_TEXT_FIELDS(i).start_time );
                            
                            %end time display
                            set( data_list_internet(24+i) , 'String' , INTERNET_SAVE_TEXT_FIELDS(i).end_time );
                            
                            %elapsed time display
                            set( data_list_internet(30+i) , 'String' , INTERNET_SAVE_TEXT_FIELDS(i).elapsed_time );
                            
                            %input value
                            set( data_list_internet(36+i) , 'String' , INTERNET_SAVE_TEXT_FIELDS(i).input );
                            
                            %money display
                            set( data_list_internet(42+i) , 'String' , INTERNET_SAVE_TEXT_FIELDS(i).money );
                            
                            
                            
                    end
                    
              catch
                  
                    for i = 1:1:26
                         set( data_list_user(i) , 'Enable' , 'on' );
                    end
                    
              end     
                                   
                  
                  
% The Ok button for the internet panel           
elseif strcmp( action , char(INTERNET_BUTTON_NAMES(1,20)) )  
                  
                  data_list_user = get( MAIN_PANELS , 'UserData' ); 
                  
              try 
                  % Internet panel is made invisible
                  set( INTERNET_PANEL , 'Visible' , 'off' );
                  
                  data_list_internet = get( INTERNET_PANEL , 'UserData' );
                  
                  a = 0;
                  b = 0;
                  SUB_INTERNET_TOTAL = 0;
                   
                  % save values used in internet panel
                  for i = 1:1:NUMBER_OF_COMPUTERS
                          
                         %save start time
                         INTERNET_SAVE_TEXT_FIELDS(i).start_time = get( data_list_internet(18+i) , 'String' );
                         
                         %save end time
                         INTERNET_SAVE_TEXT_FIELDS(i).end_time = get( data_list_internet(24+i) , 'String' );
                         
                         %save elapsed time
                         INTERNET_SAVE_TEXT_FIELDS(i).elapsed_time = get( data_list_internet(30+i) , 'String' );
                         
                         %save input text
                         INTERNET_SAVE_TEXT_FIELDS(i).input = get( data_list_internet(36+i) , 'String' );
                         
                         %save money display
                         INTERNET_SAVE_TEXT_FIELDS(i).money = get( data_list_internet(42+i) , 'String' );
                         
                         
                         % save numerical parameters to abstract 
                         INTERNET_SAVE_PARAMETERS(i).start_time = INTERNET_START_TIME_ARRAY(i);
                         INTERNET_SAVE_PARAMETERS(i).end_time = INTERNET_END_TIME_ARRAY(i);
                         
                         % use for computing the temporary sum to main panel
                         if INTERNET_BOOLEAN_PAYMENT_ARRAY(i) == 1
                             
                             %obtain the deposit amount
                             get_value = get( data_list_internet(36+i) , 'String' );
                             string = extract_equation(get_value);
                             input_value = str2num(string);
                             INTERNET_SAVE_PARAMETERS(i).deposit = input_value;
                             
                             a = INTERNET_END_TIME_ARRAY(i) - INTERNET_START_TIME_ARRAY(i);
                             if a <= MINIMUM_INTERNET_USAGE
                                 %two dollars
                                 b = 2;
                             else
                                 b = roundby5cent(a*INTERNET_CHARGE_RATE);
                             end
                             
                             SUB_INTERNET_TOTAL = SUB_INTERNET_TOTAL + b - input_value;
                         end
                         
                  end
                  
                  
                  % display temperorily result to user
                  value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                  comment = num2str( value , '%3.2f');
                  comment = [ '$' , comment ];
                  set( data_list_user(36) , 'String' , comment );
                  
                  for i = 1:1:26
                       set( data_list_user(i) , 'Enable' , 'on' );
                  end
                  
              catch
                  
                  for i = 1:1:26
                       set( data_list_user(i) , 'Enable' , 'on' );
                  end
                  
                  error('An error has occurred: Internet OK button' );
              
              end            
              

                  
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,1)) )  
     
                     
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
              
                      CIGARETTE_QUANTITIES(1,1) = CIGARETTE_QUANTITIES(1,1) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,1);
                      
                      comment = num2str( CIGARETTE_PRICES(1,1) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,1) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,1) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end      
              
    
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,2)) )  
      
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
              
                      CIGARETTE_QUANTITIES(1,2) = CIGARETTE_QUANTITIES(1,2) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,2);
                      
                      comment = num2str( CIGARETTE_PRICES(1,2) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,2) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,2) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end      
              
    
    
               
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,3)) )  
      
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
              
                      CIGARETTE_QUANTITIES(1,3) = CIGARETTE_QUANTITIES(1,3) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,3);
                      
                      comment = num2str( CIGARETTE_PRICES(1,3) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,3) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,3) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
              catch
                      % when error occurs
                      error('An error has occurred' );
              end      
              
             
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,4)) )  
      
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
              
                      CIGARETTE_QUANTITIES(1,4) = CIGARETTE_QUANTITIES(1,4) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,4);
                      
                      comment = num2str( CIGARETTE_PRICES(1,4) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,4) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,4) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end      
              
    
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,5)) )  
      
              
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' );
                      CIGARETTE_QUANTITIES(1,5) = CIGARETTE_QUANTITIES(1,5) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,5);
                      
                      comment = num2str( CIGARETTE_PRICES(1,5) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,5) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,5) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end              
              
              
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,6)) )  
     
    
              try
                  
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
              
                      CIGARETTE_QUANTITIES(1,6) = CIGARETTE_QUANTITIES(1,6) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,6);
                      
                      comment = num2str( CIGARETTE_PRICES(1,6) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,6) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,6) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,7)) )  
     
                     
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
              
                      CIGARETTE_QUANTITIES(1,7) = CIGARETTE_QUANTITIES(1,7) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,7);
                      
                      comment = num2str( CIGARETTE_PRICES(1,7) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,7) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,7) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,8)) )  
     
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
              
                      CIGARETTE_QUANTITIES(1,8) = CIGARETTE_QUANTITIES(1,8) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,8);
                      
                      comment = num2str( CIGARETTE_PRICES(1,8) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,8) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,8) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
    
   
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,9)) )  
     
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
              
                      CIGARETTE_QUANTITIES(1,9) = CIGARETTE_QUANTITIES(1,9) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,9);
                      
                      comment = num2str( CIGARETTE_PRICES(1,9) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,9) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,9) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,10)) )  
     
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
              
                      CIGARETTE_QUANTITIES(1,10) = CIGARETTE_QUANTITIES(1,10) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,10);
                      
                      comment = num2str( CIGARETTE_PRICES(1,10) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,10) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,10) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,11)) )  
     
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
              
                      CIGARETTE_QUANTITIES(1,11) = CIGARETTE_QUANTITIES(1,11) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,11);
                      
                      comment = num2str( CIGARETTE_PRICES(1,11) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,11) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,11) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,12)) )  
     
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
              
                      CIGARETTE_QUANTITIES(1,12) = CIGARETTE_QUANTITIES(1,12) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,12);
                      
                      comment = num2str( CIGARETTE_PRICES(1,12) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,12) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,12) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,13)) )  
     
                      
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
                  
                      CIGARETTE_QUANTITIES(1,13) = CIGARETTE_QUANTITIES(1,13) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,13);
                      
                      comment = num2str( CIGARETTE_PRICES(1,13) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,13) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,13) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
                                   
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,14)) )  
    
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
              
                      CIGARETTE_QUANTITIES(1,14) = CIGARETTE_QUANTITIES(1,14) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,14);
                      
                      comment = num2str( CIGARETTE_PRICES(1,14) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,14) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,14) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,15)) )  
     
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
              
                      CIGARETTE_QUANTITIES(1,15) = CIGARETTE_QUANTITIES(1,15) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,15);
                      
                      comment = num2str( CIGARETTE_PRICES(1,15) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,15) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,15) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,16)) )  
    
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
              
                      CIGARETTE_QUANTITIES(1,16) = CIGARETTE_QUANTITIES(1,16) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,16);
                      
                      comment = num2str( CIGARETTE_PRICES(1,16) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,16) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,16) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,17)) )  
     
    
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
           
                      CIGARETTE_QUANTITIES(1,17) = CIGARETTE_QUANTITIES(1,17) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,17);
                      
                      comment = num2str( CIGARETTE_PRICES(1,17) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,17) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,17) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,18)) )  
     
                      
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
              
                      CIGARETTE_QUANTITIES(1,18) = CIGARETTE_QUANTITIES(1,18) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,18);
                      
                      comment = num2str( CIGARETTE_PRICES(1,18) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,18) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,18) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
               
              
              
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,19)) )  
       
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
              
                      CIGARETTE_QUANTITIES(1,19) = CIGARETTE_QUANTITIES(1,19) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,19);
                      
                      comment = num2str( CIGARETTE_PRICES(1,19) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,19) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,19) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,20)) )  
     
           
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
              
                      CIGARETTE_QUANTITIES(1,20) = CIGARETTE_QUANTITIES(1,20) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,20);
                      
                      comment = num2str( CIGARETTE_PRICES(1,20) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,20) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,20) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
    
    
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,21)) )  
     
                      
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
              
                      CIGARETTE_QUANTITIES(1,21) = CIGARETTE_QUANTITIES(1,21) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,21);
                      
                      comment = num2str( CIGARETTE_PRICES(1,21) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,21) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,21) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
          
              
              
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,22)) )  
     
    
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
              
                      CIGARETTE_QUANTITIES(1,22) = CIGARETTE_QUANTITIES(1,22) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,22);
                      
                      comment = num2str( CIGARETTE_PRICES(1,22) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,22) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,22) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
               
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,23)) )  
     
          
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' ); 
              
                      CIGARETTE_QUANTITIES(1,23) = CIGARETTE_QUANTITIES(1,23) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,23);
                      
                      comment = num2str( CIGARETTE_PRICES(1,23) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,23) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,23) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,24)) )  
     
    
              try
                      data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' );
                      
                      CIGARETTE_QUANTITIES(1,24) = CIGARETTE_QUANTITIES(1,24) + 1;
                      SUB_TOTAL = SUB_TOTAL + CIGARETTE_PRICES(1,24);
                      
                      comment = num2str( CIGARETTE_PRICES(1,24) , '%3.2f');
                      comment = [ '' , num2str( CIGARETTE_QUANTITIES(1,24) ) , ' * ' , '$' , comment , '   ' ,  char( CIGARETTE_BUTTON_NAMES(1,24) ) , '' ];
                      set( data_list_cigarette(26) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
%Ok button for Cigarrette Button              
elseif strcmp( action , char(CIGARETTE_BUTTON_NAMES(1,25)) )  
                  
                  
                  data_list_user = get( MAIN_PANELS , 'UserData' ); 
                  
              try 
                  
                  value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                  comment = num2str( value , '%3.2f');
                  comment = [ '$' , comment ];
                  % display total amount
                  set( data_list_user(36) , 'String' , comment );
                  
                  data_list_cigarette = get( CIGARETTE_PANEL , 'UserData' );
                  set( data_list_cigarette(26) , 'String' , '' );
                  
                  % cigarette panel is made invisible
                  set( CIGARETTE_PANEL , 'Visible' , 'off' );
                  
                  set( data_list_user , 'Enable' , 'on' );
                  
              catch
                  set( data_list_user , 'Enable' , 'on' ); 
                  error('An error has occurred: Ticket_button' );
              end            
              

    
    
elseif strcmp( action , char(TICKET_BUTTON_NAMES(1,1)) )  
    
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                      TICKET_QUANTITIES(1,1) = TICKET_QUANTITIES(1,1) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + TICKET_PRICES(1,1);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      %display total amount
                      set( data_list_user(36) , 'String' , comment );
                      
              catch
                      % when error occurs
                      for i = 1:1:26
                           set( data_list_user(i) , 'Enable' , 'on' );
                      end
                      error('An error has occurred at ticket button 1' );
              end      
              
elseif strcmp( action , char(TICKET_BUTTON_NAMES(1,2)) )  
            
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                      TICKET_QUANTITIES(1,2) = TICKET_QUANTITIES(1,2) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + TICKET_PRICES(1,2);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      % display total amount
                      set( data_list_user(36) , 'String' , comment );
                      
              catch
                      % when error occurs
                      for i = 1:1:26
                           set( data_list_user(i) , 'Enable' , 'on' );
                      end
                      error('An error has occurred at ticket button 2' );
              end      
              
elseif strcmp( action , char(TICKET_BUTTON_NAMES(1,3)) )  
              
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                      TICKET_QUANTITIES(1,3) = TICKET_QUANTITIES(1,3) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + TICKET_PRICES(1,3);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
              catch
                      % when error occurs
                      for i = 1:1:26
                           set( data_list_user(i) , 'Enable' , 'on' );
                      end
                      error('An error has occurred at ticket button 3' );
              end      
              
elseif strcmp( action , char(TICKET_BUTTON_NAMES(1,4)) )  
              
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                      TICKET_QUANTITIES(1,4) = TICKET_QUANTITIES(1,4) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + TICKET_PRICES(1,4);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
              catch
                      % when error occurs
                      for i = 1:1:26
                           set( data_list_user(i) , 'Enable' , 'on' );
                      end
                      error('An error has occurred at ticket button 4' );
              end      
              
elseif strcmp( action , char(TICKET_BUTTON_NAMES(1,5)) )  
              
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                      TICKET_QUANTITIES(1,5) = TICKET_QUANTITIES(1,5) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + TICKET_PRICES(1,5);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
              catch
                      % when error occurs
                      for i = 1:1:26
                           set( data_list_user(i) , 'Enable' , 'on' );
                      end
                      error('An error has occurred ticket button 5' );
              end      
              
elseif strcmp( action , char(TICKET_BUTTON_NAMES(1,6)) )  
              
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
             
              try
                      TICKET_QUANTITIES(1,6) = TICKET_QUANTITIES(1,6) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + TICKET_PRICES(1,6);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
              catch
                      % when error occurs
                      for i = 1:1:26
                           set( data_list_user(i) , 'Enable' , 'on' );
                      end
                      error('An error has occurred at ticket button 6' );
              end      
               
              
elseif strcmp( action , char(TICKET_BUTTON_NAMES(1,7)) )  
              
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                      TICKET_QUANTITIES(1,7) = TICKET_QUANTITIES(1,7) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + TICKET_PRICES(1,7);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
              catch
                      % when error occurs
                      for i = 1:1:26
                           set( data_list_user(i) , 'Enable' , 'on' );
                      end
                      error('An error has occurred at ticket button 7' );
              end      
              
              
elseif strcmp( action , char(TICKET_BUTTON_NAMES(1,8)) )  
              
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                      TICKET_QUANTITIES(1,8) = TICKET_QUANTITIES(1,8) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + TICKET_PRICES(1,8);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
              catch
                      % when error occurs
                      for i = 1:1:26
                           set( data_list_user(i) , 'Enable' , 'on' );
                      end
                      error('An error has occurred at ticket button 8' );
              end      
              
elseif strcmp( action , char(TICKET_BUTTON_NAMES(1,9)) )  
              
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
             
              try
                      TICKET_QUANTITIES(1,9) = TICKET_QUANTITIES(1,9) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + TICKET_PRICES(1,9);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
              catch
                      % when error occurs
                      for i = 1:1:26
                           set( data_list_user(i) , 'Enable' , 'on' );
                      end
                      error('An error has occurred at ticket button 9' );
              end      
              
elseif strcmp( action , char(TICKET_BUTTON_NAMES(1,10)) )  
              
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
             
              try
                      TICKET_QUANTITIES(1,10) = TICKET_QUANTITIES(1,10) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + TICKET_PRICES(1,10);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
              catch
                      % when error occurs
                      for i = 1:1:26
                           set( data_list_user(i) , 'Enable' , 'on' );
                      end
                      error('An error has occurred at ticket button 10' );
              end      
              
elseif strcmp( action , char(TICKET_BUTTON_NAMES(1,11)) )  
              
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                      TICKET_QUANTITIES(1,11) = TICKET_QUANTITIES(1,11) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + TICKET_PRICES(1,11);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
              catch
                      % when error occurs
                      for i = 1:1:26
                           set( data_list_user(i) , 'Enable' , 'on' );
                      end
                      error('An error has occurred at ticket button 11' );
              end      
              
elseif strcmp( action , char(TICKET_BUTTON_NAMES(1,12)) )  
              
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                      TICKET_QUANTITIES(1,12) = TICKET_QUANTITIES(1,12) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + TICKET_PRICES(1,12);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
              catch
                      % when error occurs
                      for i = 1:1:26
                           set( data_list_user(i) , 'Enable' , 'on' );
                      end
                      error('An error has occurred at ticket button 12' );
              end      
              
elseif strcmp( action , char(TICKET_BUTTON_NAMES(1,13)) )  
              
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                      TICKET_QUANTITIES(1,13) = TICKET_QUANTITIES(1,13) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + TICKET_PRICES(1,13);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
              catch
                      % when error occurs
                      for i = 1:1:26
                           set( data_list_user(i) , 'Enable' , 'on' );
                      end
                      error('An error has occurred at ticket button 13' );
              end      
              
elseif strcmp( action , char(TICKET_BUTTON_NAMES(1,14)) )  
              
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                      TICKET_QUANTITIES(1,14) = TICKET_QUANTITIES(1,14) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + TICKET_PRICES(1,14);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
              catch
                      % when error occurs
                      for i = 1:1:26
                           set( data_list_user(i) , 'Enable' , 'on' );
                      end
                      error('An error has occurred at ticket button 14' );
              end      
              
elseif strcmp( action , char(TICKET_BUTTON_NAMES(1,15)) )  
              
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                      TICKET_QUANTITIES(1,15) = TICKET_QUANTITIES(1,15) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + TICKET_PRICES(1,15);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
              catch
                      % when error occurs
                      for i = 1:1:26
                           set( data_list_user(i) , 'Enable' , 'on' );
                      end
                      error('An error has occurred at ticket button 15' );
              end      
              
elseif strcmp( action , char(TICKET_BUTTON_NAMES(1,16)) )  
              
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                      TICKET_QUANTITIES(1,16) = TICKET_QUANTITIES(1,16) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + TICKET_PRICES(1,16);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
              catch
                      % when error occurs
                      for i = 1:1:26
                           set( data_list_user(i) , 'Enable' , 'on' );
                      end
                      error('An error has occurred at ticket button 16' );
              end      
                
              
elseif strcmp( action , char(TICKET_BUTTON_NAMES(1,17)) )  
              
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                      TICKET_QUANTITIES(1,17) = TICKET_QUANTITIES(1,17) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + TICKET_PRICES(1,17);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );
                      
              catch
                      % when error occurs
                      for i = 1:1:26
                           set( data_list_user(i) , 'Enable' , 'on' );
                      end
                      error('An error has occurred at ticket button 17' );
              end      
              
                            
elseif strcmp( action , char(TICKET_BUTTON_NAMES(1,18)) )  
              
                          
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
                   
              try
                      TICKET_QUANTITIES(1,18) = TICKET_QUANTITIES(1,18) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + TICKET_PRICES(1,18);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );

              catch
                       % when error occurs
                       for i = 1:1:26
                           set( data_list_user(i) , 'Enable' , 'on' );
                       end
                       
                       error('An error has occurred at ticket button 19' );
              end  
    

              
elseif strcmp( action , char(TICKET_BUTTON_NAMES(1,19)) )  
              
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
                   
              try
                      TICKET_QUANTITIES(1,19) = TICKET_QUANTITIES(1,19) + 1;
                      
                      SUB_TOTAL = SUB_TOTAL + TICKET_PRICES(1,19);
                      value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                      comment = num2str( value , '%3.2f');
                      comment = [ '$' , comment ];
                      set( data_list_user(36) , 'String' , comment );

              catch
                       % when error occurs
                       for i = 1:1:26
                           set( data_list_user(i) , 'Enable' , 'on' );
                       end
                       
                       error('An error has occurred at ticket button 19' );
              end  
    

              
% Use to exit the the ticket panel              
elseif strcmp( action , char(TICKET_BUTTON_NAMES(1,20)) )  
              
                  data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
              try
                  value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                  comment = num2str( value , '%3.2f');
                  comment = [ '$' , comment ];
                  set( data_list_user(36) , 'String' , comment );
                  
                  % ticket panel is made invisible
                  set( TICKET_PANEL , 'Visible' , 'off' );
                  
                  for i = 1:1:26
                       set( data_list_user(i) , 'Enable' , 'on' );
                  end
                  
              catch
                  
                  for i = 1:1:26
                       set( data_list_user(i) , 'Enable' , 'on' );
                  end
                  error('An error has occurred: Ticket_button' );
              end    
        
              

elseif strcmp( action , char(STREET_BUTTON_NAMES(1,1)) )  
     
          
                      data_list_user = get( MAIN_PANELS , 'UserData' ); 
                      data_list_street = get( STREET_PANEL , 'UserData' ); 
              
              try
                  
                      STREET_QUANTITIES(1,1) = STREET_QUANTITIES(1,1) + 1;
                      SUB_TOTAL = SUB_TOTAL + STREET_PRICES(1,1);
                      
                      comment = num2str( STREET_PRICES(1,1) , '%3.2f');
                      comment = [ '' , num2str( STREET_QUANTITIES(1,1) ) , ' * ' , '$' , comment , '   ' ,  char( STREET_BUTTON_NAMES(1,1) ) , '' ];
                      set( data_list_street(18) , 'String' , comment );
                      
              catch
                      % when error occurs
                      set( data_list_user , 'Enable' , 'on' ); 
                  
                      error('An error has occurred' );
              end      
              
    
elseif strcmp( action , char(STREET_BUTTON_NAMES(1,2)) )  
      
          
              try
                      data_list_street = get( STREET_PANEL , 'UserData' ); 
              
                      STREET_QUANTITIES(1,2) = STREET_QUANTITIES(1,2) + 1;
                      SUB_TOTAL = SUB_TOTAL + STREET_PRICES(1,2);
                      
                      comment = num2str( STREET_PRICES(1,2) , '%3.2f');
                      comment = [ '' , num2str( STREET_QUANTITIES(1,2) ) , ' * ' , '$' , comment , '   ' ,  char( STREET_BUTTON_NAMES(1,2) ) , '' ];
                      set( data_list_street(18) , 'String' , comment );
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end      
              
    
    
               
elseif strcmp( action , char(STREET_BUTTON_NAMES(1,3)) )  
      
              try
                      data_list_street = get( STREET_PANEL , 'UserData' ); 
              
                      STREET_QUANTITIES(1,3) = STREET_QUANTITIES(1,3) + 1;
                      SUB_TOTAL = SUB_TOTAL + STREET_PRICES(1,3);
                      
                      comment = num2str( STREET_PRICES(1,3) , '%3.2f');
                      comment = [ '' , num2str( STREET_QUANTITIES(1,3) ) , ' * ' , '$' , comment , '   ' ,  char( STREET_BUTTON_NAMES(1,3) ) , '' ];
                      set( data_list_street(18) , 'String' , comment );
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end      
              
             
elseif strcmp( action , char(STREET_BUTTON_NAMES(1,4)) )  
      
              try
                      data_list_street = get( STREET_PANEL , 'UserData' ); 
              
                      STREET_QUANTITIES(1,4) = STREET_QUANTITIES(1,4) + 1;
                      SUB_TOTAL = SUB_TOTAL + STREET_PRICES(1,4);
                      
                      comment = num2str( STREET_PRICES(1,4) , '%3.2f');
                      comment = [ '' , num2str( STREET_QUANTITIES(1,4) ) , ' * ' , '$' , comment , '   ' ,  char( STREET_BUTTON_NAMES(1,4) ) , '' ];
                      set( data_list_street(18) , 'String' , comment );
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end      
              
    
elseif strcmp( action , char(STREET_BUTTON_NAMES(1,5)) )  
     
              try
                      data_list_street = get( STREET_PANEL , 'UserData' ); 
              
                      STREET_QUANTITIES(1,5) = STREET_QUANTITIES(1,5) + 1;
                      SUB_TOTAL = SUB_TOTAL + STREET_PRICES(1,5);
                      
                      comment = num2str( STREET_PRICES(1,5) , '%3.2f');
                      comment = [ '' , num2str( STREET_QUANTITIES(1,5) ) , ' * ' , '$' , comment , '   ' ,  char( STREET_BUTTON_NAMES(1,5) ) , '' ];
                      set( data_list_street(18) , 'String' , comment );
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end              
elseif strcmp( action , char(STREET_BUTTON_NAMES(1,6)) )  
      
              try
                      data_list_street = get( STREET_PANEL , 'UserData' ); 
              
                      STREET_QUANTITIES(1,6) = STREET_QUANTITIES(1,6) + 1;
                      SUB_TOTAL = SUB_TOTAL + STREET_PRICES(1,6);
                      
                      comment = num2str( STREET_PRICES(1,6) , '%3.2f');
                      comment = [ '' , num2str( STREET_QUANTITIES(1,6) ) , ' * ' , '$' , comment , '   ' ,  char( STREET_BUTTON_NAMES(1,6) ) , '' ];
                      set( data_list_street(18) , 'String' , comment );
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
elseif strcmp( action , char(STREET_BUTTON_NAMES(1,7)) )  
     
              try
                      data_list_street = get( STREET_PANEL , 'UserData' ); 
              
                      STREET_QUANTITIES(1,7) = STREET_QUANTITIES(1,7) + 1;
                      SUB_TOTAL = SUB_TOTAL + STREET_PRICES(1,7);
                      
                      comment = num2str( STREET_PRICES(1,7) , '%3.2f');
                      comment = [ '' , num2str( STREET_QUANTITIES(1,7) ) , ' * ' , '$' , comment , '   ' ,  char( STREET_BUTTON_NAMES(1,7) ) , '' ];
                      set( data_list_street(18) , 'String' , comment );
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
elseif strcmp( action , char(STREET_BUTTON_NAMES(1,8)) )  
     
              try
                      data_list_street = get( STREET_PANEL , 'UserData' ); 
              
                      STREET_QUANTITIES(1,8) = STREET_QUANTITIES(1,8) + 1;
                      SUB_TOTAL = SUB_TOTAL + STREET_PRICES(1,8);
                      
                      comment = num2str( STREET_PRICES(1,8) , '%3.2f');
                      comment = [ '' , num2str( STREET_QUANTITIES(1,8) ) , ' * ' , '$' , comment , '   ' ,  char( STREET_BUTTON_NAMES(1,8) ) , '' ];
                      set( data_list_street(18) , 'String' , comment );
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
    
   
elseif strcmp( action , char(STREET_BUTTON_NAMES(1,9)) )  
     
              try
                      data_list_street = get( STREET_PANEL , 'UserData' ); 
              
                      STREET_QUANTITIES(1,9) = STREET_QUANTITIES(1,9) + 1;
                      SUB_TOTAL = SUB_TOTAL + STREET_PRICES(1,9);
                      
                      comment = num2str( STREET_PRICES(1,9) , '%3.2f');
                      comment = [ '' , num2str( STREET_QUANTITIES(1,9) ) , ' * ' , '$' , comment , '   ' ,  char( STREET_BUTTON_NAMES(1,9) ) , '' ];
                      set( data_list_street(18) , 'String' , comment );
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(STREET_BUTTON_NAMES(1,10)) )  
     
              try
                      data_list_street = get( STREET_PANEL , 'UserData' ); 
              
                      STREET_QUANTITIES(1,10) = STREET_QUANTITIES(1,10) + 1;
                      SUB_TOTAL = SUB_TOTAL + STREET_PRICES(1,10);
                      
                      comment = num2str( STREET_PRICES(1,10) , '%3.2f');
                      comment = [ '' , num2str( STREET_QUANTITIES(1,10) ) , ' * ' , '$' , comment , '   ' ,  char( STREET_BUTTON_NAMES(1,10) ) , '' ];
                      set( data_list_street(18) , 'String' , comment );
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
elseif strcmp( action , char(STREET_BUTTON_NAMES(1,11)) )  
      
              
              try
                      data_list_street = get( STREET_PANEL , 'UserData' );
                  
                      STREET_QUANTITIES(1,11) = STREET_QUANTITIES(1,11) + 1;
                      SUB_TOTAL = SUB_TOTAL + STREET_PRICES(1,11);
                      
                      comment = num2str( STREET_PRICES(1,11) , '%3.2f');
                      comment = [ '' , num2str( STREET_QUANTITIES(1,11) ) , ' * ' , '$' , comment , '   ' ,  char( STREET_BUTTON_NAMES(1,11) ) , '' ];
                      set( data_list_street(18) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(STREET_BUTTON_NAMES(1,12)) )  
     
              try
                      data_list_street = get( STREET_PANEL , 'UserData' ); 
              
                      STREET_QUANTITIES(1,12) = STREET_QUANTITIES(1,12) + 1;
                      SUB_TOTAL = SUB_TOTAL + STREET_PRICES(1,12);
                      
                      comment = num2str( STREET_PRICES(1,12) , '%3.2f');
                      comment = [ '' , num2str( STREET_QUANTITIES(1,12) ) , ' * ' , '$' , comment , '   ' ,  char( STREET_BUTTON_NAMES(1,12) ) , '' ];
                      set( data_list_street(18) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(STREET_BUTTON_NAMES(1,13)) )  
     
              try
                      data_list_street = get( STREET_PANEL , 'UserData' ); 
              
                      STREET_QUANTITIES(1,13) = STREET_QUANTITIES(1,13) + 1;
                      SUB_TOTAL = SUB_TOTAL + STREET_PRICES(1,13);
                      
                      comment = num2str( STREET_PRICES(1,13) , '%3.2f');
                      comment = [ '' , num2str( STREET_QUANTITIES(1,13) ) , ' * ' , '$' , comment , '   ' ,  char( STREET_BUTTON_NAMES(1,13) ) , '' ];
                      set( data_list_street(18) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(STREET_BUTTON_NAMES(1,14)) )  
     
              try
                      data_list_street = get( STREET_PANEL , 'UserData' ); 
              
                      STREET_QUANTITIES(1,14) = STREET_QUANTITIES(1,14) + 1;
                      SUB_TOTAL = SUB_TOTAL + STREET_PRICES(1,14);
                      
                      comment = num2str( STREET_PRICES(1,14) , '%3.2f');
                      comment = [ '' , num2str( STREET_QUANTITIES(1,14) ) , ' * ' , '$' , comment , '   ' ,  char( STREET_BUTTON_NAMES(1,14) ) , '' ];
                      set( data_list_street(18) , 'String' , comment );
              
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(STREET_BUTTON_NAMES(1,15)) )  
          
              try
                      data_list_street = get( STREET_PANEL , 'UserData' ); 
         
                      STREET_QUANTITIES(1,15) = STREET_QUANTITIES(1,15) + 1;
                      SUB_TOTAL = SUB_TOTAL + STREET_PRICES(1,15);
                      
                      comment = num2str( STREET_PRICES(1,15) , '%3.2f');
                      comment = [ '' , num2str( STREET_QUANTITIES(1,15) ) , ' * ' , '$' , comment , '   ' ,  char( STREET_BUTTON_NAMES(1,15) ) , '' ];
                      set( data_list_street(18) , 'String' , comment );
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(STREET_BUTTON_NAMES(1,16)) )  
     
              try
                      data_list_street = get( STREET_PANEL , 'UserData' ); 
              
                      STREET_QUANTITIES(1,16) = STREET_QUANTITIES(1,16) + 1;
                      SUB_TOTAL = SUB_TOTAL + STREET_PRICES(1,16);
                      
                      comment = num2str( STREET_PRICES(1,16) , '%3.2f');
                      comment = [ '' , num2str( STREET_QUANTITIES(1,16) ) , ' * ' , '$' , comment , '   ' ,  char( STREET_BUTTON_NAMES(1,16) ) , '' ];
                      set( data_list_street(18) , 'String' , comment );
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              

%street Ok button              
elseif strcmp( action , char(STREET_BUTTON_NAMES(1,17)) )  
     
              try 
                  
                  data_list_user = get( MAIN_PANELS , 'UserData' ); 
              
                  value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                  comment = num2str( value , '%3.2f');
                  comment = [ '$' , comment ];
                  set( data_list_user(36) , 'String' , comment );
                  data_list_street = get( STREET_PANEL , 'UserData' );
                  set( data_list_street(18) , 'String' , '' );
                  
                  % street panel is made invisible
                  set( STREET_PANEL , 'Visible' , 'off' );

                  for i = 1:1:26
                       set( data_list_user(i) , 'Enable' , 'on' );
                  end
                  
              catch

                  for i = 1:1:26
                       set( data_list_user(i) , 'Enable' , 'on' );
                  end

                  error('An error has occurred: Street Ok button' );
              end            
              
    
elseif strcmp( action , char(EXTRAS_BUTTON_NAMES(1,1)) )  
     
         
              try
                      data_list_extras = get( EXTRAS_PANEL , 'UserData' ); 
              
                      EXTRAS_QUANTITIES(1,1) = EXTRAS_QUANTITIES(1,1) + 1;
                      SUB_TOTAL = SUB_TOTAL + EXTRAS_PRICES(1,1);
                      
                      comment = num2str( EXTRAS_PRICES(1,1) , '%3.2f');
                      comment = [ '' , num2str( EXTRAS_QUANTITIES(1,1) ) , ' * ' , '$' , comment , '   ' ,  char( EXTRAS_BUTTON_NAMES(1,1) ) , '' ];
                      set( data_list_extras(18) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end      
              
    
elseif strcmp( action , char(EXTRAS_BUTTON_NAMES(1,2)) )  
      
          
              try
                      data_list_extras = get( EXTRAS_PANEL , 'UserData' ); 
                      
                      EXTRAS_QUANTITIES(1,2) = EXTRAS_QUANTITIES(1,2) + 1;
                      SUB_TOTAL = SUB_TOTAL + EXTRAS_PRICES(1,2);
                      
                      comment = num2str( EXTRAS_PRICES(1,2) , '%3.2f');
                      comment = [ '' , num2str( EXTRAS_QUANTITIES(1,2) ) , ' * ' , '$' , comment , '   ' ,  char( EXTRAS_BUTTON_NAMES(1,2) ) , '' ];
                      set( data_list_extras(18) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end      
              
    
    
               
elseif strcmp( action , char(EXTRAS_BUTTON_NAMES(1,3)) )  
      
              try
                      data_list_extras = get( EXTRAS_PANEL , 'UserData' ); 
                      
                      EXTRAS_QUANTITIES(1,3) = EXTRAS_QUANTITIES(1,3) + 1;
                      SUB_TOTAL = SUB_TOTAL + EXTRAS_PRICES(1,3);
                      
                      comment = num2str( EXTRAS_PRICES(1,3) , '%3.2f');
                      comment = [ '' , num2str( EXTRAS_QUANTITIES(1,3) ) , ' * ' , '$' , comment , '   ' ,  char( EXTRAS_BUTTON_NAMES(1,3) ) , '' ];
                      set( data_list_extras(18) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end      
              
             
elseif strcmp( action , char(EXTRAS_BUTTON_NAMES(1,4)) )  
      
              try
                      data_list_extras = get( EXTRAS_PANEL , 'UserData' ); 
              
                      EXTRAS_QUANTITIES(1,4) = EXTRAS_QUANTITIES(1,4) + 1;
                      SUB_TOTAL = SUB_TOTAL + EXTRAS_PRICES(1,4);
                      
                      comment = num2str( EXTRAS_PRICES(1,4) , '%3.2f');
                      comment = [ '' , num2str( EXTRAS_QUANTITIES(1,4) ) , ' * ' , '$' , comment , '   ' ,  char( EXTRAS_BUTTON_NAMES(1,4) ) , '' ];
                      set( data_list_extras(18) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end      
              
    
elseif strcmp( action , char(EXTRAS_BUTTON_NAMES(1,5)) )  
             
              try
                      data_list_extras = get( EXTRAS_PANEL , 'UserData' ); 
      
                      EXTRAS_QUANTITIES(1,5) = EXTRAS_QUANTITIES(1,5) + 1;
                      SUB_TOTAL = SUB_TOTAL + EXTRAS_PRICES(1,5);
                      
                      comment = num2str( EXTRAS_PRICES(1,5) , '%3.2f');
                      comment = [ '' , num2str( EXTRAS_QUANTITIES(1,5) ) , ' * ' , '$' , comment , '   ' ,  char( EXTRAS_BUTTON_NAMES(1,5) ) , '' ];
                      set( data_list_extras(18) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end              
elseif strcmp( action , char(EXTRAS_BUTTON_NAMES(1,6)) )  
     
                       
              try
                      data_list_extras = get( EXTRAS_PANEL , 'UserData' ); 
              
                      EXTRAS_QUANTITIES(1,6) = EXTRAS_QUANTITIES(1,6) + 1;
                      SUB_TOTAL = SUB_TOTAL + EXTRAS_PRICES(1,6);
                      
                      comment = num2str( EXTRAS_PRICES(1,6) , '%3.2f');
                      comment = [ '' , num2str( EXTRAS_QUANTITIES(1,6) ) , ' * ' , '$' , comment , '   ' ,  char( EXTRAS_BUTTON_NAMES(1,6) ) , '' ];
                      set( data_list_extras(18) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
elseif strcmp( action , char(EXTRAS_BUTTON_NAMES(1,7)) )  
     
                      
              try
                      data_list_extras = get( EXTRAS_PANEL , 'UserData' ); 
              
                      EXTRAS_QUANTITIES(1,7) = EXTRAS_QUANTITIES(1,7) + 1;
                      SUB_TOTAL = SUB_TOTAL + EXTRAS_PRICES(1,7);
                      
                      comment = num2str( EXTRAS_PRICES(1,7) , '%3.2f');
                      comment = [ '' , num2str( EXTRAS_QUANTITIES(1,7) ) , ' * ' , '$' , comment , '   ' ,  char( EXTRAS_BUTTON_NAMES(1,7) ) , '' ];
                      set( data_list_extras(18) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
elseif strcmp( action , char(EXTRAS_BUTTON_NAMES(1,8)) )  
     
                      
              try
                      data_list_extras = get( EXTRAS_PANEL , 'UserData' ); 
              
                      EXTRAS_QUANTITIES(1,8) = EXTRAS_QUANTITIES(1,8) + 1;
                      SUB_TOTAL = SUB_TOTAL + EXTRAS_PRICES(1,8);
                      
                      comment = num2str( EXTRAS_PRICES(1,8) , '%3.2f');
                      comment = [ '' , num2str( EXTRAS_QUANTITIES(1,8) ) , ' * ' , '$' , comment , '   ' ,  char( EXTRAS_BUTTON_NAMES(1,8) ) , '' ];
                      set( data_list_extras(18) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
    
   
elseif strcmp( action , char(EXTRAS_BUTTON_NAMES(1,9)) )  
     
              try
                      data_list_extras = get( EXTRAS_PANEL , 'UserData' ); 
              
                      EXTRAS_QUANTITIES(1,9) = EXTRAS_QUANTITIES(1,9) + 1;
                      SUB_TOTAL = SUB_TOTAL + EXTRAS_PRICES(1,9);
                      
                      comment = num2str( EXTRAS_PRICES(1,9) , '%3.2f');
                      comment = [ '' , num2str( EXTRAS_QUANTITIES(1,9) ) , ' * ' , '$' , comment , '   ' ,  char( EXTRAS_BUTTON_NAMES(1,9) ) , '' ];
                      set( data_list_extras(18) , 'String' , comment );
              
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(EXTRAS_BUTTON_NAMES(1,10)) )  
     
              try
                  
                      data_list_extras = get( EXTRAS_PANEL , 'UserData' ); 
              
                      EXTRAS_QUANTITIES(1,10) = EXTRAS_QUANTITIES(1,10) + 1;
                      SUB_TOTAL = SUB_TOTAL + EXTRAS_PRICES(1,10);
                      
                      comment = num2str( EXTRAS_PRICES(1,10) , '%3.2f');
                      comment = [ '' , num2str( EXTRAS_QUANTITIES(1,10) ) , ' * ' , '$' , comment , '   ' ,  char( EXTRAS_BUTTON_NAMES(1,10) ) , '' ];
                      set( data_list_extras(18) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
elseif strcmp( action , char(EXTRAS_BUTTON_NAMES(1,11)) )  
             
              try
                      data_list_extras = get( EXTRAS_PANEL , 'UserData' ); 
      
                      EXTRAS_QUANTITIES(1,11) = EXTRAS_QUANTITIES(1,11) + 1;
                      SUB_TOTAL = SUB_TOTAL + EXTRAS_PRICES(1,11);
                      
                      comment = num2str( EXTRAS_PRICES(1,11) , '%3.2f');
                      comment = [ '' , num2str( EXTRAS_QUANTITIES(1,11) ) , ' * ' , '$' , comment , '   ' ,  char( EXTRAS_BUTTON_NAMES(1,11) ) , '' ];
                      set( data_list_extras(18) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(EXTRAS_BUTTON_NAMES(1,12)) )  
     
                      
              try
                      data_list_extras = get( EXTRAS_PANEL , 'UserData' ); 
              
                      EXTRAS_QUANTITIES(1,12) = EXTRAS_QUANTITIES(1,12) + 1;
                      SUB_TOTAL = SUB_TOTAL + EXTRAS_PRICES(1,12);
                      
                      comment = num2str( EXTRAS_PRICES(1,12) , '%3.2f');
                      comment = [ '' , num2str( EXTRAS_QUANTITIES(1,12) ) , ' * ' , '$' , comment , '   ' ,  char( EXTRAS_BUTTON_NAMES(1,12) ) , '' ];
                      set( data_list_extras(18) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(EXTRAS_BUTTON_NAMES(1,13)) )  
     
              try
                      data_list_extras = get( EXTRAS_PANEL , 'UserData' ); 
              
                      EXTRAS_QUANTITIES(1,13) = EXTRAS_QUANTITIES(1,13) + 1;
                      SUB_TOTAL = SUB_TOTAL + EXTRAS_PRICES(1,13);
                      
                      comment = num2str( EXTRAS_PRICES(1,13) , '%3.2f');
                      comment = [ '' , num2str( EXTRAS_QUANTITIES(1,13) ) , ' * ' , '$' , comment , '   ' ,  char( EXTRAS_BUTTON_NAMES(1,13) ) , '' ];
                      set( data_list_extras(18) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(EXTRAS_BUTTON_NAMES(1,14)) )  
     
    
              try
                      data_list_extras = get( EXTRAS_PANEL , 'UserData' ); 
              
                      EXTRAS_QUANTITIES(1,14) = EXTRAS_QUANTITIES(1,14) + 1;
                      SUB_TOTAL = SUB_TOTAL + EXTRAS_PRICES(1,14);
                      
                      comment = num2str( EXTRAS_PRICES(1,14) , '%3.2f');
                      comment = [ '' , num2str( EXTRAS_QUANTITIES(1,14) ) , ' * ' , '$' , comment , '   ' ,  char( EXTRAS_BUTTON_NAMES(1,14) ) , '' ];
                      set( data_list_extras(18) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(EXTRAS_BUTTON_NAMES(1,15)) )  
     
              try
                  
                      data_list_extras = get( EXTRAS_PANEL , 'UserData' ); 
              
                      EXTRAS_QUANTITIES(1,15) = EXTRAS_QUANTITIES(1,15) + 1;
                      SUB_TOTAL = SUB_TOTAL + EXTRAS_PRICES(1,15);
                      
                      comment = num2str( EXTRAS_PRICES(1,15) , '%3.2f');
                      comment = [ '' , num2str( EXTRAS_QUANTITIES(1,15) ) , ' * ' , '$' , comment , '   ' ,  char( EXTRAS_BUTTON_NAMES(1,15) ) , '' ];
                      set( data_list_extras(18) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              
              
              
elseif strcmp( action , char(EXTRAS_BUTTON_NAMES(1,16)) )  
    
              try
                      data_list_extras = get( EXTRAS_PANEL , 'UserData' ); 
              
                      EXTRAS_QUANTITIES(1,16) = EXTRAS_QUANTITIES(1,16) + 1;
                      SUB_TOTAL = SUB_TOTAL + EXTRAS_PRICES(1,16);
                      
                      comment = num2str( EXTRAS_PRICES(1,16) , '%3.2f');
                      comment = [ '' , num2str( EXTRAS_QUANTITIES(1,16) ) , ' * ' , '$' , comment , '   ' ,  char( EXTRAS_BUTTON_NAMES(1,16) ) , '' ];
                      set( data_list_extras(18) , 'String' , comment );
              
                      
              catch
                      % when error occurs
                      error('An error has occurred' );
              end     
              


              
% the OK Button              
elseif strcmp( action , char(EXTRAS_BUTTON_NAMES(1,17)) )  
         
              try
                  
                  data_list_user = get( MAIN_PANELS , 'UserData' ); 
                  
                  value = TOTAL_AMOUNT + SUB_TOTAL + SUB_INTERNET_TOTAL;
                  comment = num2str( value , '%3.2f');
                  comment = [ '$' , comment ];
                  set( data_list_user(36) , 'String' , comment );
                  
                  data_list_extras = get( EXTRAS_PANEL , 'UserData' );
                  set( data_list_extras(18) , 'String' , '' );
                  
                  % extras panel is made invisible
                  set( EXTRAS_PANEL , 'Visible' , 'off' );

                  for i = 1:1:26
                       set( data_list_user(i) , 'Enable' , 'on' );
                  end
              catch
                  for i = 1:1:26
                       set( data_list_user(i) , 'Enable' , 'on' );
                  end
                  error('An error has occurred: Extra Ok Button' );
              end  
end
