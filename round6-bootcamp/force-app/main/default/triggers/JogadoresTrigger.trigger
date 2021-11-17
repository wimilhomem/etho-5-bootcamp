trigger JogadoresTrigger on Jogador__c (before update) {

  if (Trigger.isBefore){    
    if (Trigger.isUpdate){
      
      JogadoresTriggerHandler.beforeUpdate(Trigger.new,Trigger.oldMap);


      // for (Jogador__c jogador: Trigger.new){

      //     Jogador__c jogadorOld = Trigger.oldMap.get(jogador.Id);

      //     if (!jogadorOld.Eliminado__c && jogador.Eliminado__c){

      //       jogador.DataMorte__c = System.now();

      //     }

      // }

    }
  }

}