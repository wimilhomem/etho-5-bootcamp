public class AssassinatoHandler {
    public AssassinatoHandler() {

    }
    @future
    public static void execute(){  
        System.debug('iniciou -> ');
    
        disputar();
    }


    static void disputar() {

        List<Jogador__c> jogadores = JogadoresSelector.selectJogadoresVivos();

        //todo verificar se os numeros gerados sao iguais
        System.debug('jogadores -> '+ jogadores);

        Integer ramdonAtacante = Utils.generateRandomNumber(0,jogadores.size()-1);
        Integer ramdonDefensor = Utils.generateRandomNumber(0,jogadores.size()-1);
        Jogador__c atacante = jogadores[ramdonAtacante];
        Jogador__c defensor = jogadores[ramdonDefensor]; 


        Integer forcaAtacante =getForcaAtacante(atacante);
        Integer forcaDefensor = getForcaDefensor(defensor);
        
        System.debug('forcaAtacante -> '+ forcaAtacante);

        System.debug('forcaDefensor -> '+ forcaDefensor);


        if (forcaAtacante > forcaDefensor) {
            
            assassinar(atacante,defensor);
           
        } else if (( forcaAtacante == 1)  && (forcaDefensor > forcaAtacante)) {
            assassinar(defensor,atacante);

        }
    }
    private static Integer getForcaAtacante(Jogador__c assassino) {
        return Utils.getD20() + assassino.Forca__c.intValue();

    }
    private static Integer getForcaDefensor(Jogador__c assassinado) {
        return (Utils.getD10() + Utils.getD10() ) + assassinado.Inteligencia__c.intValue() + assassinado.Velocidade__c.intValue();

    }

    private static void assassinar(Jogador__c assassino, Jogador__c assassinado) {
        System.debug('matou -> '+ assassinado);
        Assassinato__c assinato = new Assassinato__c (
            Assassinado__c = assassinado.Id,
            Assassino__c = assassino.Id,
            DataHora__c = System.now()
            );
        insert assinato;
    }

    

}
