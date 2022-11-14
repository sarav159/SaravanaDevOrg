@isTest
public class PrimeNumberTest {
    @isTest
    static void primeornot(){
        PrimeNumber check = new PrimeNumber();
        Integer result = check.func(2);
        Integer result1 = check.func(4);
        system.assertequals(0,result);
        system.assertequals(1,result1); 
    }  
}