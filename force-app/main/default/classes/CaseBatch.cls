public class CaseBatch implements Database.Batchable<sObject>{

   public Database.QueryLocator start(Database.BatchableContext bc){
      return Database.getQueryLocator([select id,Status,Case_New_Days__c,Case_Working_Days__c,Case_New_DateTime__c,Case_Working_DateTime__c from Case where Status IN ('New','Working') AND createddate = this_week]);
   }

   public void execute(Database.BatchableContext bc, List<Case> scope){
       system.debug('RECORD==========>'+scope);
     for(Case caseRecord : scope){
         if(caseRecord.Status == 'New'){
                       
             DateTime NewDateTime = DateTime.valueOf(caseRecord.Case_New_DateTime__c);
             Integer Days = Integer.valueOf((Datetime.now().getTime() - NewDateTime.getTime())/(1000*60*60*24));
             caseRecord.Case_New_Days__c = Days;
             system.debug('Days=======>'+Days);
 
         }
         else if(caseRecord.Status == 'Working'){
              DateTime WorkingDateTime = DateTime.valueOf(caseRecord.Case_Working_DateTime__c);
             Integer Days = Integer.valueOf((Datetime.now().getTime() - WorkingDateTime.getTime())/(1000*60*60*24));
             caseRecord.Case_Working_Days__c = Days;
                system.debug('Days 22222222=======>'+Days);

         }
     }
     update scope;
    }

   public void finish(Database.BatchableContext bc){
   }
}