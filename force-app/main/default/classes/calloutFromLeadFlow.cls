public class calloutFromLeadFlow {
    
    
    String name {get;set;}
    
    @InvocableMethod( label='make callout' description='Create Api Call' category='Callout')
    public static void getLeads(List<Id> ids) 
    {
        
           makeIt(ids);   
    
    

       /* //  futureClass.makeCall(ids);
        if(!System.isFuture() && !System.isBatch())
        {
           makeCalloutQuable makequable=new makeCalloutQuable(ids);
           System.enqueueJob(makequable);
        }
        */
        
    }
    @future(callout=true)
    private static void makeIt(List<Id> ids)
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
        list<String> anims=new list<String>();
             for(Object anim : animals)
             {
                 anims.add((String) anim);
                  
             }
    System.debug('Received the following animals:');
         
}
            list<Account> acc=new list<Account>();
             for(Id id : ids)
             {
                Account ac=new Account();
                 ac.Id=id;
                 acc.add(ac);
             }
          //  update acc;
        

    }
}