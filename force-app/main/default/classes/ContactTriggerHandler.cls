public class ContactTriggerHandler  extends TriggerHandler{
    
    /*Public static void countContacts(List<Contact> newList){
        Set <Id> accountIds = new Set <Id>();
        
        for(Contact con : newList){
            accountIds.add(con.accountId) ;
        }*/
        /* for(Contact cont : oldList){
             if(cont.AccountId != Null){
                 accountIds.add(cont.accountId); 
             }
           
        }*/
      
        /*List <Account> listAccountsToUpdate = new List <Account>();
        
        for(Account acc:[SELECT Id,Name,Total_Contacts__c,(Select Id from Contacts) from Account where Id IN: accountIds]){
            Account accObj = new Account ();
            accObj.Id = acc.Id;
            accObj.Total_Contacts__c = acc.Contacts.size();
            listAccountsToUpdate.add(accObj);
        }
        update listAccountsToUpdate;
    }*/
    
    public override void afterInsert(){
        List<Id> contactIds = new  List<Id>();
        for(Contact con : (List<Contact>) Trigger.new){
            contactIds.add(con.Id);
        }
        System.debug('contact'+contactIds);
        //UpdateContactGenderAPI.updateMultipleContacts(contactIds);
        UpdateContactGenderAPI.updateContactWithCountryCode(contactIds); 
    }  
    
    
    
}