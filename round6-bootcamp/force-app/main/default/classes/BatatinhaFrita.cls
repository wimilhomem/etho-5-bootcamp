public class BatatinhaFrita implements IPartida
{    
    public void execute(Id idPartida)
    {
        List<ParticipantePartida__c> participantes = [SELECT Id,Jogador__c FROM ParticipantePartida__c WHERE Partida__C = :idPartida]; 
        
        List<Jogador__c> jogadores = new List<Jogador__c>();
        
        Integer mortes =(Integer)participantes.size() / 2;
        
        for (Integer i=0; i< mortes; i++)
        {
            jogadores.add(new Jogador__c(Id = participantes[i].Jogador__c, Eliminado__c = true));
		}
        
        update jogadores;
        
        update new Partida__c(Id = idPartida, TerminoDaPartida__c = System.now());
    }

}