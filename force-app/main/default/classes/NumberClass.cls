public class NumberClass {
    
    Integer x ; 
    public boolean method(Integer x)
    {
        if (math.mod(x,2) == 0)
        {
            System.debug('even');
            return true;
        }
        else
        {
            System.debug('odd');
            return false;
        }
    }     
}