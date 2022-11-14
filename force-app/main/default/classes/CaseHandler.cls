public class CaseHandler extends TriggerHandler{
    
    public static void insertCase(List<case> insertcase){
        for(Case ca :insertcase) {
            ca.Description = '';    
        }
    }
    public static void updateCaseDescription(List<Case> newCase, Map<id,case> oldCase){
        for(Case new1 :newCase){
            
            Id caseid = new1.id;
            Case old = oldCase.get(caseid);
            
            if(new1.Status != old.Status){
                new1.Description = old.Description + 'Hello';
            }
        }
    }
    protected override void afterUpdate(){
        
         // 1. Find out if case amount has changed
        List<Case> caseWhoseAmountChanged = new List<Case>();
        
        for(Case newCase : (List<Case>) Trigger.new) {
            Case oldCase = (Case) Trigger.oldMap.get(newCase.Id);
            if(newCase.Account_Amount__c != oldCase.Account_Amount__c) {
                caseWhoseAmountChanged.add(newCase);
            }
        }
       
    }
}
            
           /* if(new1.Status != oldCase.get(new1.Id).Status){
                new1.Description = oldCase.get(new1.Id).Description + 'Hello';
            }*/
         
    
    /*public static void updateCaseDescriptionList(List<case>newCaseList,List<case>oldCaseList){
        for(Case newCase : newCaseList ){
            String newCaseName = newCase.Status;
            Case oldCaseName;
            
            for(Case oldCase : oldCaseList){
                oldCaseName = oldCase;
                break;
            }
             if(newCaseName != oldCaseName.Status){
           newCase.Description =  oldCaseName.Description +'Hello';
        }
       
        }
    }*/