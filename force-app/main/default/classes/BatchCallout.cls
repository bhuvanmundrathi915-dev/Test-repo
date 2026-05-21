global class BatchCallout implements Database.Batchable<Sobject>,Database.AllowsCallouts{
    list<Contact> contacts;
    public BatchCallout(list<Contact> conts)
    {
     contacts= conts;
        
    }
    global Database.QueryLocator start(Database.BatchableContext context) {
           
        return   Database.getQueryLocator([select Id,LastName from Contact where Id IN : contacts ]);
    }
    global void execute(Database.BatchableContext context, List<Sobject> values) {

         list<Contact> newcons= (list<Contact>) values;
           system.debug('size......'+values.size());
    Integer counter=1;
         list<Contact> updatelist=new list<Contact>();
         for(Contact con : newcons)
         {
        Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
request.setMethod('GET');
/*HttpResponse response = http.send(request);
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
             con.LastName='NELSON '+counter;
             updatelist.add(con);
                  counter++;
  
}
*/
              /* Account aaa=new Account();
    aaa.Id=accountList;
    aaa.Phone='7777777777';
    update aaa;*/
}


           if(!newcons.isEmpty())
              {
                 // update updatelist;
                   update newcons;

              }

                    system.enqueueJob(new makeCalloutQuable(updatelist));
      system.debug('In Batch..........'+Limits.getLimitCallouts()+'   '+Limits.getCallouts()+'   '+ Limits.getLimitDmlStatements()+'  '+Limits.getDmlStatements()+'   '+Limits.getQueryLocatorRows()+'   '+Limits.getFutureCalls()+'  '+Limits.getLimitFutureCalls());

    }
    global void finish(Database.BatchableContext context) {
    }
}