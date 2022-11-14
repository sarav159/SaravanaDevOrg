public class CreateContatsViaAPIMock  implements  HttpCalloutMock {
    
    public HTTPResponse respond(HTTPRequest req) {
        HttpResponse resp = new HttpResponse();
        resp.setStatus('ok');
        resp.setStatusCode(200);
        resp.setBody('{"results":[{"gender":"male","name":{"title":"Mr","first":"Maxime","last":"Chow"},"location":{"street":{"number":461,"name":"King St"},"city":"Dorchester","state":"Ontario","country":"Canada","postcode":"P5J 1P9","coordinates":{"latitude":"-69.7117","longitude":"-53.3992"},"timezone":{"offset":"+9:30","description":"Adelaide, Darwin"}},"email":"maxime.chow@example.com","login":{"uuid":"a3e084ab-3387-4b8f-b612-79f0a0a1f14e","username":"bigcat494","password":"hardball","salt":"mlFDSF0T","md5":"ef2024b87f346df4d15309f086a3cdf6","sha1":"87bbd26ff00b338539d900e69ad70ed6e53475d3","sha256":"e8d3ef879165647839813e099897467b0a3650c461b604c052db66b4d6bc15d3"},"dob":{"date":"1978-08-03T19:54:04.487Z","age":44},"registered":{"date":"2021-06-19T09:28:17.516Z","age":1},"phone":"Q06 B90-2905","cell":"U05 X43-4856","id":{"name":"SIN","value":"624653143"},"picture":{"large":"https://randomuser.me/api/portraits/men/3.jpg","medium":"https://randomuser.me/api/portraits/med/men/3.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/men/3.jpg"},"nat":"CA"}],"info":{"seed":"24ef552409eb6480","results":1,"page":1,"version":"1.4"}}');
        
        return resp;
    }
}