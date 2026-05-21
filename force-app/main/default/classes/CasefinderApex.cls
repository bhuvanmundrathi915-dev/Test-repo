public  class CasefinderApex {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts()
    {
        Set<Id> acids = new Set<Id>();
         List<AggregateResult>  aggs= [select AccountId, Count(Id) from Contact group by AccountId having AccountId!=null];
               for(AggregateResult ag :aggs)
               {

                 acids.add((Id)ag.get('AccountId'));
               }
         return [select Name,Id from Account 
         where id in : acids ];
    }
  
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String accid,String first,String last)
    {
        List<Contact> contacts;
        
        if(accid!=null)
        {
            contacts= [select Name,Id,FirstName,LastName from Contact where AccountId = : accid ];

        }
      
           else  if(first!=null && last !=null && last !='undefined')
             {
                 first=first+'%';
                 last=last+'%';
                 contacts= [select Name,Id,FirstName,LastName from Contact where FirstName like : first and LastName like : last ];

             }
             else if(first!=null)
              {
                first=first+'%';
                contacts=  [select Name,Id,FirstName,LastName from Contact where FirstName like : first ];
      
             }
             else if(last!=null)
             {
                last=last+'%';
                contacts=  [select Name,Id,FirstName,LastName from Contact where  LastName like : last ];
       
            }
            System.debug('contacts......'+contacts);
            return contacts;
   
            }
  
}