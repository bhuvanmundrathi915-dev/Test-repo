public class CarTypes {

   
    @auraEnabled(cacheable=true)
    public static List<Car_Type__c> getCarTypes()
    {
        
        return [select Id,Name from Car_Type__c  ];
    }
}