public class VisitTriggerHandler {
    
    public static void visitUpdate(List<Visit__c> newVisit){
        /*for(Visit__c vs : newVisit){
if(vs.Is_Latest__c == false){
vs.Is_Latest__c = true;
}
}*/
        Set<Id> accountIds = new Set<Id>();
        Set<Id> visitIds = new Set<Id>();
        
        for(Visit__c d : newVisit){
            //d.Is_Latest__c = true;
            if(d.Is_Latest__c == true){
                accountIds.add(d.Account__c);
                visitIds.add(d.id);
            }
        }
        List<Visit__c> visitList = [SELECT Id,Is_Latest__c FROM Visit__c 
                                    WHERE Is_Latest__c = true AND Account__c IN:accountIds AND Id NOT IN:visitIds];
        
        for(Visit__c vis : visitList){
            vis.Is_Latest__c = false;
            update visitList;
        }
        
    }
    
    Public static void createOneVisitPerAccountPerDay(List<Visit__c> newVisit){
        
        List<Id> accIds = new List<Id>();
        
        for(Visit__c visit : newVisit){
            accIds.add(visit.Account__c);
        }
        List<Visit__c> visitList = [SELECT Id,Name, CreatedDate, CreatedById FROM Visit__c WHERE Account__c IN :accIds];   
                
        for(Visit__c newRecord : newVisit){
            for(Visit__c  oldRecord : visitList){
                if(newRecord.CreatedDate != oldRecord.CreatedDate){
                    newRecord.addError('You cannot create one more record per day');
                }   
            }
        }
    }
}