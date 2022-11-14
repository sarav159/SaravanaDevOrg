public class OpportunityBatch implements Database.Batchable<sObject>,Database.Stateful{
    
    public Integer recordCount = 0;
    
    Public Database.Querylocator start(Database.BatchableContext bc){
        return Database.getQuerylocator([SELECT Id, Name, LeadSource FROM Opportunity]);
    }
    
    Public void execute(Database.BatchableContext bc, List<Opportunity> oppList){
        for(Opportunity opps : oppList){
            opps.LeadSource = 'Web';
        }
       update oppList;
        recordCount = recordCount + oppList.size();
      
    }
   
    
    Public void finish(Database.BatchableContext bc){
        System.debug('Total records :'+ recordCount);  
    } 

}