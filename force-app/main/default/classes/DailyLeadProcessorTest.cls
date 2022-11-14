@isTest
public class DailyLeadProcessorTest {
    @isTest
    static void testLeadDaily(){
        List<Lead> leadlist = new  List<Lead>();
        
        String sch = '0 0 0 1 10 ? 2032';
        
        for(integer i = 0; i<200;i++){
            leadList.add(new Lead(LastName = 'Test' + i,Company = 'SKY'));
            /*Lead le = new Lead();
            le.LastName = 'TestLead' + i;
            le.Company = 'TCS';
            leadlist.add(le);*/
        }
        insert leadlist;
        
        
        Test.startTest();
        DailyLeadProcessor lee = new DailyLeadProcessor();
        String jobID = system.schedule('lead Job', sch, lee);
        Test.stopTest();
        
        List<Lead> updatedLead = [SELECT Id,LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200,updatedLead.size());
    }
}