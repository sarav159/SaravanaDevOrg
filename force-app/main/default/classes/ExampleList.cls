public class ExampleList {
    public void method(){
        List<String> StrList = new List<String>();
         List<String> StrList2 = new List<String>();
        Boolean res;
        StrList.add('India');
        StrList.add('USA');
        StrList.add('UK');
        
        res =StrList.contains('India');
        System.debug('result='+ res);
      /*StrList2.add('Australia');
        StrList2.addAll(StrList);
        System.debug('StrList ='+StrList);
                System.debug('StrList2 ='+StrList2);*/
    }
    
}