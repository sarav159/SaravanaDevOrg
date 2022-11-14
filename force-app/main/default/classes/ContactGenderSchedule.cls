global class ContactGenderSchedule implements Schedulable {
    
    global void execute(SchedulableContext sc)
    {
        ContactGenderBatchClass b = new ContactGenderBatchClass();
        database.executebatch(b,100);
    }
}