@isTest
private class CreateMultipleContactsViaAPITest {
    
    @isTest
    static void checkInsertedContacts(){
        //Given
        List<Contact> contactList = [SELECT Id From Contact];
        //Integer expected =10;
        Integer contactCount = contactList.size();
        
        Test.setMock(HttpCalloutMock.class, new CreateContatsViaAPIMock()); 
        
        //when
        Test.startTest();
        CreateMultipleContactsViaAPI.createListOfContacts();
        Test.stopTest();
        
        //Then
        List<Contact> newContactList = [SELECT Id From Contact];
        System.assertEquals(10, newContactList.size());
        
    }
}