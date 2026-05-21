public class GetRestResponce {

    
        public static HttpResponse makeGetCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://www.json-generator.com/api/json/get/bVOaINtQia?indent=2');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            Object account = (Object) results.get('accounts');
                        List<Object> contacts  = (List<Object>) results.get('contacts');

                                    System.debug('Received the following  body:');
            
                            System.debug(response.getBody());

                        System.debug('Received the following  account:');
                            System.debug(account);

            

            System.debug('Received the following  contacts:');
            for(Object contact: contacts) {
                System.debug(contacts);
            }
        }
        return response;
    }
    
    
}