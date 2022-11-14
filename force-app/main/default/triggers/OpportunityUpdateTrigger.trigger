trigger OpportunityUpdateTrigger on Opportunity (before update) {
 
    if(Trigger.isBefore && Trigger.isUpdate){
        OpportunityTriggerHandler.updateOpportunityChildAmount(Trigger.old,Trigger.newMap);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
              OpportunityTriggerHandler.updateOppStageName(Trigger.new,Trigger.oldMap);
    }
}