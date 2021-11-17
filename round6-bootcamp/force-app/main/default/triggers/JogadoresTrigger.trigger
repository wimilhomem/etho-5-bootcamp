trigger JogadoresTrigger on Jogador__c (before update) {

  if (Trigger.isBefore){    
    if (Trigger.isUpdate){
      //List<Jogador__c> registrosAtualizados = (List<Jogador__c>)Trigger.new();
      for (Jogador__c jogador: Trigger.new){

          Jogador__c jogadorOld = Trigger.oldMap.get(jogador.Id);

          if (!jogadorOld.Eliminado__c && jogador.Eliminado__c){

            jogador.DataMorte__c = System.now();

          }

      }

    }
  }

}