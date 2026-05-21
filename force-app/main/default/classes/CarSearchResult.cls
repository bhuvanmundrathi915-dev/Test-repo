public class CarSearchResult {

    @auraEnabled(cacheable=true)
    public static list<Car__c> getCars(String Id)
    {
        
           return [select Id,Name,Car_Type__c,Description__c,Geolocation__c,Geolocation__Longitude__s ,Geolocation__Latitude__s,Mileage__c,Per_Day_Rent__c,Picture__c from Car__c where Car_Type__r.id = : Id ];
    }
        @AuraEnabled(cacheable=true)
    public static list<Car__c> getAllCars()
    {
        
           return [select Id,Name,Car_Type__c,Description__c,Geolocation__c,Geolocation__Longitude__s ,Geolocation__Latitude__s,Mileage__c,Per_Day_Rent__c,Picture__c from Car__c ];
    }

   @auraEnabled(cacheable=true)
    public static Car__c  getCar(String id)
    {
        
        return [select Name,Description__c,Geolocation__c,Geolocation__Longitude__s ,Geolocation__Latitude__s from Car__c where Id = : id limit 1];
        
    }
  
     @auraEnabled
    public static String  saveexp(Car_Experience__c exp)
    {
        
         insert exp;
        return exp.Id;
        
    }
  
    @auraEnabled
    public static List<Car_Experience__c>  getExpList()
    {
        
        return [select Name,Experience__c from Car_Experience__c];
        
    }

}