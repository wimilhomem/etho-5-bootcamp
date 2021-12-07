public with sharing class JogadoresSelector {
    
    
    public static List<Jogador__c> selectJogadoresByRound(Set<Id> ids) {
        return [
            
        SELECT Id,Round__c 
        FROM Jogador__c 
        WHERE Round__c IN :ids
        AND Eliminado__c = false
        
        ];
    }
    public static List<Jogador__c> selectJogadoresVivosByRoundStatus() {
        return [select ID,Forca__c,Velocidade__c,Inteligencia__c from Jogador__c 
        where
        Morreu__c = false and
        Round__r.Status__c= 'Em andamento'];
    }

}
