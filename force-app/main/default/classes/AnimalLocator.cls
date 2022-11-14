public class AnimalLocator {
    
    public static String getAnimalNameById(Integer x) {
        
        Http h = new Http();
        
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+ x);
        
        HttpResponse res = h.send(req);
        System.debug('res :' + res);
        
        Integer statusCode = res.getStatusCode();
        System.debug('statusCode :' + statusCode);
        
        String body = res.getBody();
        System.debug('body :' + body);
        
        details result = (details) JSON.deserialize(body,details.class);
        System.debug('Contactsrecord :'+ result);
        
        
        String Finalresult;
        Finalresult = result.animal.name;
        system.debug('result'+Finalresult);
        return Finalresult;
        
        
        
    }
    public class details{
        public Animal animal;
    }
    public class Animal{
        public Integer id;
        public String name;
        public String eats;
        public String says;
        
    }
    
}