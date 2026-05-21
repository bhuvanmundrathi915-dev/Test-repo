public class RestCall {
    public static boolean isExecuting=true;
    
  @InvocableMethod(label='Get Contact Names' description='Returns the list of account' category='Account')
  public static void getAccount(List<ID> ids) 
  {
      makeit(ids);
      /* 
      if(system.isFuture() || system.isQueueable() || system.isBatch())
                           {
                               return ;
                           }
                    list<Contact> cons=new list<Contact>();
                       for(Id  idd : ids)
                       {
                      cons.add(new Contact(LastName = 'Raj....',Id = idd));                           
                       }
                       makeCalloutQuable makequable=new makeCalloutQuable(cons);
                                          System.enqueueJob(makequable);
                       system.debug('Contact size......Flow @@@@@@@@@2...'+ids.size()+'     '+system.Limits.getFutureCalls()+'    '+system.Limits.getQueueableJobs());

          /*
                         set<Id> setcontacts=new set<Id>();
                         for(Id cc : ids)
                           {
                                 if(!setcontacts.contains(cc))
                                 {
                                   setcontacts.add(cc);
                                     
                                 }
                                if(setcontacts.size()==100)
                                {
                                        testdata(setcontacts);
                   system.debug('Contact size...INVOKABLE @@@@@@@@@@2......'+ ids.size() +'    ' +system.Limits.getFutureCalls()+'    '+system.Limits.getQueueableJobs());
                                         setcontacts.clear();

                                }
                           }
             */
      
  }
    
   @future(callout=true)
    public static void testdata(set<Id> accountList)
    {
list<Contact> cons=new list<Contact>();
for(Integer i=1;i<=6000;i++)
{
    Contact cc=new Contact();
    cc.LastName='DELLA '+i;
    cons.add(cc);     
}
insert cons;

        list<Contact> cons2=new list<Contact>();

for(Integer i=1;i<=6000;i++)
{
    Contact cc=new Contact();
    cc.LastName='DELLA '+i;
    cons2.add(cc);     
}
insert cons2;


        
        
           Integer counter=1;
         list<Contact> updatelist=new list<Contact>();
         for(Id idd : accountList)
         {
        Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
request.setMethod('GET');
HttpResponse response = http.send(request);
// If the request is successful, parse the JSON response.
if(response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.
    Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
    // Cast the values in the 'animals' key as a list
    List<Object> animals = (List<Object>) results.get('animals');
    System.debug('Received the following animals:');
    for(Object animal: animals) 
    {
      //  System.debug(animal);
    }
         Contact con=new Contact();
             con.Id=idd;
             con.LastName='NELSON '+counter;
             updatelist.add(con);
                  counter++;
        
}
              /* Account aaa=new Account();
    aaa.Id=accountList;
    aaa.Phone='7777777777';
    update aaa;*/
}
           if(!updatelist.isEmpty())
              {
                  update updatelist;
              }

  }
   
    public static void callit()
    {
        list<Account> acc=[SELECT Id, Phone,Name,Rating,AccountNumber FROM Account limit 10 ];
        
        Map<String,list<Account>> jsons=new Map<String,list<Account>>();
        jsons.put('account',acc);
        String body= JSon.serialize(acc);
        System.debug('1111111..........'+body);

Http http=new Http();
HttpRequest httreq=new HttpRequest();
httreq.setEndpoint('callout:TARGETB/services/apexrest/InsertAccounts');
httreq.setMethod('POST');
        httreq.setBody(body);
httreq.setHeader('Content-Type','application/json;charset=UTF-8');
  HttpResponse httpresponce= http.send(httreq);

  System.debug('responce.....'+httpresponce.getBody());
    }
 public static list<String>  makecall()
 {
  
for(Contact cc : [select Id,lastname from Contact where AccountId='0015g00000Qa6wGAAR' and LastName='relel'])
{
    system.debug('lastname.....'+cc.LastName);
}
     Contact cc=new Contact();
     cc.LastName='vvvv';
     insert cc;
            return null;
 }
    @future(callout=true)
    public static void makeits(List<ID> ids)
    {
 /*                Http http = new Http();
     HttpRequest request = new HttpRequest();
        request.setEndPoint( 'https://jsonplaceholder.typicode.com/todos/');
     request.setMethod('GET');
     HttpResponse response = http.send(request);
     // If the request is successful, parse the JSON response.
     if(response.getStatusCode() == 200 && response.getBody()!=null) 
     {
             system.debug('valie........');
                
     }
*/
 list<Account> acc=new list<Account>();
             for(Id id : ids)
             {
                Account ac=new Account();
                 ac.Id=id;
                 acc.add(ac);
             }
            update acc;
           
    }
           
        public static void makeit(List<ID> ids)
    {
 /*                Http http = new Http();
     HttpRequest request = new HttpRequest();
        request.setEndPoint( 'https://jsonplaceholder.typicode.com/todos/');
     request.setMethod('GET');
     HttpResponse response = http.send(request);
     // If the request is successful, parse the JSON response.
     if(response.getStatusCode() == 200 && response.getBody()!=null) 
     {
             system.debug('valie........');
                
     }
*/
 list<Account> acc=new list<Account>();
             for(Id id : ids)
             {
                Account ac=new Account();
                 ac.Id=id;
                 acc.add(ac);
             }
            update acc;
           
    }

}