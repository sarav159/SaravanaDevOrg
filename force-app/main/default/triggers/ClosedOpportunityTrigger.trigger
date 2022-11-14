trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    
    if (Trigger.isAfter && Trigger.isInsert){
       OpportunityTrialhead.oppMethod(Trigger.new);
}
    if (Trigger.isAfter && Trigger.isUpdate){
        OpportunityTrialhead.oppMethod1(Trigger.new,Trigger.oldMap);
       
}
}