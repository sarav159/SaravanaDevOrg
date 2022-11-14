public class Palindrome    
{    
    public Integer pali(integer n)
    {
        Integer r,sum=0,temp;       
        temp=n;    
        while(n>0)    
        {    
            r=math.mod(n, 10);   
            sum=(sum*10)+r;    
            n=n/10;    
        }    
        if(temp==sum) 
        {
            system.debug('palindrome');
            return 0; 
        }
        else    
        {
            system.debug('not palindrome');  
            return 1;  
        }   
    }
}