@isTest
private class VisitTriggerTest {
    @isTest
    static void testToCheckIsLatestField(){
        
        Account acc = new Account();
        acc.Name = 'test';
        acc.Rating = 'Hot';
        insert acc;
        
        Visit__c vs = new Visit__c();
        vs.Name = 'visit 1';
        vs.Is_Latest__c = true;
        vs.Account__c = acc.Id;
        insert vs;
        
        Visit__c vs1 = new Visit__c();
        vs1.Name = 'visit 2';
        vs1.Is_Latest__c = true;
        vs1.Account__c = acc.Id;
        insert vs1;
        
        Visit__c visit = [SELECT Id ,Name,Is_Latest__c FROM Visit__c Where Name = 'visit 1'];  
        System.assertEquals(false, visit.Is_Latest__c);
    }
    
    @isTest
    static void testToCheckOneVisitPerAccount(){
        Account acc = new Account();
        acc.Name = 'test';
        acc.Rating = 'Hot';
        insert acc;
        
        List<Visit__c> VisitList = new List<Visit__c>();
        
        Visit__c v1 = new Visit__c(Name ='visit 1',Account__c = acc.Id);
        Visit__c v2 = new Visit__c(Name ='visit 2',Account__c = acc.Id);
        VisitList.add(v1);
        insert VisitList;
        
        VisitList.add(v2);
        insert VisitList;
        
        List <Visit__c> visit = [SELECT Id ,Name FROM Visit__c Where Account__c  =:acc.Id]; 
        System.assertEquals(1, visit.size());
        
    }     
}