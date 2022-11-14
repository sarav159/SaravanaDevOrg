public class MyDemo {
    public  static void updateOpp(){
        List<Opportunity> oppList = [SELECT Id, Name, StageName FROM Opportunity WHERE CreatedDate = THIS_WEEK];   
        
        
        for(Opportunity opp :oppList){
            if(opp.StageName == 'Closed Won'){
                opp.Description = 'WON';
            }
           else if(opp.StageName == 'Closed Lost'){
                opp.Description = 'LOST';
            }
        }
       update oppList; 
    }
}