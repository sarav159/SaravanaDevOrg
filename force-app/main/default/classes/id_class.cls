public class id_class {

    public Id testId {get;set;}

    public id_class(ApexPages.standardController con){
        testId = con.getId();
    }
}