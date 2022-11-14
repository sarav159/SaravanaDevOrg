@isTest
public class NumberClassTest {
    @isTest
    static void evenOdd(){
        NumberClass instance = new  NumberClass();
        boolean  result =  instance.method(20);
        boolean result12 =  instance.method(17);   
        System.assertequals(true,result);
        System.assertequals(false,result12);   
    }
    
}