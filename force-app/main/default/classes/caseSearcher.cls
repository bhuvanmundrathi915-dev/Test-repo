public class caseSearcher {

    @AuraEnabled(cacheable=true)
    public static list<Case> getCases(Map<String,Object> searchValues)
    {       
         
        list<Case> caselist;
          if(searchValues.get('type')=='date')
    {
        if(searchValues.get('datetype')=='Open Date')
        {
                  caselist= [select CreatedDate,ClosedDate,Status,Contact.Email,Contact.Name from Case where CreatedDate>= : Date.valueOf(String.valueOf(searchValues.get('startDate')))
 AND CreatedDate>=: Date.valueOf(String.valueOf( searchValues.get('startDate')))  ];
    
        }
         else if(searchValues.get('datetype')=='Closed Date')
         {
                  caselist= [select CreatedDate,ClosedDate,Status,Contact.Email,Contact.Name from Case where ClosedDate>=: Date.valueOf(String.valueOf( searchValues.get('closedDate'))) AND ClosedDate>=:Date.valueOf(String.valueOf( searchValues.get('closedDate'))) ];
 
         }
  
    }
   else if(searchValues.get('type')=='text')
   {
                    if(searchValues.containsKey('Name'))
                    {
                        caselist= [select CreatedDate,ClosedDate,Status,Contact.Email,Contact.Name from Case where Contact.Name like : '%'+(String)searchValues.get('Name')+'%'];
         
                    }
                   else if(searchValues.containsKey('Email'))
                   {
                          caselist= [select CreatedDate,ClosedDate,Status,Contact.Email,Contact.Name from Case where Contact.Email = : String.valueOf(searchValues.get('Email'))];
      
                   }
       else 
       {
                    caselist= [select CreatedDate,ClosedDate,Status,Contact.Email,Contact.Name from Case];

       }
  
   }
        return caselist;
   }
}