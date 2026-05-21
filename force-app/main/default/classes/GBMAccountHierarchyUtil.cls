public class GBMAccountHierarchyUtil {
    public list<account> accountHierarchyList{get;private set;}
    public map<id,account> accountDetailsMap{get;private set;}
    public map<id,list<account>> parentChildLinkedListMap{get;private set;}
    public GBMAccountHierarchyUtil(){}
    public static Id getUltParentId( Id accid ){
        Boolean topLevelParent = false;
        while ( !topLevelParent ) {
            Account a = [ Select Id,ParentId From Account where Id =: accid limit 1 ];
            if ( a.ParentID != null ) {
                accid = a.ParentID;
            }
            else {
                topLevelParent = true;
            }
        }
        system.debug('@@@@@'+accid);
        return accid ; // This returns the utltimate parentid for an account
    }
    
    public static map<id,List<Account>> getAcctHierarchy(string accid){   
        Boolean endTraversing = false;
        List<id> parentIdList = new List<id>();
        List<account> acctList = new list<account>();
        List<account> accountHierarchyList = new List<account>();
        Map<id,integer> accountIdLevelMap = new map<id,integer>();
        map<id,account> accountDetailsMap = new map<id,account>();
        Map<id,list<account>> parentChildLinkedListMap = new map<id,list<account>>();
        Integer accountLevel = 0;   
        parentIdList.add(accid);
        while(!endTraversing) {
            if(accountLevel == 0) {
                acctList = [SELECT Id, Name, ParentId FROM Account WHERE Id IN :parentIdList];
            } else {
                acctList = [SELECT Id, Name, ParentId FROM Account WHERE ParentId IN :parentIdList];
            }
            if(acctList.size() == 0 ) {
                endTraversing = true;
            }
            else {
                parentIdList.clear();
                Account a;
                for(Integer i = 0; i < acctList.size(); i++ ) {
                    a = acctList.get(i);
                    parentIdList.add(a.Id);
                    accountIdLevelMap.put(a.Id, accountLevel);
                    accountDetailsMap.put(a.Id, a);
                    if(accountLevel > 0) {
                        if(parentChildLinkedListMap.get(a.ParentId) == null) {
                            parentChildLinkedListMap.put(a.ParentId, new List<account>()); 
                        }
                     list<Account> acc=   parentChildLinkedListMap.get(a.ParentId);
                        acc.add(a);
                        parentChildLinkedListMap.put(a.ParentId,acc);
                        system.debug('@@@@@Parentchildlist' + parentChildLinkedListMap); 
                    }
                }	
            }
            accountLevel++;
        }
        return parentChildLinkedListMap;
    }
}