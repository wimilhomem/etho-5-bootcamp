trigger AssassinatosTrigger on Assassinato__c (after insert) {

  if (Trigger.isAfter) {
    if (Trigger.isInsert) {  
      

      List<Assassinato__c> listaAssassinatos =[
           select Id,Assassinado__r.Morreu__c  from Assassinato__c where Id in :Trigger.new
      ];
      
      
      List<Jogador__c>  jogadores = new List<Jogador__c>();


      for  (Assassinato__c a : listaAssassinatos) {

        a.Assassinado__r.Morreu__c = true;
        jogadores.add(a.Assassinado__r);

      } 
      System.debug('jogadores' +jogadores);

      update jogadores;
      
    }
  }
}