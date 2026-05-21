public class StudentsInfo {
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
    public static list<Map<String,String>> getStudents()
    {
                       list<Map<String,String>> listdata=new list<Map<String,String>>();
     list<Students__c> students=   [select Id,Name,First_Name__c,Last_Name__c,Age__c,Gender__c,Class__c,Class__r.Id,Class__r.Name from Students__c];
                 for(Students__c student : students)
             {
                   map<String,String> data=new map<String,String>();
                 data.put('First_Name__c', student.First_Name__c); 
                 data.put('Last_Name__c', student.Last_Name__c); 
                 data.put('Age__c', String.valueOf(student.Age__c)
                         ); 
                 data.put('Gender__c', student.Gender__c); 
                 data.put('Class', student.Class__r.Name); 
                listdata.add(data);
             }
        return listdata;
    }
      @AuraEnabled
    public static Boolean updateStudents(list<Students__c> students)
    {
        update students;
        return true;
    }
}