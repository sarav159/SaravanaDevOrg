@RESTResource(urlMapping ='/accountRegistration/')
global class RestWebServicesTest {
    
    @httpGet
    global static List<Account> getAccountRequest() {
        List<Account> accList = [SELECT Id,Name FROM Account WHERE CreatedDate >= LAST_N_DAYS:30];
        
        return accList;
    }
    @httpPost
    global static Account postAccountRequest(String name, string rating) {
        Account acc = new Account();
        acc.Name = name;
        acc.Rating = rating;
        
        insert acc;
        return acc;
    }
}