public class contactsLwcController {

    
    @AuraEnabled(cacheable=true)
    public static List<sObject> search(String searchTerm, string myObject, String filter) {
        String myQuery = null;
        if(filter != null && filter != ''){
            myQuery = 'Select Id, Name from '+myObject+' Where Name Like  \'%' + searchTerm + '%\' AND '+filter+' LIMIT  5';
        }
        else {
            if(searchTerm == null || searchTerm == ''){
                myQuery = 'Select Id, Name from '+myObject+' Where LastViewedDate != NULL ORDER BY LastViewedDate DESC LIMIT  5';
            }
            else {
                myQuery = 'Select Id, Name from '+myObject+' Where Name Like  \'%' + searchTerm + '%\' LIMIT  5';
            }
        }
        List<sObject> lookUpList = database.query(myQuery);
        return lookUpList;
    }

    @AuraEnabled(cacheable=true)
    public static list<Contact> getContacts(list<Id> cons) 
    {
                       System.debug('contact......'+cons);

        //  List<Id> root = (List<Id>) JSON.deserializeUntyped(cons);
        
      //  System.debug('contact......'+JSON.serialize(root));
       return [select FirstName,LastName from Contact where Id IN : cons];
        //return [select LastName from Contact];
    }
      @AuraEnabled
    public static String  createCampaignMembers(list<Contact> cons,Id camp) 
    {
                    //   System.debug('contact......'+cons);
                 list<Campaign_Member__c> insertlist=new list<Campaign_Member__c>();
                  for(Contact con : cons)
                  {
                     Campaign_Member__c member=new Campaign_Member__c(); 
                      member.FirstName__c=con.FirstName;
                      member.LastName__c=con.LastName;
                     member.Campaign__c=camp;
                      insertlist.add(member);

                  }
           insert insertlist;
                               System.debug('camp......'+insertlist);

        return insertlist[0].Id;
    }
    @AuraEnabled(cacheable=true)
    public static list<sObject> fetchLookupData(string searchKey , string sObjectApiName) {    
        List < sObject > returnList = new List < sObject > ();
        string sWildCardText = '%' + searchKey + '%';
        string sQuery = 'Select Id,Name From ' + sObjectApiName + ' Where Name Like : sWildCardText order by createdDate DESC LIMIT 5';
        for (sObject obj: database.query(sQuery)) {
            returnList.add(obj);
        }
        return returnList;
    }
    
    // Method to fetch lookup default value 
    @AuraEnabled
    public static sObject fetchDefaultRecord(string recordId , string sObjectApiName) {
        string sRecId = recordId;    
        string sQuery = 'Select Id,Name From ' + sObjectApiName + ' Where Id = : sRecId LIMIT 1';
        for (sObject obj: database.query(sQuery)) {
            return obj;
        }
        return null;
    }
    
}