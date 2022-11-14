@isTest
public class PalindromeTest {
    @isTest
    static void palin()
    {
        Palindrome p = new Palindrome();
        Integer b = p.pali(1001);
        Integer c = p.pali(1004);
        system.assertequals(0,b);
     
        system.assertequals(1,c);
      
    }
    
}