trigger DriverObjectTrigger on Driver__c (before insert,before update) {
if(Trigger.isBefore){
        if(Trigger.isInsert|| Trigger.isUpdate){
           DriverObjectClass.driverMethod(Trigger.new);
        }
    }
}