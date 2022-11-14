public class VisitBatch implements Database.Batchable<sObject>{
    
    
    Public Database.Querylocator start(Database.BatchableContext bc){
        return Database.getQuerylocator([SELECT Id From Account]);
        
    }
    
    Public void execute(Database.BatchableContext bc, List<Account> accList){
        
       List<Visit__c> visitList = [SELECT Id, Name, Visit_Date__c, Account__c FROM Visit__c Where 
                                    Account__c IN :accList ORDER By Account__c DESC,Visit_Date__c DESC];
        
        Set<Id> accIds = new Set<Id>();
        List<Visit__c> visitsToBeDeleted = new  List<Visit__c>();
        
        for(Visit__c vi : visitList){
            if(accIds.contains(vi.Account__c)){
                visitsToBeDeleted.add(vi);
            }else{
                accIds.add(vi.Account__c);
            }
        }
        delete visitsToBeDeleted; 
    }
    
    
    Public void finish(Database.BatchableContext bc){
        
    } 
}