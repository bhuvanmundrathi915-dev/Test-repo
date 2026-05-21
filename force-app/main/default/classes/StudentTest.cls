@isTest
public class StudentTest {
    
    
        @isTest
        static void insertstudentTest()
        {
            
                Student__c student =new Student__c();
                 student.Class__c='6TH class';
                 student.Maths__c=89;
                 student.Physics__c=45;
                 student.Chemistry__c=78;
                 student.English__c=91;
            
               insert student;

            
            
        }
    
          @isTest
        static void updateStudentTest()
        {
           
               Student__c student =new Student__c();
                 student.Class__c='8TH class';
                 student.Maths__c=30;
                 student.Physics__c=21;
                 student.Chemistry__c=34;
                 student.English__c=10;
            
               insert student;
            
             student=[select Id, Name ,Class__c,Maths__c,Physics__c,Chemistry__c,English__c  from  Student__c where Id = :  student.Id ];
            
                  student.Maths__c=99;
                  student.English__c=87;
                  student.Physics__c=95;
                  student.Chemistry__c=89;

              update student;

            
        }
    
              @isTest
        static void updateStudentTest1()
        {
           
               Student__c student =new Student__c();
                 student.Class__c='8TH class';
                 student.Maths__c=89;
                 student.Physics__c=70;
                 student.Chemistry__c=70;
                 student.English__c=89;
            
               insert student;
            
             student=[select Id, Name ,Class__c,Maths__c,Physics__c,Chemistry__c,English__c  from  Student__c where Id = :  student.Id ];
            
                  student.Maths__c=89;
                  student.English__c=69;
                  student.Physics__c=68;
                  student.Chemistry__c=71;

              update student;

            
        }

           @isTest
        static void updateStudentTest2()
        {
           
               Student__c student =new Student__c();
                 student.Class__c='8TH class';
                 student.Maths__c=89;
                 student.Physics__c=76;
                 student.Chemistry__c=76;
                 student.English__c=90;
            
               insert student;
            
             student=[select Id, Name ,Class__c,Maths__c,Physics__c,Chemistry__c,English__c  from  Student__c where Id = :  student.Id ];
            
                  student.Maths__c=78;
                  student.English__c=86;
                  student.Physics__c=90;
                  student.Chemistry__c=67;

              update student;

            
        }
   @isTest
        static void updateStudentTest3()
        {
           
               Student__c student =new Student__c();
                 student.Class__c='8TH class';
                 student.Maths__c=89;
                 student.Physics__c=81;
                 student.Chemistry__c=96;
                 student.English__c=95;
            
               insert student;
            
             student=[select Id, Name ,Class__c,Maths__c,Physics__c,Chemistry__c,English__c  from  Student__c where Id = :  student.Id ];
            
                  student.Maths__c=21;
                  student.English__c=40;
                  student.Physics__c=71;
                  student.Chemistry__c=65;

              update student;

            
        }
    
       
  @isTest
        static void updateStudentTest4()
        {
           
               Student__c student =new Student__c();
                 student.Class__c='8TH class';
                 student.Maths__c=70;
                 student.Physics__c=65;
                 student.Chemistry__c=71;
                 student.English__c=58;
            
               insert student;
            
             student=[select Id, Name ,Class__c,Maths__c,Physics__c,Chemistry__c,English__c  from  Student__c where Id = :  student.Id ];
            
                  student.Maths__c=21;
                  student.English__c=40;
                  student.Physics__c=71;
                  student.Chemistry__c=65;

              update student;

            
        }
    
 

}