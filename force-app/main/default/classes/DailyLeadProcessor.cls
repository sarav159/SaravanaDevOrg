global class DailyLeadProcessor  implements Schedulable{
    
    global void execute(SchedulableContext ctx){
        
        List<Lead> leadList = [SELECT Id,LeadSource FROM Lead WHERE LeadSource = null ];
        
        for (Lead Le : leadList){

            
            le.LeadSource = 'Dreamforce';
            
        }
        update leadList;        
    }
    
}