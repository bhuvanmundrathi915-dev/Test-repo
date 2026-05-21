public class makeCalloutQuable implements Queueable, Database.AllowsCallouts {
  
    list<Contact> ids {get;set;}
     boolean isRecurse=false;
    boolean isshow=true;
    public makeCalloutQuable(list<Contact> leadids)
    {
       ids=leadids;
    }
    public void execute(QueueableContext context) 
    {

                Integer sentCount = 0;
                  Boolean hitLimit = false;
                  RestCall.makecall();
                  Http httpp = new Http();
     HttpRequest requeste = new HttpRequest();
        requeste.setEndPoint( 'https://jsonplaceholder.typicode.com/todos/');
     requeste.setMethod('GET');
     HttpResponse responses = httpp.send(requeste);
     // If the request is successful, parse the JSON response.
     if(responses.getStatusCode() == 200 && responses.getBody()!=null) 
     {
             system.debug('valie........');
                
     }
   
                        system.debug('calling.......'+'     '+system.Limits.getLimitQueries()+'    '+system.Limits.getQueries()+'   '+Limits.getFutureCalls()+'     '+Limits.getLimitFutureCalls()+'    '+Limits.getLimitQueueableJobs());
                  
                    if(isshow)
                    {
                        system.debug('yes............');
                        isshow=false;
                    }
              if(ids!=null)
              {
                   for (Contact ld : ids)
            {
        if (Limits.getCallouts() == Limits.getLimitCallouts())
        {
            hitLimit = true;

            // Messy code flow, but this quickly exits the loop
            break;
        }
                
        // Do your callout
                   Http http = new Http();
     HttpRequest request = new HttpRequest();
        request.setEndPoint( 'https://jsonplaceholder.typicode.com/todos/');
     request.setMethod('GET');
     HttpResponse response = http.send(request);
     // If the request is successful, parse the JSON response.
     if(response.getStatusCode() == 200 && response.getBody()!=null) 
     {
             system.debug('valie........');
                
     }
                
  

        // Track how many leads have been processed
        sentCount++;
    }   
              }
        
        // Database.executeBatch(new BatchCallout(ids),100);
      //   Database.executeBatch(new BatchCallout(ids),100);

               system.debug('queu..........'+system.Limits.getQueueableJobs()+  '     '+ Limits.getLimitQueueableJobs()  +'          '+system.Limits.getCallouts()+'    '+Limits.getFutureCalls()+'    '+Limits.getLimitFutureCalls());

    if (hitLimit) {
        // Need to chain this queueable to finish processing. First clean up
        // the list of leads needing a callout, removing all those that have
        // been sent already
        for (Integer index = 0; index < sentCount; index++){
            //https://test-bhuvan-dev-ed.my.salesforce.com/_ui/common/apex/debug/ApexCSIPage#ex++) {
            ids.remove(0);
        }
        // Now ensure the remainder get processed by simply re-enqueuing this
        // queueable with its adjusted state
        System.enqueueJob(this);
    }

        //your code including the callout   
                      //     System.debug('called.....from Lead');    
      /*          for(Integer i=1;i<=100;i++)
                {
                   Http http = new Http();
     HttpRequest request = new HttpRequest();
        request.setEndPoint( 'https://jsonplaceholder.typicode.com/todos/');
     request.setMethod('GET');
     HttpResponse response = http.send(request);
     // If the request is successful, parse the JSON response.
     if(response.getStatusCode() == 200 && response.getBody()!=null) 
     {
             system.debug('valie........'+i);
                
     }
                
  
    }
  */
    }

}