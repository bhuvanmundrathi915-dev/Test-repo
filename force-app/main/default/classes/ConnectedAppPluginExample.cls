global  with Sharing Class ConnectedAppPluginExample extends Auth.ConnectedAppPlugin{
    global override Map<String,String> customAttributes(Id userId, Map<String,String> formulaDefinedAttributes) 
    {  
          
      
        try{
            
       User currentUser  =  [select Id,Lead_Id__c from user where Id =:UserInfo.getUserId() ];
                  formulaDefinedAttributes.put('LeadId', currentUser.Lead_Id__c);
        system.debug('formula Attributes==========>'+formulaDefinedAttributes);
        return formulaDefinedAttributes;
                
           
            
        }
        catch(Exception error){
            system.debug('Error=======>'+error.getLineNumber()+'    '+error.getMessage());
        }
                   

        return formulaDefinedAttributes;
    } 
    
    public override Boolean authorize(Id userId, Id connectedAppId, Boolean isAdminApproved){
        
        system.debug('is admin approved.........'+isAdminApproved);
        return isAdminApproved;
    }
    public override  dom.XmlNode modifySAMLResponse(Map<String,String> authSession, Id connectedAppId, dom.XmlNode samlResponse){
      
        system.debug('session.....'+JSON.serialize(authSession));

        return samlResponse;
    }



    
}