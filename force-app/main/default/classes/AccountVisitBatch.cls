public class AccountVisitBatch implements Database.Batchable <sObject> {
    
    
    /*public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator([SELECT Id, CreatedDate FROM Account]);
    }
    
    public void execute(Database.BatchableContext BC, List<Account> accList){
        
        Set<Id> accountIds = new Set<Id>();
        
      
        List<Visit__c> deleteVisit = new List<Visit__c>();
        //for(Account acc : accList) {
       //visitIds.add(acc.Id);
       //}
        
        List<Visit__c> visitList = [SELECT Id, Name, Visit_Date__c, Account__c FROM Visit__c  ORDER BY Visit_Date__c DESC];
        for(Visit__c visit : visitList) {
            if(accountIds.contains(visit.Account__c)) {
                deleteVisit.add(visit);
            } else {
                accountIds.add(visit.Account__c);
            }
        }
        delete deleteVisit;
        
        
    }
    public void finish(Database.BatchableContext BC){
        
    }*/
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id, Name, Visit_Date__c, Account__c FROM Visit__c]);
    }
    
    public void execute(Database.BatchableContext bc, List<Visit__c> visList){
        Set<Id> accountIds = new Set<Id>();
        
        for(Visit__c vi : visList) {
            accountIds.add(vi.Account__c);
        }
        List<Visit__c> deleteVisit = new List<Visit__c>();
        List<Visit__c> visitList = [SELECT Id, Name, Visit_Date__c, Account__c FROM Visit__c WHERE
                                    Account__c IN :accountIds  ORDER BY Visit_Date__c DESC, CreatedDate DESC ];
        
        Map<String,Visit__c> visitMap = new Map<String,Visit__c>();
        
        
        for(Visit__c vis : visitList) {
            String key = vis.Account__c + ':' + vis.Visit_Date__c;
            if(visitMap.containsKey(key)) {
                deleteVisit.add(vis);
            } else {
                visitMap.put(key,vis);
            }
        }
        delete deleteVisit;
        
    }
    public void finish(Database.BatchableContext bc){
        
    }
}