public class UpdateContactGenderAPI {
    
    @future(callout=true)
    public static void findAndSaveGenderForSingleContact(Id contactId){
        // 1. Fetch the name
        Contact con = [SELECT Id, FirstName, Gender__c FROM Contact WHERE Id = :contactId LIMIT 1];
        
        // 2. Invoke the api for fetching the gender
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://api.genderize.io/?name=' + con.FirstName);
        
        HttpResponse resp = h.send(req);
        Gender gen = (Gender) JSON.deserialize(resp.getBody(), Gender.class);
        
        // 3. Save the gender on the contact
        con.Gender__c = gen.gender;
        update con;
    }
    
    @future(callout=true)
    public static void findAndSaveGenderForMultipleContacts(List<Id> contactIds){
        // 1. Fetch the name
        List<Contact> contacts = [SELECT Id, FirstName, Gender__c FROM Contact WHERE Id IN :contactIds];
        Map<String, String> firstNameToGenderMap = new Map<String, String>();
        
        for(Contact loopContactVariable : contacts) {
            if(firstNameToGenderMap.containsKey(loopContactVariable.FirstName)) {
                loopContactVariable.Gender__c = firstNameToGenderMap.get(loopContactVariable.FirstName);
            } else {
                // 2. Invoke the api for fetching the gender
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setEndpoint('https://api.genderize.io/?name=' + loopContactVariable.FirstName);
                
                HttpResponse resp = h.send(req);
                Gender gen = (Gender) JSON.deserialize(resp.getBody(), Gender.class);
                
                // 3. Save the gender on the contact
                loopContactVariable.Gender__c = gen.gender;
                firstNameToGenderMap.put(loopContactVariable.FirstName, gen.gender);
            }
        }
        
        // 4. DML statement as a single DML instead of being in for loop
        System.debug('final update :' + contacts);
        update contacts;
    }
    public class Gender{
        public String gender;
    }
    
    /*  @future(callout = true)
public static void updateContact(List<Id> contactIds){

List<Contact> contactList = [SELECT ID, FirstName,LastName,Gender__c FROM Contact WHERE Id In :contactIds];

Map<String,Contact> conMap = new Map<String,Contact>();  
List<Contact> conList = new List<Contact>();
String gender;
Map<String,String> fNameGenderMap = new Map<String,String>();

for(Contact conVar : contactList){
conMap.put(conVar.FirstName,conVar);
}
for(String str : conMap.KeySet()){
Http h = new Http();

HttpRequest req = new HttpRequest();
req.setEndpoint('https://api.genderize.io/?name='+str);
req.setMethod('GET');

HttpResponse res = h.send(req);
System.debug('response :' + res);

String body = res.getBody();
System.debug('body :' + body);


Details cont = (Details) JSON.deserialize(body, Details.class);
System.debug('ContactClass : ' + cont);
gender = cont.gender;
//System.debug('gender : '+ gender);
fNameGenderMap.put(str,gender);
}

for(Contact cons : contactList){
cons.Gender__c = fNameGenderMap.get(cons.FirstName);
conList.add(cons);
}

update conList;
System.debug('conList :'+conList);

}


public class Details{
public String gender;
}*/
    @future(callout=true)
    public static void updateContactWithCountryCode(List<Id> contactIds){
        
        List<Contact> contactList = [SELECT Id, FirstName,Country_Code__c FROM Contact WHERE Id IN :contactIds];
        Map<String,String> countryMap = new Map <String,String>();
        
        for(Contact con : contactList){
            if(countryMap.containsKey(con.FirstName)){
                con.Country_Code__c = countryMap.get(con.FirstName);
            }else{
                
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setEndpoint('https://api.nationalize.io/?name=' + con.FirstName);
                
                HttpResponse res = h.send(req);
                System.debug('response :' + res);
                
                String body = res.getBody();
                System.debug('body :' + body);
                
                countrycode cont = (countrycode) JSON.deserialize(body,countrycode.class);
                System.debug('Contactrecord :'+ cont);
                
                
                Decimal maxValue;
                String countryId;
                
                for(Country co : cont.country){
                    System.debug('seperated records:' +co);
                    if( maxValue == Null){
                        maxValue =  co.probability;
                        countryId = co.country_id;
                    }else if(maxValue < co.probability) {
                        maxValue =  co.probability;
                        countryId = co.country_id;
                    }
                }
                con.Country_Code__c = countryId;
                countryMap.put(con.FirstName,countryId);
            }
        }
        update contactList;
        system.debug('updated contact :'+contactList);
        
        
    }
    
    Public class countrycode{
        public List<Country> country;
        public String name;
    }
    public class Country{
        public String country_id;
        public Decimal probability;
    }
}