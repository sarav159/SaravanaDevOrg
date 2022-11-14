public with sharing class CynoStudentAdmissionHandlerList {
    public List<CynoStudent> studentsList{get;set;}
   

    public CynoStudentAdmissionHandlerList(){

        this.studentsList = new List<CynoStudent>();
      
    }
    public void addStudent(CynoStudent student) {

        this.studentsList.add(student);
        
      }
    public List<CynoStudent> getListOfStudsWhoseMothersSalMoreThanFathersSal() {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentsList) {
            
            CynoParent mother = student.mother;
            CynoParent father = student.father;
            CynoParent highestParentInSal = CynosureGenericUtility.getRecordWithMoreSalary(mother, father);
            if(highestParentInSal ==  mother) {
                studentsList.add(student);
            }
        }
        return studentsList;
    }
    public List<CynoStudent> getListOfStudsWhoseFatherssSalMoreThanMothersSal(){
        List<CynoStudent> studentsList = new  List<CynoStudent>();
        for(CynoStudent student : this.studentsList){
            CynoParent mother = student.mother;
            CynoParent father = student.father;
            cynoparent highSalary = CynosureGenericUtility.getRecordWithMoreSalary(mother,father);
            if(highSalary == father){
                studentsList.add(student);
            }
        
        }
        return studentsList;
    }
    public List<CynoStudent> getListOfStudsWhoseFathersIsUnemployed(){
        List<CynoStudent> studentsList = new  List<CynoStudent>();
        for(CynoStudent student : this.studentsList){
         
            CynoParent father = student.father;
            
            if(father.occupation == ''){
                studentsList.add(student);
            }
        
        }
        return studentsList;
    }
    public List<CynoStudent> getListOfStudsWhoseMotherIsUnemployed(){
        List<CynoStudent> studentsList = new  List<CynoStudent>();
        for(CynoStudent student : this.studentsList){
         
            CynoParent mother = student.mother;
            
            if(mother.occupation == ''){
                studentsList.add(student);
            }
        
        }
        return studentsList;
    }
    public List<CynoStudent> getListOfStudsWhoseParentsAreUnemployed() {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentsList) {
            
            CynoParent mother = student.mother;
            CynoParent father = student.father;
           
            if(father.occupation == '' && mother.occupation =='') {
                studentsList.add(student);
            }
        }
        return studentsList;
    }
    public List<CynoStudent> getListOfStudsWhoseParentsAreemployed() {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentsList) {
            
            CynoParent mother = student.mother;
            CynoParent father = student.father;
           
            if(father.occupation != '' && mother.occupation !='') {
                studentsList.add(student);
            }
        }
        return studentsList;
    }
    public List<CynoStudent> getListOfStudsIfAnyOfParentsAreUnemployed() {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentsList) {
            
            CynoParent mother = student.mother;
            CynoParent father = student.father;
           
            if(father.occupation == '' || mother.occupation =='') {
                studentsList.add(student);
            }
        }
        return studentsList;
    }
    public List<CynoStudent> getAddressOfBothCurrentAndPermenantAddressDifferent() 
    {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentsList) {
            CynoAddress currAdd = student.currentAddress;
            CynoAddress perAdd = student.permanentAddress;
            
            CynoAddress different = CynosureGenericUtility.getDifferentAddress(currAdd, perAdd);
         
            if(different != null){
                studentsList.add(student);  
            }
             
        }
        return studentsList;
}
public List<CynoStudent> getAddressOfBothCurrentAndPermenantAddressSame() 
    {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentsList) {
            CynoAddress currAdd = student.currentAddress;
            CynoAddress perAdd = student.permanentAddress;
         
            CynoAddress Unique = CynosureGenericUtility.getSameAddress(currAdd, perAdd);
         
            if(Unique != null){
                studentsList.add(student);  
            }
             
        }
        return studentsList;
}
}