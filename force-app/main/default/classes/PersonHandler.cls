public class PersonHandler {

    public List<person> personList{get;set;}
    public PersonHandler() {
        this.personList = new List<person>(); 
    }
    public  void add(person per){
       this.personList.add(per);
    }
}