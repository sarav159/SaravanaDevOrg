public class MyAccountTriggerhandler {
 
    public static void beforeInsert(List<Account> newList) {
        for(Account acc : newList){
            if(acc.Industry != Null && acc.Industry == 'Media'){
                acc.Rating = 'Hot';
            }
        }
    }
    public static void afterInsert(List<Account> newList){
        List<Opportunity> insertOpp = new List<Opportunity>();
        for(Account acc : newList){
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            Opp.CloseDate = System.today();
            Opp.StageName = 'Prospecting';
            Opp.AccountId = acc.Id;
            insertOpp.add(opp);
        }
        if(!insertOpp.isEmpty()){
            insert insertOpp;
        }
    }
    public static void beforeUpdate(List<Account> newList,Map<Id,Account> oldMap) {
        for(Account acc : newList){
            if(acc.Phone != oldMap.get(acc.Id).phone){
                acc.Description ='Phone is modified';
            }   
        }
    }
  public static void afterUpdate(List<Account> newList,Map<Id,Account>oldMap) {           
  }
            
            
}