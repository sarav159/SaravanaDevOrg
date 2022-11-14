trigger CaseTrigger on Case (before insert,before update,after Update) {
    
    if(trigger.isBefore && trigger.isInsert){
      CaseHandler.insertCase(Trigger.new);
    }
    
     if(trigger.isBefore && trigger.isUpdate){
      CaseHandler.updateCaseDescription(Trigger.new,Trigger.oldmap);
    }
    
   new  CaseHandler().run();
}