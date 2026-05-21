public class UserCheck {
    
    @AuraEnabled(cacheable=true)
    public static Map<String,Object> getUserlist()
    {
        map<String,Object> userlist=new map<String,Object>();
        list<User> userstosend=new list<User>();
        list<User> childs=[select Id,FirstName,lastName from User where ManagerId = : UserInfo.getUserId()];
        User uss =  [select Id,FirstName,lastName from User where Id=: UserInfo.getUserId() limit 1];
        if(!childs.isEmpty())
        {
            userstosend.add(uss);
            userstosend.addAll(childs);
            userlist.put('isChild', true);
            userlist.put('users',userstosend);
        }
        else{
            userstosend.add(uss);
            userlist.put('users',userstosend);
            userlist.put('isChild', false);
            
        }
        return userlist ;
    }
}