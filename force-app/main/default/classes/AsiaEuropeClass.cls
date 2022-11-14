public class AsiaEuropeClass {
    public static void accountCustomerMethod(List<Account> triggernew){
        
        Id emea = Schema.SObjectType.Account.getRecordTypeInfosByName().get('EMEA').getRecordTypeId();
        Id apac = Schema.SObjectType.Account.getRecordTypeInfosByName().get('APAC').getRecordTypeId();
        
        for(Account acc : TriggerNew)
        {
            if(acc.RecordTypeId==emea)
            {
                acc.Reason__c='Europe';
            }
            else if(acc.RecordTypeId==apac)
            {
                acc.Reason__c='Asia';
            }
        }
        
    }
}