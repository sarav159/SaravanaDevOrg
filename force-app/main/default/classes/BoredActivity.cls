public class BoredActivity {
    
    Public static void boredMethod(){
        Http h = new Http();
        
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://www.boredapi.com/api/activity');
        
        HttpResponse res = h.send(req);
        List<string> headers = res.getHeaderKeys();
       // res.getHeaderKeys();
        for(String hh : headers){
            System.debug('header :'+ hh);
            System.debug('header value :'+ res.getHeader(hh));
        }
        
        System.debug('res :' + res);
        
        Integer statusCode = res.getStatusCode();
        System.debug('statusCode :' + statusCode);
        
        String body = res.getBody();
        System.debug('body :' + body);
        
        BoreClass bc = (BoreClass) JSON.deserialize(body, BoreClass.class);
        System.debug('BoreClass : ' + bc);
        
        storeBoredActivity(bc.activity,bc.type,bc.participants,bc.price,bc.link,bc.key,bc.accessibility );
    }
    
    
    Public static void storeBoredActivity(String activity,string type,Decimal participants,Decimal price,String link,String key,Decimal accessibility ){
        Bored__c bor = new Bored__c();
        bor.Name = activity;
        bor.Type__c = type;
        bor.Participants__c = participants;
        bor.Price__c = price;
        bor.Link__c = link;
        bor.Key__c = key;
        bor.Accessibility__c = accessibility;
        
        insert bor;
    }
    public class BoreClass{
        public String activity;
        public string type;
        public Decimal participants;
        public Decimal price;
        public String link;
        public String key;
        public  Decimal accessibility;  
    }     
    
    
    
    
}