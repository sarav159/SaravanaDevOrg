public class StudentDemoMap {
    public static Map<Integer, Student__c> createStudentRecords() {
        
        Map<Integer, Student__c> studentsMap = new Map<Integer, Student__c>();
        
        Student__c stud1 = new Student__c();
        stud1.Age__c =19;
        Stud1.Roll_Number__c = 1;
        stud1.Fathers_Name__c = 'Dady1';
        stud1.Name = 'Son1';
        stud1.Physics__c = 70;
        stud1.Tamil__c = 80;
        stud1.Chemistry__c = 90;
        stud1.English__c = 60;
        stud1.Mathematics__c = 50;
        
        Student__c stud2 = new Student__c();
        stud2.Age__c =29;
        stud2.Roll_Number__c = 2;
        stud2.Fathers_Name__c = 'Dady2';
        stud2.Name = 'Son2';
        stud2.Physics__c = 70;
        stud2.Tamil__c = 80;
        stud2.Chemistry__c = 90;
        stud2.English__c = 60;
        stud2.Mathematics__c = 50;
        
        Student__c stud3 = new Student__c();
        stud3.Age__c =27;
        stud3.Roll_Number__c = 3;
        stud3.Fathers_Name__c = 'Dady3';
        stud3.Name = 'Son3';
        stud3.Physics__c = 70;
        stud3.Tamil__c = 80;
        stud3.Chemistry__c = 90;
        stud3.English__c = 60;
        stud3.Mathematics__c = 50;
        
        Student__c stud4 = new Student__c();
        stud4.Age__c =21;
        stud4.Roll_Number__c = 4;
        stud4.Fathers_Name__c = 'Dady4';
        stud4.Name = 'Son4';
        stud4.Physics__c = 70;
        stud4.Tamil__c = 80;
        stud4.Chemistry__c = 90;
        stud4.English__c = 60;
        stud4.Mathematics__c = 50;
        
        studentsMap.put(1,stud1);
        studentsMap.put(2,stud2);
        studentsMap.put(3,stud3);
        studentsMap.put(4,stud4);
        
        System.debug('studentsMap==>'+studentsMap);
         AllotClass(studentsMap);
         printValues(studentsMap);
        return studentsMap;
    
        
    }
   
    
    public static void AllotClass(Map<Integer, Student__c> sMap) {
       
        
          map <String, Student__c> map1 = new map <String, Student__c>();
       map <String, Student__c> map2 = new map <String, Student__c>();
        
        for(Student__c stu : sMap.values()){
               
            if(stu.Age__c < 24.0){
                map1.put('Class X',stu);  
                System.debug('map1==>'+ map1);
            }
            else if(stu.Age__c > 24.0){
                map2.put('Class Y',stu);  
                System.debug('map2==>'+ map2);
            }
        }
       
        
        //All Students whose age is less than 24 should be allotted Class X
        //All Students whose age is more than 24 should be allotted Class Y
        
    }
    
    
    public static void printValues(Map<Integer, Student__c> sMap) {
        map <String, Decimal> map3 = new  map <String, Decimal>();
        
        for(Student__c stu1 : sMap.values()){
           Decimal Total;
            Total = stu1.Physics__c+ stu1.Tamil__c+ stu1.Chemistry__c+ stu1.English__c + stu1.Mathematics__c;
            map3.put(stu1.Name,Total);
            
        }
         System.debug('total Mark==>'+ map3);
    }
}



