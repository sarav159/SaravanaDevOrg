public with sharing class CynoParent {
    public CynoName nameDetails {set;get;}
    public String gender{set;get;}
    public String parentType{set;get;}
    public Decimal yearSalary{set;get;}
    public String occupation{set;get;}
    public Boolean noJob{set;get;}
    public CynoParent(CynoName cnName, String gend, String parentType, Decimal yGSal, String occ ) {
        this.nameDetails = cnName;
        this.gender = gend;
        this.parentType = parentType;
        this.yearSalary = yGSal;
        this.occupation = occ;
        if(this.occupation == NULL) {
            this.noJob = true;
        }
    }
}