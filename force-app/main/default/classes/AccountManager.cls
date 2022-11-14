@RestResource(urlMapping='/Accounts/*')
global class AccountManager {
    
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        
        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        
        Account result =  [SELECT Id,Name,(Select Id,Name FROM Contacts) FROM Account WHERE Id =:accountId];
        
        return result;
    }
}