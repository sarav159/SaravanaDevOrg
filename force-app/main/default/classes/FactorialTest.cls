@isTest
public class FactorialTest {
  @isTest  
     static void  facto() {
        Factorial numbers = new Factorial();
        long check1 =  numbers.fact(4);
        System.assertequals(24,check1);
    }
}