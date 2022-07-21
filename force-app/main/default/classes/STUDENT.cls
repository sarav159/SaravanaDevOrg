public with sharing class STUDENT {
public Student__c  newStudentObject {get;set;}
public Parents__c  motherRecord {get;set;}
public Parents__c  fatherRecord {get;set;}
public Decimal motherAdhaarNumber {get;set;}
public Decimal fatherAdhaarNumber {get;set;}
public String motherOccupation {get;set;}
public String fatherOccupation {get;set;}
public Boolean bothParentsAdharNumbersWrong {get;set;}
public Boolean motherInformationMissing {get;set;}
public Boolean fatherInformationMissing {get;set;}
public Boolean discountNotValid {get;set;}
public Boolean mandatoryField{get;set;}
public Boolean mandatoryFieldWrong{get;set;}

public String studentName{get;set;}



public STUDENT(ApexPages.StandardController controller) {
    initVariables();
    newStudentObject.Name = '';
    newStudentObject.Email__c = '';
    
    }

private void initVariables() {
    bothParentsAdharNumbersWrong = false;
    motherInformationMissing = false;
    fatherInformationMissing = false;
    mandatoryField=false;
    discountNotValid = false;
    mandatoryFieldWrong = false;
    newStudentObject = new Student__c();

    studentName =newStudentObject.Name;


    
}

private void resetValues(){
    bothParentsAdharNumbersWrong = false;
    motherInformationMissing = false;
    fatherInformationMissing = false;
    mandatoryField=false;
    discountNotValid = false;
    motherRecord = Null;
    fatherRecord = Null;
    
}


public PageReference save() {
    resetValues();
    try {
        Boolean isDataValid = isDataValidForDiscount(); //false
        System.debug('Parent Adhaar Error value'+bothParentsAdharNumbersWrong);
        
            
            if(bothParentsAdharNumbersWrong) {
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,  'Adhaar Info of Parents not matching @'+ newStudentObject.Name ));  
        
            }
            if(motherInformationMissing) {
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'mother information Missing or MotherAadhar Information not matching with parent records '+ newStudentObject.Name ));  
            }
            if(fatherInformationMissing) {
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'father information missing or FatherAadhar Information not matching with parent records '+ newStudentObject.Name ));  
            }
            if(mandatoryField){
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Mandatory fields value missing '));
            }
            if(mandatoryFieldWrong){
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Mandatory fields invalid '));
            }
            if(discountNotValid){
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Sorry '+newStudentObject.Name + ', we cannot provide you '+ newStudentObject.Discount_Requested__c + '% discount'));
            }
            if(isDataValid) {
            insert newStudentObject;
            return new PageReference('https://cynosurequest-dev-ed.lightning.force.com/lightning/o/Student__c/list?filterName=Recent'); //..this should return to the list page ... @Jasir to action 
            }
            else{
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Sorry We cant provide you '+ newStudentObject.Discount_Requested__c + '% discount'));
            }
    }
    catch(Exception e) {
        System.debug('The Exception is at Stack Trace'+e.getStackTraceString());
        System.debug('The Exception is at Line Number'+e.getLineNumber());
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, e.getMessage(), 'Error Saving the Record @Jasir...please check'));  
    }
        
    return null;
}


public PageReference reset() {
    resetValues();
    PageReference pg = new PageReference(System.currentPageReference().getURL());
    pg.setRedirect(false);
    return pg;
}


private Boolean isDataValidForDiscount() {
    motherAdhaarNumber = newStudentObject.Mothers_Aadhar_Number__c;
    fatherAdhaarNumber = newStudentObject.Fathers_Aadhar_number__c;

    System.debug('motherAdhaarNumber --> '+motherAdhaarNumber);
    System.debug('fatherAdhaarNumber --> '+fatherAdhaarNumber);
    

    List<Parents__c > parentRecords = [select Id , 
                                            Aadhar_Number__c, 
                                            Name, 
                                            Age__c, 
                                            Parentship__c, 
                                            Salary__c,
                                            Job_Sector__c
                                    from Parents__c 
                                    where Aadhar_Number__c 
                                    IN (:motherAdhaarNumber, :fatherAdhaarNumber)];
    
    System.debug('Parent Records  --> '+parentRecords);
    if (newStudentObject.Aadhar_Number__c==null)
    {
        mandatoryField =true;
        return false;
    }
    if (newStudentObject.Branch__c==null)
    {
        mandatoryField =true;
        return false;
    }   
if (newStudentObject.Email__c == ''|| newStudentObject.Email__c==null )
    {
        mandatoryField = true;
        return false;
    }

if (newStudentObject.Name == '' || newStudentObject.Name==null)
    {
        mandatoryField = true;
        return false;
    }
    if(parentRecords.size() == 0) {
        bothParentsAdharNumbersWrong = true;
        return false;
    }
    for(Parents__c parent : parentRecords) {
        if(parent.Parentship__c.equalsIgnoreCase('Father')) {
            this.fatherRecord = parent;
        }
        if(parent.Parentship__c.equalsIgnoreCase('Mother')) {
            this.motherRecord = parent;
        }
    }
    System.debug('this.fatherRecord --> '+this.fatherRecord);
    System.debug('this.motherRecord --> '+this.motherRecord);
    
   
    
        if(fatherRecord==Null){
            fatherInformationMissing = true;
            return false;
        }
        if(motherRecord==Null){
            motherInformationMissing = true;
            return false;
        }
        if (newStudentObject.Discount_Requested__c==null)
        {
            mandatoryField = true;
            return false;
        }
        if(newStudentObject.Name == '0'||newStudentObject.Aadhar_number__c == 0) {
        mandatoryFieldWrong = true;
        return false;
    }
    
        
    this.fatherOccupation = fatherRecord.Job_Sector__c;
    this.motherOccupation = motherRecord.Job_Sector__c;
    //Condition 1 - If Father Job is Govt, Mother Job is Govt what is maximum Discount = 5%
    System.debug('this.fatherOccupation --> '+this.fatherOccupation);
    System.debug('this.motherOccupation --> '+this.motherOccupation);
    System.debug('this.newStudentObject --> '+this.newStudentObject);
    System.debug('this.newStudentObject.Discount_Requested_c --> '+this.newStudentObject.Discount_Requested__c);
    
    if(this.fatherOccupation.equalsIgnoreCase('Government') && 
        this.motherOccupation.equalsIgnoreCase('Government') &&
        this.newStudentObject.Discount_Requested__c <= 5)  {
            return true;
        }
    if(this.fatherOccupation.equalsIgnoreCase('Private') &&
        this.motherOccupation.equalsIgnoreCase('Private') &&
        this.newStudentObject.Discount_Requested__c <= 30)  {
            return true;
        }
        if(this.fatherOccupation.equalsIgnoreCase('UnEmployed') &&
        this.motherOccupation.equalsIgnoreCase('UnEmployed') &&
        this.newStudentObject.Discount_Requested__c <= 80)  {
            return true;
        }
        if(this.fatherOccupation.equalsIgnoreCase('Government') &&
        this.motherOccupation.equalsIgnoreCase('Private') &&
        this.newStudentObject.Discount_Requested__c <= 10)  {
            return true;
        }
        if(this.fatherOccupation.equalsIgnoreCase('Private') &&
        this.motherOccupation.equalsIgnoreCase('Government') &&
        this.newStudentObject.Discount_Requested__c <= 10)  {
            return true;
        }
        if(this.fatherOccupation.equalsIgnoreCase('UnEmployed') &&
        this.motherOccupation.equalsIgnoreCase('Government') &&
        this.newStudentObject.Discount_Requested__c <= 10)  {
            return true;
        }
        if(this.fatherOccupation.equalsIgnoreCase('Government') &&
        this.motherOccupation.equalsIgnoreCase('UnEmployed') &&
        this.newStudentObject.Discount_Requested__c <= 10)  {
            return true;
        }
        
        if ((this.fatherOccupation.equalsIgnoreCase('Private') ||
                this.motherOccupation.equalsIgnoreCase('UnEmployed')) &&
                this.newStudentObject.Discount_Requested__c <= 0) {
            return true;
        }
    
    return false;
}
}
