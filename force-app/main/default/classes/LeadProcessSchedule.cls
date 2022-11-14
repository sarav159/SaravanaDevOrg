global class LeadProcessSchedule implements Schedulable {

    global void execute(SchedulableContext ctx){
         LeadProcessor lea = new LeadProcessor();
        DataBase.executeBatch(lea);
    
    }
}