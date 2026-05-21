public class FindStudents {

    @AuraEnabled
    public static List<Student__c> getStudents(String sea)
    {
        
        
        
        return [select id, Class__c,Student_Name__c,Name,Physics__c,Maths__c,English__c,Chemistry__c from Student__c where Class__c = : sea ];
        
        
    }
}