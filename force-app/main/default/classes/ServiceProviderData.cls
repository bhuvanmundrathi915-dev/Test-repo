public class ServiceProviderData {

    @AuraEnabled(cacheable=true)
    public static String getEndpoint(){
        
        return [select Id,Org_Id__c,Endpoint__c from EndpointData__mdt where Org_Id__c=: Userinfo.getorganizationid() limit 1].Endpoint__c;
    }
    @AuraEnabled(cacheable=true)
    public static String getEndpointFromConnectedApp(){
        
        return [Select StartUrl  From AppMenuItem where Name = 'Test_Connected_App' ].StartUrl;
    }
    
}