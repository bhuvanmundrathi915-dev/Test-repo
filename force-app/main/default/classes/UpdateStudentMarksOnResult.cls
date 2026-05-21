public class UpdateStudentMarksOnResult {
    
    
    public static void insertResult(List<Student__c> students)
    {
        
            List<Result__c> results=new List<Result__c>();
        
                 for(Student__c student : students)
                 {
                     
                          String result;
                     String grade;
                    Integer marks = (Integer )(student.Maths__c + student.Physics__c  + student.Chemistry__c + student.English__c);

                         if(student.Maths__c <40 ||student.Physics__c <40 ||student.Chemistry__c <40 ||student.English__c <40 )
                         {
                             
                             result='Fail';
                             grade='';
                             
                             
                         }
                     else if(marks> 350 && marks <400)
                     {
                         result='Pass';
                         grade='First Class';
                     }
                     else if(marks >300 && marks <350)
                     
                     {
                         result='Pass';
                         grade='Second Class';
                     }
                     else if(marks <300)
                     {
                       result='Pass';
                         grade='Third Class';

                     }
                     
                     Result__c res=new Result__c(Name=result, Grade__c=grade, Student__c=student.Id);
                     
                        results.add(res);
                        
                          
                     
                 }
        
          if(results.size()>0)
          {
                        insert results;
    
          }
        
        
    }
    
    public static void updateResult(List<Student__c> students,Map<Id,Student__c> students_old)
    {
        
           
                Set<Id> accountIds=new Set<Id>();
        
                        for(Student__c student : students)
                        {
                            
                            
                            if(student.Maths__c != students_old.get(student.Id).Maths__c ||student.Physics__c != students_old.get(student.Id).Physics__c ||student.Chemistry__c != students_old.get(student.Id).Chemistry__c ||student.English__c != students_old.get(student.Id).English__c )
                            {
                                accountIds.add(student.Id);
                                
                            }
                            
                        }
        
        
        List<Student__c> studentslist=[select Id, Name, Maths__c,Physics__c,Chemistry__c,English__c, (select Id, Name, Student__c,Grade__c from Results__r) from Student__c where Id in  :accountIds];
        
           List<Result__c> resultslist=new List<Result__c>();
            for(Student__c st : studentslist)
            {
                
                          List<Result__c> results=  st.Results__r;
                
                           for(Result__c r : results)
                           {
                               
                                  
                                      String result;
                     String grade;
                    Integer marks = (Integer )(st.Maths__c + st.Physics__c  + st.Chemistry__c + st.English__c);

                         if(st.Maths__c <40 ||st.Physics__c <40 ||st.Chemistry__c <40 ||st.English__c <40 )
                         {
                             
                             result='Fail';
                             grade='';
                             
                             
                         }
                     else if(marks> 350 && marks <400)
                     {
                         result='Pass';
                         grade='First Class';
                     }
                     else if(marks >300 && marks <350)
                     
                     {
                         result='Pass';
                         grade='Second Class';
                     }
                     else if(marks <300)
                     {
                       result='Pass';
                         grade='Third Class';

                     }
                   
                               r.Grade__c=grade;
                               r.Name=result;
                               resultslist.add(r);
                               
                           }
                
                
                
            }
        
              if(resultslist.size()>0)
              {
                  
                  update resultslist;
              }
        
        
        
    }

}