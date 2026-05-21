public with sharing class LookupLiteController {
	
	@AuraEnabled 
    public static List<Account> fetchRecords( String objectName, String filterField,list<Account> exlcudelist, String searchString ) {
              String searchKey='%'+searchString+'%';
        return [SELECT Id, Name, AccountNumber FROM Account WHERE Name LIKE : searchKey AND Id NOT IN: exlcudelist];

    }
        @AuraEnabled
    public static void insertPayeeDistribtion(list<Payee_Distribution__c> payeelist) {
        insert payeelist;
    }
    @AuraEnabled
    public static String createAccount(Payee_Distribution__c payee)
    {
    insert payee;
        return payee.Id;
    }

 	@AuraEnabled(cacheable=true) 
    public static List<Account> getExcludeList()
    {
        return [SELECT Id, Name, AccountNumber FROM Account WHERE Name='TEXTA'];

    }
    
}