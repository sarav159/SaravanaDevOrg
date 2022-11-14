@isTest
private class AccountProcessorTest {
    @isTest
     private static void countContactsTest(){
         
        List<Account> accList = new List<Account>();
        for(integer i = 0; i<200;i++){
            accList.add(new Account(Name = 'Test',Rating = 'Hot'));
        }
        insert accList;
        
        List<Contact> conList = new List<Contact>();
        List<Id> accIds = new  List<Id>();
        for(Account acc : accList){
            conList.add(new Contact(LastName = 'Test',AccountId = acc.Id));
            accIds.add(acc.Id);
        }
        insert conList;
        
        Test.startTest();
        AccountProcessor.countContacts(accIds);
        Test.stopTest(); 
        
      List<Account> accs = [SELECT Id,Number_Of_Contacts__c FROM Account];
        System.assertEquals(1,accs[0].Number_Of_Contacts__c);
    }
  /*  @IsTest
    static void testCountContacts(){
        Account acc = new Account(Name='Test Account', Rating = 'Hot');
        insert acc;
        
        Contact c = new Contact();
        c.FirstName = 'Bob';
        c.LastName =  'Willie';
        c.AccountId = acc.Id;

        
        Contact c2 = new Contact();
        c2.FirstName = 'Tom';
        c2.LastName = 'Cruise';
        c2.AccountId = acc.Id;

        
        List<Id> accountIds = new List<Id>();
        accountIds.add(acc.Id);
        
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        
       List<Account> accs = [SELECT Id, Name,Number_Of_Contacts__c FROM Account];
        System.assertEquals(2,accs[0].Number_Of_Contacts__c); 
        
    }*/
    
}