trigger AssassinatosTrigger on Assassinato__c (after insert) {

  if (Trigger.isAfter) {
    if (Trigger.isUpdate) {  
      

      List<Assassinato__c> als =[
           select Id  from Assassinato__c where Id in :Trigger.new
      ];
      
      
      List<Jogador__c>  jogadores = new List<Jogador__c>();


      for  (Assassinato__c a : als) {

        jogadores.add(a.Assassinado__r);

      }

      update jogadores;
      
    }
  }
}