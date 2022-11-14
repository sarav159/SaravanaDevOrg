@isTest
private class AnimalLocatorTest {

    @isTest
    static void testFindString(){
         
        
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        
        Test.startTest();
        String result =  AnimalLocator.getAnimalNameById(1);
        Test.stopTest();
      
        String expectedResult = 'chicken';
        system.debug('result :'+result);
        System.assertEquals(expectedResult, result);
        
    }
}