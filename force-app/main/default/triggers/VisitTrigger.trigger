trigger VisitTrigger on Visit__c (before insert,after insert,after update) {
    
    if(trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate ){
           VisitTriggerHandler.visitUpdate(Trigger.new); 
        }
    }
    
    if(trigger.isBefore && Trigger.isInsert ){
           VisitTriggerHandler.createOneVisitPerAccountPerDay(Trigger.new); 
    }
  
}