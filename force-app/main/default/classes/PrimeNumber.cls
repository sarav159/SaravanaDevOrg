public class PrimeNumber {
    
  static integer remainder;
  static boolean isPrime=true;
    
    public  Integer func(Integer num){
        
        for(integer i=2;i<=num/2;i++)
  {
            remainder=math.mod(num,i);
            System.debug(num+ 'Divided by'+ i + 'gives a remainder'+remainder);
       
     if(remainder==0)
     {
        isPrime=false;
        break;
     }
  }

if(isPrime)
{
     System.debug(num + 'is a Prime number');
     return 0;
}
  else
  {
     System.debug(num + 'is not a Prime number');
      return 1;
  }
    }        
    }