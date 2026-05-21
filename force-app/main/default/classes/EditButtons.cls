public  class EditButtons {

    @AuraEnabled(cacheable=true)
    public static List<Edit_Button_Action__c>  getButtons(String objectname)
    {
        List<Edit_Button_Action__c> buttons = [select Id, Name,Is_Active__c,Navigation_Component__c,Navigation_Object_Api_Name__c,Navigation__c,Navigation_Url__c,Object_Name__c from Edit_Button_Action__c where Object_Name__c= : objectname  AND  Is_Active__c=true];
     
        System.debug('account....'+buttons);
        return buttons;
    }

}