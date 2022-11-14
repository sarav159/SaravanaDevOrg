global class LeadProcessor implements Database.Batchable<sObject>,Database.Stateful{
    
    global Integer recordCount = 0;
    
    global Database.Querylocator start(Database.BatchableContext bc){
        return Database.getQuerylocator([SELECT Id, Name FROM Lead]);
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> leadList){
        for(Lead leads : leadList){
            leads.LeadSource = 'DreamForce';
        }
       update leadList;
        recordCount = recordCount + leadList.size();
      
    }
   
    
    global void finish(Database.BatchableContext bc){
        System.debug('Total records :'+ recordCount);  
    } 

}