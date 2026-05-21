public with sharing class CustomLookupLwcController {
    // Method to fetch lookup search result   
    @AuraEnabled(cacheable=true)
    public static list<sObject> fetchLookupData(string searchKey , string sObjectApiName) {    
        List < sObject > returnList = new List < sObject > ();
        string sWildCardText = '%' + searchKey + '%';
        string sQuery = 'Select Id,Name From ' + sObjectApiName + ' Where Name Like : sWildCardText order by createdDate DESC ';
        for (sObject obj: database.query(sQuery)) {
            returnList.add(obj);
        }
        return returnList;
    }
    
    // Method to fetch lookup default value 
    @AuraEnabled
    public static sObject fetchDefaultRecord(string recordId , string sObjectApiName) {
        string sRecId = recordId;    
        string sQuery = 'Select Id,Name From ' + sObjectApiName+' limit 50' ;
        for (sObject obj: database.query(sQuery)) {
            return obj;
        }
        return null;
    } 
     @AuraEnabled
     public static Boolean insertAgents(list<rsa__c> agents)
     {
         insert agents;
         return true;
     }
      @AuraEnabled
     public static Boolean insertStudent(Students__c student)
     {
         insert student;
         return true;
     }
     @AuraEnabled
     public static list<Map<String,String>> fetchCount()
     {
               list<Map<String,String>> listdata=new list<Map<String,String>>();
               
          list<Class__c> cla=   [select Id,Name,(select Id,Name from Students__r) from Class__c];
     
         for(Class__c clas : cla)
             {
                                       map<String,String> data=new map<String,String>();

                 data.put('Name', clas.Name); 
                 data.put('Total', String.valueOf( clas.Students__r.size()));
                listdata.add(data);

            }
         return listdata;
     }
    @AuraEnabled
    public static list<Students__c> getStudents()
    {
        return [select Id,Name,First_Name__c,Last_Name__c,Age__c,Gender__c,Class__c,Class__r.Id,Class__r.Name from Students__c];
    }
      @AuraEnabled
    public static Boolean updateStudents(list<Students__c> students)
    {
        update students;
        return true;
    }
}