trigger AsiaEuropeTrigger on Account (before insert,before update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert|| Trigger.isUpdate){
           AsiaEuropeClass.AccountCustomerMethod(Trigger.new) ;
        }
    }
}