@IsTest
private class CynoStudentAdmissionHandlerListTest {

    testMethod static void testGetListOfStudsWhoseMothersSalMoreThanFathersSal() {
        CynoStudentAdmissionHandlerList handler = new CynoStudentAdmissionHandlerList();
  
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();
  
        CynoParent stud1Father = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),'Male','Father', 60000,'Doctor');
        CynoParent stud1Mother = new CynoParent(new CynoName('ishu', 'k','h'),'female','mother', 80000,'lawyer');
        CynoParent stud2Mother = new CynoParent(new CynoName('surya', 'Jerry','shershaw'),'Male','Father', 30000,'Doctor');
        CynoParent stud2Father = new CynoParent(new CynoName('jack', 's','j'),'Male','Father', 60000,'Doctor');
  
                student1.mother = stud1Mother;
                student2.mother = stud2Mother;
          
                student1.father = stud1Father;
                student2.father = stud2Father;
          
                handler.addStudent(student1);
                handler.addStudent(student2);
          
                List<CynoStudent> result = handler.getListOfStudsWhoseMothersSalMoreThanFathersSal();
          
                System.assertEquals(1, result.size());
      }
      testMethod static void testGetListOfStudsWhoseFatherssSalMoreThanMothersSal() {
        CynoStudentAdmissionHandlerList handler = new CynoStudentAdmissionHandlerList();
  
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();

        CynoParent stud1Father = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),'Male','Father', 60000,'Doctor');
        CynoParent stud1Mother = new CynoParent(new CynoName('ishu', 'k','h'),'female','mother', 80000,'lawyer');
        CynoParent stud2Mother = new CynoParent(new CynoName('surya', 'Jerry','shershaw'),'Male','Father', 30000,'Doctor');
        CynoParent stud2Father = new CynoParent(new CynoName('jack', 's','j'),'Male','Father', 60000,'Doctor');
        
                student1.mother = stud1Mother;
                student2.mother = stud2Mother;
          
                student1.father = stud1Father;
                student2.father = stud2Father;
          
                handler.addStudent(student1);
                handler.addStudent(student2);
          
                List<CynoStudent> result = handler.getListOfStudsWhoseFatherssSalMoreThanMothersSal();
          
                System.assertEquals(1, result.size());
      }
      testMethod static void testgetListOfStudsWhoseFathersIsUnemployed() {
        CynoStudentAdmissionHandlerList handler = new CynoStudentAdmissionHandlerList();
  
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();

        CynoParent stud1Father = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),'Male','Father', 60000,'');
        CynoParent stud2Father = new CynoParent(new CynoName('saraav', 's','j'),'Male','Father', 60000,'Doctor');
        
               student1.father = stud1Father;
                student2.father = stud2Father;
          
                handler.addStudent(student1);
                handler.addStudent(student2);
          
                List<CynoStudent> result = handler.getListOfStudsWhoseFathersIsUnemployed();
          
                System.assertEquals(1, result.size());
      }
      testMethod static void testgetListOfStudsWhoseMotherIsUnemployed() {
        CynoStudentAdmissionHandlerList handler = new CynoStudentAdmissionHandlerList();
  
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();

        CynoParent stud1Mother = new CynoParent(new CynoName('ishu', 'k','h'),'female','mother', 80000,'lawyer');
        CynoParent stud2Mother = new CynoParent(new CynoName('surya', 'Jerry','shershaw'),'Male','Father', 30000,'');
 
               student1.mother = stud1Mother;
                student2.mother = stud2Mother;
          
                handler.addStudent(student1);
                handler.addStudent(student2);
          
                List<CynoStudent> result = handler.getListOfStudsWhoseMotherIsUnemployed();
          
                System.assertEquals(1, result.size());
      }
      testMethod static void testgetListOfStudsWhoseParentsAreUnemployed() {
        CynoStudentAdmissionHandlerList handler = new CynoStudentAdmissionHandlerList();
  
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();
  
        CynoParent stud1Father = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),'Male','Father', 60000,'');
        CynoParent stud1Mother = new CynoParent(new CynoName('ishu', 'k','h'),'female','mother', 0,'lawyer');
        CynoParent stud2Mother = new CynoParent(new CynoName('surya', 'Jerry','shershaw'),'Male','Father', 0,'');
        CynoParent stud2Father = new CynoParent(new CynoName('jack', 's','j'),'Male','Father', 60000,'Doctor');
  
                student1.mother = stud1Mother;
                student2.mother = stud2Mother;
          
                student1.father = stud1Father;
                student2.father = stud2Father;
          
                handler.addStudent(student1);
                handler.addStudent(student2);
          
                List<CynoStudent> result = handler.getListOfStudsWhoseParentsAreUnemployed();
          
                System.assertEquals(1, result.size());
      }
      testMethod static void testgetListOfStudsWhoseParentsAreemployed() {
        CynoStudentAdmissionHandlerList handler = new CynoStudentAdmissionHandlerList();
  
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();
  
        CynoParent stud1Father = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),'Male','Father', 60000,'engineer');
        CynoParent stud1Mother = new CynoParent(new CynoName('ishu', 'k','h'),'female','mother', 12200,'lawyer');
        CynoParent stud2Mother = new CynoParent(new CynoName('surya', 'Jerry','shershaw'),'Male','Father', 40000,'engineer');
        CynoParent stud2Father = new CynoParent(new CynoName('jack', 's','j'),'Male','Father', 60000,'Doctor');
  
                student1.mother = stud1Mother;
                student2.mother = stud2Mother;
          
                student1.father = stud1Father;
                student2.father = stud2Father;
          
                handler.addStudent(student1);
                handler.addStudent(student2);
          
                List<CynoStudent> result = handler.getListOfStudsWhoseParentsAreemployed();
          
                System.assertEquals(2, result.size());
      }
      testMethod static void testgetListOfStudsIfAnyOfParentsAreUnemployed() {
        CynoStudentAdmissionHandlerList handler = new CynoStudentAdmissionHandlerList();
  
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();
  
        CynoParent stud1Father = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),'Male','Father', 0,'');
        CynoParent stud1Mother = new CynoParent(new CynoName('ishu', 'k','h'),'female','mother', 12200,'lawyer');
        CynoParent stud2Mother = new CynoParent(new CynoName('surya', 'Jerry','shershaw'),'Male','Father', 0,'');
        CynoParent stud2Father = new CynoParent(new CynoName('jack', 's','j'),'Male','Father', 60000,'Doctor');
  
                student1.mother = stud1Mother;
                student2.mother = stud2Mother;
          
                student1.father = stud1Father;
                student2.father = stud2Father;
          
                handler.addStudent(student1);
                handler.addStudent(student2);
          
                List<CynoStudent> result = handler.getListOfStudsIfAnyOfParentsAreUnemployed();
          
                System.assertEquals(2, result.size());
      }
      testMethod static void testgetAddressOfBothCurrentAndPermenantAddressDifferent() {
        CynoStudentAdmissionHandler handler = new CynoStudentAdmissionHandler();
  
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();
  
        CynoAddress stud1CurrentAddress=new CynoAddress('karungal','colachel','nagercoil','629178','TN','India');
        CynoAddress stud1PermenantAddress=new CynoAddress('karungal','marthandam','nagercoil','629178','TN','India');
        CynoAddress stud2CurrentAddress=new CynoAddress('karungal','marthandam','nagercoil','629178','TN','India');
        CynoAddress stud2PermenantAddress=new CynoAddress('karungal','thuckalay','nagercoil','629178','TN','India');
  
        student1.currentAddress = stud1CurrentAddress;
        student2.currentAddress = stud2CurrentAddress;
  
        student1.permanentAddress = stud1PermenantAddress;
        student2.permanentAddress = stud2PermenantAddress;
  
        handler.addStudent(student1);
        handler.addStudent(student2);
  
        List<CynoStudent> result = handler.getAddressOfBothCurrentAndPermenantAddressDifferent();
  
        System.assertEquals(2, result.size(),'msg');
    
    }
    testMethod static void testgetAddressOfBothCurrentAndPermenantAddressSame() {
        CynoStudentAdmissionHandler handler = new CynoStudentAdmissionHandler();
  
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();
  
        CynoAddress stud1CurrentAddress=new CynoAddress('karungal','marthandam','nagercoil','629178','TN','India');
        CynoAddress stud1PermenantAddress=new CynoAddress('karungal','marthandam','nagercoil','629178','TN','India');
        CynoAddress stud2CurrentAddress=new CynoAddress('karungal','marthandam','nagercoil','629178','TN','India');
        CynoAddress stud2PermenantAddress=new CynoAddress('karungal','marthandam','nagercoil','629178','TN','India');
  
       student1.currentAddress = stud1CurrentAddress;
        student2.currentAddress = stud2CurrentAddress;
  
        student1.permanentAddress = stud1PermenantAddress;
        student2.permanentAddress = stud2PermenantAddress;
  
        handler.addStudent(student1);
        handler.addStudent(student2);
   List<CynoStudent> result = handler.getAddressOfBothCurrentAndPermenantAddressSame();
       System.assertEquals(2, result.size(),'msg');
  
    }
}