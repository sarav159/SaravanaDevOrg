public class OpportunityTrialhead {

    public static void oppMethod (List<Opportunity>oppList){
        List<Task> taskList = new  List<Task>();
        for(Opportunity opp : oppList){
            if(opp.StageName == 'Closed Won'){
                taskList.add(new Task(Subject ='Follow Up Test Task',WhatId = opp.Id));
            }
        }
        insert taskList;
    }
    public static void oppMethod1 (List<Opportunity>oppList,Map<Id,Opportunity> oldOppMap){
        
        List<Task> taskList = new  List<Task>();
        for(Opportunity opp : oppList){
            Opportunity oldOpp  = oldOppMap.get(opp.Id);
            if(opp.StageName =='ClosedWon' && opp.StageName != oldOpp.StageName){
                taskList.add(new Task(Subject ='Follow Up Test Task',WhatId = opp.Id));
            }
        }
        insert taskList;
    }
}