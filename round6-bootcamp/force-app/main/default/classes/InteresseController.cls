public with sharing class InteresseController {
    
    
    @AuraEnabled
    public static void createInteresse(Candidato__c candidato){
        try {
            
            //System.debug('candidato-> ' + candidato);
            //insert new Candidato__c(); 
           
            insert candidato;
            
        } catch (Exception e) {
               throw new AuraHandledException(e.getMessage( ));         
        }
        
    }
}
