public class StudentController {
    
 /*   @AuraEnabled
    public static Boolean saveStudent(String name, String fathersName) {
        StudentList__c stud = new StudentList__c() ;
        try {
            stud.Name = name;
            stud.Fathers_Name__c = fathersName;
            insert stud;
            System.debug('@@@@@@@@@@ '+stud);
        }catch(Exception e) {
            return false;
        }
        return true;*/
    
    @AuraEnabled
    public static List<StudentList__c>  studentlist(String name, String fathersName,Decimal tamil,Decimal english,Decimal maths,Decimal science,Decimal social) {
        StudentList__c stud = new StudentList__c() ;
        List<StudentList__c> studList = new List<StudentList__c>();
        
        Decimal avg = (tamil+english+maths+science+social)/5;
        
        stud.Name = name;
        stud.Fathers_Name__c = fathersName;
        stud.Tamil__c = tamil;
        stud.English__c = english;
        stud.Maths__c = maths;
        stud.Science__c = science;
        stud.Social__c = social;
        
        stud.sum__c = tamil+english+maths+science+social;
        stud.Average__c = avg;
        
        if(avg >= 80){
            stud.Class__c = 'First Class';
        }else if (avg >= 70 && avg < 80){
            stud.Class__c = 'Second Class';
        }else if ( avg < 70){
            stud.Class__c = 'Third Class';
        }
        
        if(tamil>50 && english> 50 && maths>50 && science> 50 && social > 50){
            stud.Result__c = 'Pass'; 
        }
        else{
            stud.Result__c = 'Fail';
        }
        studList.add(stud);
        
        insert studList;
        
        return studList;
    }
}