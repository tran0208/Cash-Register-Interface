function y = isNumber( a )
result = false; 
     if   a=='1' || a=='2' || a=='3' || a=='4' || a=='5' ...
          || a=='6' || a=='7'  || a=='8' || a=='9' || a=='0' ...
          || a=='.' || a=='+' || a=='-' || a =='*'|| a=='/'
   
          result = true; 
     end
y = result;