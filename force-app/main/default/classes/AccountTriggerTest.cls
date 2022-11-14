@isTest
public class AccountTriggerTest {
    @isTest
    static void accountStateTest(){
        
        List<Account> accList = new  List<Account>();
        for(Integer i=0; i<200;i++){
            accList.add(new Account(Name = 'Test' + i,Rating ='Hot',BillingState = 'CA'));
        }
        insert accList;
        
        List<Account> accs = [SELECT id, Name FROM Account Where BillingState = 'CA'];
        System.assertEquals(200, accs.size());
    }
    
}