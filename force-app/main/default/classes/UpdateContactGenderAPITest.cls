@isTest
private class UpdateContactGenderAPITest {
    
    @isTest
    static void testFindAndSaveGenderForSingleContact() {
        // Given
        Contact con = new Contact();
        con.FirstName = 'Virat';
        con.LastName = 'Kohli';
        insert con;
        
        String expectedGender = 'male';
        //NameGenderFinderMock mock = new NameGenderFinderMock();
        //mock.isError = false;
        Test.setMock(HttpCalloutMock.class, new ContactGenderAPIMock());
        
        // When
        Test.startTest();
        UpdateContactGenderAPI.findAndSaveGenderForSingleContact(con.Id);
        Test.stopTest();
        
        // Then
        Contact conAgain = [SELECT Id, Gender__c FROM Contact WHERE Id = :con.Id LIMIT 1];
        System.assertEquals(expectedGender, conAgain.Gender__c, 'Gender response must be equal to the one from API');
    }
    
    @isTest
    static void testFindAndSaveGenderForMultipleContacts(){
        
        //Given
        List<Contact> conList = new List<Contact>();
        Contact con1 = new Contact();
        con1.FirstName = 'Jebin';
        con1.LastName = 'R';
        Contact con2 = new Contact();
        con2.FirstName = 'Saravana';
        con2.LastName = 'T';
        Contact con3 = new Contact();
        con3.FirstName = 'Monisha';
        con3.LastName = 'R';
        conList.add(con1);
        conList.add(con2);
        conList.add(con3);
        
        insert conList;
        
        List<Id> conIds = new List<Id>();
        for(Contact con : conList){
            conIds.add(con.id);
        }
            
         Test.setMock(HttpCalloutMock.class, new ContactGenderAPIMock());
        
        Test.startTest();
        UpdateContactGenderAPI.findAndSaveGenderForMultipleContacts(conIds);
        Test.stopTest();
        
        List<Contact> contactList = [SELECT Id,Name,Gender__c FROM Contact WHERE Id IN :conIds AND Gender__c != Null];
        System.assertEquals(3, contactList.size());
    }
    
    @isTest
    static void testFailFindAndSaveGenderForMultipleContacts_FailureResponse(){
        
        //Given
        List<Contact> conList = new List<Contact>();
        Contact con1 = new Contact();
        con1.FirstName = 'Sara';
        con1.LastName = 'R';
        Contact con2 = new Contact();
        con2.FirstName = 'Saravana';
        con2.LastName = 'T';
        Contact con3 = new Contact();
        con3.FirstName = 'Monisha';
        con3.LastName = 'R';
        conList.add(con1);
        conList.add(con2);
        conList.add(con3);
        
        insert conList;
        
        ContactGenderAPIMock mock = new ContactGenderAPIMock();
        mock.isError = true;
        
        Test.setMock(HttpCalloutMock.class, mock);
        
         
        List<Id> conIds = new List<Id>();
        for(Contact con : conList){
            conIds.add(con.id);
        }
        
        Test.startTest();
		UpdateContactGenderAPI.findAndSaveGenderForMultipleContacts(conIds);
        Test.stopTest();
        
        List<Contact> newContactList = [SELECT Id,Name,Gender__c FROM Contact WHERE Id IN :conIds AND Gender__c = Null];
         System.assertEquals(3, newContactList.size());
    } 
    
     @isTest
    static void testSameNameFindAndSaveGenderForMultipleContacts_FailureResponse(){
        
        //Given
        List<Contact> conList = new List<Contact>();
        Contact con1 = new Contact();
        con1.FirstName = 'Saravana';
        con1.LastName = 'T';
        Contact con2 = new Contact();
        con2.FirstName = 'Saravana';
        con2.LastName = 'T';
        Contact con3 = new Contact();
        con3.FirstName = 'Monisha';
        con3.LastName = 'R';
        conList.add(con1);
        conList.add(con2);
        conList.add(con3);
        
        insert conList;
        
        List<Id> conIds = new List<Id>();
        for(Contact con : conList){
            conIds.add(con.id);
        }
            
         Test.setMock(HttpCalloutMock.class, new ContactGenderAPIMock());
        
        Test.startTest();
        UpdateContactGenderAPI.findAndSaveGenderForMultipleContacts(conIds);
        Test.stopTest();
        
}
}