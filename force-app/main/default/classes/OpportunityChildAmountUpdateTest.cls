@isTest
private class OpportunityChildAmountUpdateTest {
    @isTest
    public static void insertOppAndChildCheck(){
        
        Opportunity opp = new Opportunity();
        opp.Name = 'sarav';
        opp.StageName = 'Prospecting';
        opp.CloseDate = system.today();
        insert opp;
        
        Opportunity_Child__c oppChild = new Opportunity_Child__c();
        oppChild.Name = 'test child';
        oppChild.Child_Amount__c = 0;
        oppChild.Opportunity__c = opp.Id;
        insert oppChild;
        
        Opportunity_Child__c insertOpp = [SELECT Id, Name ,Child_Amount__c From Opportunity_Child__c where Opportunity__c =: opp.Id];
        System.assertEquals(0, insertOpp.Child_Amount__c);
    }
    
    @isTest
    public static void amountShouldNotChangeWhenNameChanges(){
        
        Opportunity opp = new Opportunity();
        opp.Name = 'sarav';
        opp.StageName = 'Prospecting';
        opp.CloseDate = system.today();
        insert opp;
        
        Opportunity_Child__c oppChild = new Opportunity_Child__c();
        oppChild.Name = 'test child';
        oppChild.Child_Amount__c = 0;
        oppChild.Opportunity__c = opp.Id;
        insert oppChild;
        
        opp.Name = 'changed';
        update opp;
        
        Opportunity_Child__c insertOpp = [SELECT Id, Name ,Child_Amount__c From Opportunity_Child__c where Opportunity__c =: opp.Id];
        System.assertEquals(0, insertOpp.Child_Amount__c);
    }
    
    @isTest
    public static void childAmountGetsUpdatedWhenOppChanges(){
        Opportunity opp = new Opportunity();
        opp.Name = 'sarav';
        opp.StageName = 'Prospecting';
        opp.CloseDate = system.today();
        insert opp;
        
        Opportunity_Child__c oppChild = new Opportunity_Child__c();
        oppChild.Name = 'test child';
        oppChild.Opportunity__c = opp.Id;
        insert oppChild;
        
        opp.Amount = 100;
        update opp;
        
        Opportunity_Child__c updateName = [SELECT Id, Name ,Child_Amount__c From Opportunity_Child__c where Opportunity__c =: opp.Id];
       // Opportunity_Child__c updateNam = [Select Id ,Name ,Child_Amount__c,opportunity.Name  from Opportunity_Child__c];
        System.assertEquals(200, updateName.Child_Amount__c);
        
    }
    
    @IsTest
    public static void testShouldIncrementChildAmountBy200ForMultipleChildren() {
        
        Opportunity opp = new Opportunity();
        opp.Name = 'sarav';
        opp.StageName = 'Prospecting';
        opp.CloseDate = system.today();
        opp.Amount = 100;
        insert opp;
        
        List<Opportunity_Child__c> childList = new  List<Opportunity_Child__c>();
        Opportunity_Child__c child1 = new Opportunity_Child__c (Name = 'test child',Opportunity__c = opp.Id);
        Opportunity_Child__c child2 = new Opportunity_Child__c (Name = 'test child',Opportunity__c = opp.Id);
        childList.add(child1);
        childList.add(child2);
        
        insert childList;
        
        opp.Amount = 1000;
        update opp;
        
        List<Opportunity_Child__c> updateName = [SELECT Id, Name ,Child_Amount__c From Opportunity_Child__c where Opportunity__c =: opp.Id];
        
        System.assertEquals(200, updateName.get(0).Child_Amount__c);
        System.assertEquals(200, updateName.get(1).Child_Amount__c); 
        
    }
    @IsTest
    static void testShouldIncrementChildAmountForMultipleOpportunities() {
        
        List<Opportunity> newOppList = new  List<Opportunity>();
        Opportunity opp1 = new Opportunity(Name = 'saro',StageName = 'Prospecting',CloseDate = system.today());
        Opportunity opp2 = new Opportunity(Name = 'saro',StageName = 'Prospecting',CloseDate = system.today());
        newOppList.add(opp1);
        newOppList.add(opp2);
        insert newOppList;
        
        List<Opportunity_Child__c> childList = new  List<Opportunity_Child__c>();
        Opportunity_Child__c child1 = new Opportunity_Child__c (Name = 'test child',Opportunity__c = opp1.Id);
        Opportunity_Child__c child2 = new Opportunity_Child__c (Name = 'test child',Opportunity__c = opp1.Id);
        Opportunity_Child__c child3 = new Opportunity_Child__c (Name = 'test child',Opportunity__c = opp2.Id);
        Opportunity_Child__c child4 = new Opportunity_Child__c (Name = 'test child',Opportunity__c = opp2.Id);
        childList.add(child1);
        childList.add(child2);
        childList.add(child3);
        childList.add(child4);
        
        insert childList;
       // List<Opportunity> newOpps = [SELECT Id,Name From Opportunity Where  Name ='saro' AND CreatedDate = TODAY];
       //List<Opportunity> opps = new List<Opportunity>();
        for(Opportunity opp : newOppList ){
            opp.Amount = 100;
           
        }
         update newOppList;
       //newOppList.get(0).Amount = 100;
         //newOppList.get(1).Amount = 100;
        //update newOppList;
      
        List<Opportunity_Child__c> updateName = [SELECT Id, Name ,Child_Amount__c FROM Opportunity_Child__c WHERE Opportunity__c In :newOppList];
        
        System.assertEquals(200, updateName.get(0).Child_Amount__c);
        System.assertEquals(200, updateName.get(1).Child_Amount__c); 
        
    }
}