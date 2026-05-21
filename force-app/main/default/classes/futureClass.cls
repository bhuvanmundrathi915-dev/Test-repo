public class futureClass {

    @future(callout=true)
    public static void makeCall( List<Id> ids ) {
       
           Http http = new Http();
     HttpRequest request = new HttpRequest();
        request.setEndPoint( 'https://jsonplaceholder.typicode.com/todos/');
     request.setMethod('GET');
     HttpResponse response = http.send(request);
     // If the request is successful, parse the JSON response.
     if(response.getStatusCode() == 200 && response.getBody()!=null) 
     {
         list<Contact> contacts=new list<Contact>();
           for(Lead lea : [select Name from Lead where Id IN: ids])
           {
               Contact contact=new Contact();
                contact.LastName=lea.Name;
               contacts.add(contact);
           }
         
         insert contacts;
                   System.debug('called.....from Lead');    

     }
    
       
    }
   @future(callout=true)
    public static void calloutFromContact() {
       
           Http http = new Http();
     HttpRequest request = new HttpRequest();
        request.setEndPoint( 'https://jsonplaceholder.typicode.com/todos/');
     request.setMethod('GET');
     HttpResponse response = http.send(request);
     // If the request is successful, parse the JSON response.
     if(response.getStatusCode() == 200) 
     {
          System.debug('called.....from Contact');    
     }
    
       
    }
   
}