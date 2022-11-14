@RESTResource(urlmapping='/CreateLead/')
global class CreateMyAPI {
    @HTTPPost
    global static  string method()
    {
        string fname,lname,comp;
        string fieldname,fieldvalue;
        RestRequest requ = RestContext.request;
        RestResponse resp = RestContext.response;
     String jsonbody = requ.requestBody.tostring();
        JSONparser parser = JSON.createParser(jsonbody);
        while(parser.nextToken()!=NULL)
        {
            if(parser.nextToken()!= JSONToken.END_OBJECT)
            {
               fieldname = parser.getCurrentName();
               fieldvalue =parser.getText();
                if(fieldname == 'FirstName'){
                    fname =fieldvalue;
                }
               else if(fieldname == 'LastName'){
                    lname =fieldvalue;
                }
                if(fieldname == 'CompanyName'){
                    comp =fieldvalue;
                }
            }
        }
        Lead Le = new Lead(firstname = fname,Lastname = lname,company = comp);
        insert Le;
        return Le.ID;
    }
}