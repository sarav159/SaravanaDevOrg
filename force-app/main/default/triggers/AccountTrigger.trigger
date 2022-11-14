trigger AccountTrigger on Account (before insert) {
    if(trigger.isInsert && trigger.isbefore){
        System.debug('size :'+Trigger.new.size());
       // AccountTriggerHandler.CreateAccounts(trigger.new);
        
    }
}