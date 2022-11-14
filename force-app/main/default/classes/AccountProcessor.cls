global class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> recordIds) {
        system.debug('rec'+ recordIds);
        List<Account> accList = [Select Id,(SELECT ID FROM Contacts) from Account Where Id IN :recordIds];
        
        for(Account acc : accList){
            system.debug('conList'+ acc.contacts);
            acc.Number_Of_Contacts__c = acc.Contacts.size();
        }
        
        update accList;
    }
}