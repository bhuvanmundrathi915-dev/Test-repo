public class Employee {

    @AuraEnabled
    public static String saveRecord(Employee__c emp)
    {
        insert emp;
        return emp.Id;
    }
    @AuraEnabled(cacheable=true)
    public static list<Employee__c> getRecords()
    {
        return [select Name,Location__c	,Other__c,Employment__c,Employment_Sector__c from Employee__c order by CreatedDate ASC];
    }
    
}