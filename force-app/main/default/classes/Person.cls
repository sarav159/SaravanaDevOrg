public class person{  
    public String firstname{get;set;}
    public String  lastname{get;set;}
    public  String district{get;set;}
    public String  state{get;set;}
    public person(String fname,String lname,String dis,String sta){
        this.firstname = fname;
        this.lastname = lname;
            this.district = dis;
            this.state = sta;
    }
}