public class CreateMultipleContactsViaAPI {
    
    Public static void createListOfContacts(){
        
        List<Contact> contactList = new List<Contact>();
        for(integer i=0; i<10;i++){
            
            Http h = new Http();
            
            HttpRequest req = new HttpRequest();
            req.setMethod('GET');
            req.setEndpoint('https://randomuser.me/api/');
            
            HttpResponse res = h.send(req);
            System.debug('res :' + res);
            
            Integer statusCode = res.getStatusCode();
            System.debug('statusCode :' + statusCode);
            
            String body = res.getBody();
            System.debug('body :' + body);
            
            details resu = (details) JSON.deserialize(body,details.class);
            System.debug('Contactsrecord :'+ resu);
           
            
            for(PersonalDetails a :resu.results ){
                Contact con = new Contact();
                con.Gender__c = a.gender;
                con.FirstName = a.name.first;
                con.LastName = a.name.last;
                con.Title = a.name.title;
                con.Phone = a.phone;
                con.MailingCity =a.location.city;
                con.MailingState =a.location.state;
                con.MailingCountry = a.location.country;
                con.MailingPostalCode = a.location.postcode;
                contactList.add(con);
            }
            
        }
        insert contactList;
        System.debug('contactList'+contactList);
    }
    
    public class details{
        public List<PersonalDetails> results;
    }
    
    public class PersonalDetails{
        public String gender;
        public  Names name;
        public Location location;
        public String phone;
    }
    public class Names{
        public String title;
        public String first;
        public String last;
    }
    public class Location{
        public String city;
        public String state;
        public String country;
        public String postcode;
    } 
    
}