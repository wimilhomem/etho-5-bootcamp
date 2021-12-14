public with sharing class CandidadotosCEPAlteradoBatchable implements Batchable {
   public final String query;
   Map<Schema.SObjectField, Object> fieldsValuesMap;
   
    
   public UpdateAccountFields(String query, Map<Schema.SObjectField, Object> fieldsValuesMap ){ 
        this.query = query;
        this.fieldsValuesMap = fieldsValuesMap;
    }   
    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
     }
  
     public void execute(Database.BatchableContext BC, List<sObject> scope){
              
       for(sobject s : scope){
        s.put(Field,Value); 
       }
       update scope;


       for(Object key: fieldsValuesMap.keySet()){
       
        key.put(key,fieldsValuesMap.get(key));
        
        }
        update scope;
      }
  
     public void finish(Database.BatchableContext BC){
     }
}
