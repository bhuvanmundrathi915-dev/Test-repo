public class StudentAuraApexController {
    
    
    @auraEnabled
    public static Id  insertStudent(Student__c stu)
        
    {
     
            insert stu;
          
           return stu.Id;
}
    
      @auraEnabled
    public static Student__c getStudentInfo(Id id)
    {

       
Student__c st = [SELECT Student_Name__c, Class__c,Physics__c, Chemistry__c, English__c,Maths__c  FROM Student__c where Id = : id LIMIT 1];
        return st;
    }
    
    @auraEnabled
    public static Id updateStudent(Student__c st)
    {
        
        update st;
        
        return st.Id;
        
        
    }
    

}