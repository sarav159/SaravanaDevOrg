public class DeserialisationExample1 {
    
    /* Public static void exampleMethod(){
Http h = new Http();

HttpRequest req = new HttpRequest();
req.setMethod('GET');
req.setEndpoint('https://api.zippopotam.us/us/33162');

HttpResponse res = h.send(req);
System.debug('res :' + res);

Integer statusCode = res.getStatusCode();
System.debug('statusCode :' + statusCode);

String body = res.getBody();
System.debug('body :' + body);

details bc = (details) JSON.deserialize(body, details.class);
System.debug('BoreClass : ' + bc);

}        
public class details{
public string postcode;
public string country;
public string countryabbreviation;
public List<place> places;
}
public class place{
public string placename;
public string longitude;
public string state;
public string stateabbreviation;
public string latitude;
}
*/   
    Public static void exampleMethod2(){
        Http h = new Http();
        
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://api.coindesk.com/v1/bpi/currentprice.json');
        
        HttpResponse res = h.send(req);
        System.debug('res :' + res);
        
        Integer statusCode = res.getStatusCode();
        System.debug('statusCode :' + statusCode);
        
        String body = res.getBody();
        System.debug('body :' + body);
        
        details bc = (details) JSON.deserialize(body, details.class);
        System.debug('BoreClass : ' + bc);
        
        
    }  
    public class details{
       // public Times time;
        public Curren bpi;
    }
    
    public class Curren{
        Public dollar USD;
    }
    /*public class Times{
        public String updated;
        public String updatedISO;
        public String updateduk;
    } */ 
    public class dollar{
        public String code;
        public String symbol;
        public String rate;
         public String description;
         public Decimal rate_float;
    }  
    
}