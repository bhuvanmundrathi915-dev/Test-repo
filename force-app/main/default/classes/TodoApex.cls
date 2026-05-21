public class TodoApex {

    @auraEnabled
    public static String insertTODO(ToDo__c todo){
        
            
                 insert todo;
            return todo.Id;
        
        
    }
        @auraEnabled
    public static List<ToDo__c> getAllTODO()
    {
     
        return [select Id, Name,Description__c,Due_Date__c,Reminder_Date__c from ToDo__c order by CreatedDate ASC];
    }
    
}