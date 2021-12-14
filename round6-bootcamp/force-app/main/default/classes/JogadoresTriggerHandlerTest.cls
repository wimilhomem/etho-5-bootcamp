@isTest
public with sharing class JogadoresTriggerHandlerTest {
    @TestSetup
    static void setup() {

        Round__c round = new Round__c(Status__c='Em Andamento');
        List<Round__c> rounds = new List<Round__c>();
        rounds.add(round);
        insert rounds;

        Jogador__c jogador1 = new Jogador__c(Round__c=round.Id,Eliminado__c= false);
        Jogador__c jogador2 = new Jogador__c(Round__c=round.Id, Eliminado__c= true);
      
         List<Jogador__c> jogadores = new List<Jogador__c>();
         jogadores.add(jogador1);
         jogadores.add(jogador2);
        // rounds.add(r2);    
         insert jogadores;
         
    }

    @isTest
    static void handleVencedorTest() {
        List<Jogador__c> jogadores = [SELECT id,Eliminado__c,Round__c FROM Jogador__c];

        System.debug('jogadores: ' + JSON.serialize(jogadores));

        
        Map<Id, Round__c> roundsMap = new Map<Id, Round__c>([SELECT Id,Vencedor__c,  (SELECT Id FROM Jogadores__r WHERE Eliminado__c = false) FROM Round__c]);

        Map<Id, Round__c> roundsToUpdate = new Map<Id, Round__c>();
        System.debug('roundsMap: ' + JSON.serialize(roundsMap));

        Test.startTest();
        for (Jogador__c jogador : jogadores) {

            System.debug('jogador.Round__c: ' + jogador.Round__c);

            JogadoresTriggerHandler.handleVencedor(jogador,roundsMap.get(jogador.Round__c),roundsToUpdate); 
        }
        

        System.debug('UPDATE roundsToUpdate: ' + roundsToUpdate);
        Test.stopTest();
       
       
        for (Jogador__c jogador: jogadores)
        {
            if (!jogador.Eliminado__c){
                System.assertEquals(jogador.Id, roundsToUpdate.get(jogador.Round__c).Vencedor__c, 'O jogador vencedor deve ser ->' +jogador.Id);
            }
        }
        

        

    }
}