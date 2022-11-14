global class ContactGenderBatchClass  implements Database.Batchable <sObject>,Database.AllowsCallouts{
    
    
    global Database.Querylocator start(Database.BatchableContext bc){
        return Database.getQuerylocator([SELECT Id, FirstName, Gender__c FROM Contact WHERE  Gender__c = Null ]);
    }
    
    global void execute(Database.BatchableContext bc, List<Contact>conList){
        
        for(Contact loopContactVariable : conList) {  
            Http h = new Http();
            HttpRequest req = new HttpRequest();
            req.setMethod('GET');
            req.setEndpoint('https://api.genderize.io/?name=' + loopContactVariable.FirstName);
            try{
                HttpResponse resp = h.send(req);
           
            if(resp.getStatusCode() == 200){
            Gender gen = (Gender) JSON.deserialize(resp.getBody(), Gender.class);
                  loopContactVariable.Gender__c = gen.gender;
            }
            } 
            
          
        
        catch(exception ex){
                    System.debug('Debug');
                }
        }
       Database.update (conList, false);
    }
    
    public class Gender {
        public String gender;
    }
    
    global void finish(Database.BatchableContext bc){
    } 
}