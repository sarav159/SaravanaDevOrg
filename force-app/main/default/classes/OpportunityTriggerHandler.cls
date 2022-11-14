public class OpportunityTriggerHandler {
    
    public static void updateOpportunityChildAmount(List<Opportunity> oldList,Map<id,Opportunity> newMap){
        system.debug('oldList:'+oldList);
        system.debug('newMap:'+newMap);
        List<Opportunity> amountChanged = new List<Opportunity>();
        
        for(Opportunity opp : oldList){
            Opportunity newOpp = newMap.get(opp.id);
            if(opp.Amount != newOpp.Amount ){
                amountChanged.add(newOpp);
            }
        }
        system.debug('amountChanged:'+amountChanged);
        
        List <Opportunity_Child__c> optyIncrement = new List <Opportunity_Child__c>();
        
        for(Opportunity op :[Select id,(Select id,Name,Child_Amount__c from Opportunity_Childs__r)From Opportunity where id In :amountChanged]){
            List<Opportunity_Child__c> children = op.Opportunity_Childs__r; 
            optyIncrement.addAll(children);
            system.debug('children:'+children);
            
        }
        
        
        
        for(Opportunity_Child__c opty : optyIncrement){
            system.debug('opty:'+opty);
            if(opty.Child_Amount__c == NULL){
                opty.Child_Amount__c = 200;     
            }Else{
                opty.Child_Amount__c =  opty.Child_Amount__c +200; 
            }
            
            
        }
        
        update  optyIncrement;
        
    }
    Public static void updateOppStageName(List<Opportunity> newOpp ,Map<Id,Opportunity> oldMap){
         for(Opportunity opp : newOpp){
            Opportunity oldOpp = oldMap.get(opp.Id); 
            if(opp.StageName != oldOpp.StageName) {
                opp.Amount = oldOpp.Amount + 1000;
                System.debug('opty amount is :' + opp.Amount);
            } 
        }
    }
}
/*if (trigger.isUpdate){
if(trigger.isBefore) {

// Only be executed when something is updated
List<Opportunity> oldOpportunities = Trigger.old;
List<Opportunity> newOpportunities = Trigger.new;

System.debug('newOpportunities :' + newOpportunities);
System.debug('oldOpportunities :' + oldOpportunities);

Opportunity oldOpp = oldOpportunities.get(0); //[0]
Opportunity newOpp = newOpportunities.get(0);

if(oldOpp.StageName != newOpp.StageName) {
System.debug('stagename has changed from ' + oldOpp.StageName + ' to ' + newOpp.StageName);

newOpp.Amount = oldOpp.Amount + 1000;
System.debug('opty amount is :' + newOpp.Amount);
}
}
}*/
    
    /*List<Opportunity> opps = new List<Opportunity>();
for(integer i=0;i<10;i++)
{
Opportunity opp = new Opportunity(); 
opp.Name = 'saravana T S';
opp.StageName = 'Prospecting';
opp.CloseDate = System.today();
opps.add(opp);
}
insert opps;
system.debug('opps'+opps);

List<Opportunity> opty = [SELECT Id, Name FROM Opportunity WHERE CreatedDate = TODAY];
List<Opportunity> oppList = new List<Opportunity> ();
for(Opportunity op: opty){
op.StageName = 'Qualification';
oppList.add(op);
}
update oppList;
System.debug('oppList'+oppList);*/