function output = roundby5cent( input )
      a = input*100;
      b = round( a/5 );
      c = (b*5)/100;
output = c;