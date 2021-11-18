public without sharing class JogadoresTriggerHandler {
  
    public static void beforeUpdate(List<jogador__c> records, Map<Id,Jogador__c> oldMap) {
        for (Jogador__c jogador: records) {
            beforeUpdate(records, oldMap.get(jogador.Id));          
      }
    }

    private static beforeUpdate(Jogador__c record,Jogador__c recordOld) {
        if (isChanged(recordOld.Eliminado__c, record.Eliminado__c)){
            setValue(record,Jogador__c.DataMorte__c,System.now());           
        }
    }

    private static Boolean isChanged(Boolean value, Boolean valueToCompare) {
        return value != valueToCompare;
    }

    private static void setValue(Jogador__c record, Schema.SObjectField field, Object value) {
        record.put(field,value);
    }
}
