public class Demo1 {
    public  static void countAccount(){
       /* List<Account> accList = [SELECT Id, Name, (SELECT Id, FirstName, LastName FROM Contacts) FROM Account WHERE CreatedDate = LAST_WEEK];
        
        for(Account acc : accList){
            acc.Total_Contacts__c = acc.Contacts.size();
        }
        update accList;
    }
}*/

List<Contact> Conlist = [SELECT Id, FirstName, Phone, Account.Phone FROM Contact Where AccountId != NULL];
  
for(Contact con : ConList){
    if( Con.phone == NULL){
    Con.phone = Con.Account.Phone;
}
}
        update Conlist;
    }
}