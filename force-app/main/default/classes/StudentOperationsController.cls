public with sharing class StudentOperationsController {
    @AuraEnabled
    public static void addStudent(StudentWrapper student) {
        	StudentList__c stud = new 	StudentList__c() ;
        stud.Name = student.name;
        
        if(student.marksList != NULL) {
            for(Marks marks : student.marksList) {
                if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('English')) {
                    stud.English__c = marks.mark;
                }
                if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Maths')) {
                    stud.Maths__c = marks.mark;
                }
                 if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Tamil')) {
                    stud.Tamil__c = marks.mark;
                }
                 if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Science')) {
                    stud.Science__c = marks.mark;
                }
                 if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Social')) {
                    stud.Social__c = marks.mark;
                }
            }
        }
        insert stud;
    }
    private static StudentList__c getStudentFromWrapper(StudentWrapper wrapper ) {
        StudentList__c stud = new StudentList__c();
        stud.Name = wrapper.Name;
        System.debug('@@@@@ 34 @@@@@@@ '+wrapper);
        System.debug('@@@@@ 35 @@@@@@@ '+wrapper.marksList);
        
           if(wrapper.marksList != NULL){
            for (Marks marks : wrapper.marksList) {
                if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('English')) {
                    stud.English__c = marks.mark;
                }
                if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Maths')) {
                    stud.Maths__c = marks.mark;
                }
                 if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Tamil')) {
                    stud.Tamil__c = marks.mark;
                }
                 if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Science')) {
                    stud.Science__c = marks.mark;
                }
                 if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Social')) {
                    stud.Social__c = marks.mark;
                }
            }
    } 
        return stud;
    }
    @AuraEnabled
    public static void addStudents(List<StudentWrapper> studentWrappers) {
        List<StudentList__c> studentsList = new List<StudentList__c>();
        for(StudentWrapper wrapper : StudentWrappers) {
            studentsList.add(getStudentFromWrapper(wrapper));
        }
        insert studentsList;
    }
    
 @AuraEnabled
    public static void updateMarks(String Name, List<Marks> mar)
    {
        List<StudentList__c> stdUpd = new List<StudentList__c>();
        set<id> ids = new set<id>();
        if(!String.isBlank(Name))
        {
            StudentList__c st =  [select id, name from StudentList__c where name =: Name];
            {
                ids.add(st.id);  
            }
            
            StudentList__c studs = [select Id, name, Tamil__c, English__c, Maths__c, Social__c, Science__c from StudentList__c where Id in: ids];
            
            for(Marks marks : mar) {
                
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('English')) {
                       studs.English__c = marks.mark;
                   }
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('Maths')) {
                       studs.Maths__c = marks.mark;
                   }
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('Tamil')) {
                       studs.Tamil__c = marks.mark;
                   }
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('Science')) {
                       studs.Science__c = marks.mark;
                   }
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('Social Science')) {
                       studs.Social__c = marks.mark;
                   }
            }
            stdUpd.add(studs);
        }
        update stdUpd;
    }
    
   @AuraEnabled
    public static void deleteStudents(String Name)
    {
        List<StudentList__c> studDel = new List<StudentList__c>();
        set<id> ids = new set<id>();
        if(!String.isBlank(Name))
        {
            StudentList__c st = [select id, name from StudentList__c where name =: Name];
            
                ids.add(st.id);  
            
            StudentList__c studs = [select id, name, Tamil__c, English__c, Maths__c, Social__c, Science__c  from StudentList__c where id in: ids limit 1];
            
            
            studDel.add(studs);
        }
        delete studDel;
    }
    
     @AuraEnabled
     public static void deleteMarksForStudent(String name) {
         
        List<StudentList__c> stu = [select id, name, Tamil__c, English__c, Maths__c, Social__c, Science__c  from StudentList__c];
         for(StudentList__c stud : stu){
             
         }
    }

      public Class Marks{
        public String subject{get;set;}
        public Integer mark {get;set;}
        public Marks(string sub, Integer mrk) {
            this.subject = sub;
            this.mark = mrk;
        }
    }
    public Class StudentWrapper {
        @AuraEnabled
        public String name {get;set;}
        @AuraEnabled
        public List<Marks> marksList {get;set;}

        public StudentWrapper(String nameParam, List<Marks> marksListParam) {
            this.name = nameParam;
             this.marksList = marksListParam;
            if(marksList == NULL) {
                marksList = new List<Marks>();
            }
            else {
                this.marksList = marksListParam;
            }
        }
     }

}