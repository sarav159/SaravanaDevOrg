trigger MyAccountTrigger on Account (before insert,after insert,before update,after update) {
    
    /*if(Trigger.isBefore && Trigger.isInsert){
        MyAccountTriggerhandler.beforeInsert(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isInsert){
        MyAccountTriggerhandler.afterInsert(Trigger.new);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        MyAccountTriggerhandler.beforeUpdate(Trigger.new,Trigger.oldMap);
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        //MyAccountTriggerhandler.afterUpdate(Trigger.new);
    }*/
}