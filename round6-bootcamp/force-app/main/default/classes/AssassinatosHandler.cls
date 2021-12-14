public class AssassinatosHandler {
    public AssassinatosHandler() {

    }
    //@future
    public static void execute(){  
        System.debug('iniciou -> ');
    
        disputar();
    }

    public static Assassinato__c execute(List<Jogador__c> jogadores) {

        return new Assassinato__c();

    }

    static void disputar() {

        ///bulk para listar jogadores por round
        //refatorar lógica para outra classe
        List<Jogador__c> jogadores = JogadoresSelector.selectJogadoresVivosByRoundStatus();
        if (jogadores.size() > 1) {
        
            System.debug('jogadores -> '+ jogadores);
            
            Integer ramdonAtacante = Utils.generateRandomIntegerBetween(0,jogadores.size()-1);
            Integer ramdonDefensor;
            do {//verifica se o numero gerado é igual
                ramdonDefensor = Utils.generateRandomIntegerBetween(0,jogadores.size()-1);
            } while (ramdonAtacante == ramdonDefensor);
            
            System.debug('ramdonAtacante -> '+ ramdonAtacante);
            System.debug('ramdonDefensor -> '+ ramdonDefensor);

            Atacante ata = new Atacante(jogadores[ramdonAtacante]);
            Defensor def = new Defensor(jogadores[ramdonDefensor]);
            
            System.debug('forcaAtacante -> '+ ata.poder());
            System.debug('forcaDefensor -> '+ def.poder());


            if (ata.poder() > def.poder()) {
                System.debug('atacante ganhou');            
                assassinar(ata.jogador(),def.jogador());

            } else if ((ata.rolarDado() == 1)  && (def.poder() > ata.poder())) {
                System.debug('dado atacante =1 e defensor ganhou');
                assassinar(def.jogador(),ata.jogador());
            }
        }else {
        System.debug('sem jogadores vivos nesse round');

        }
    }

    private static void assassinar(Jogador__c assassino, Jogador__c assassinado) {
        System.debug('matou -> '+ assassinado.Id);
        Assassinato__c assinato = new Assassinato__c (
            Assassinado__c = assassinado.Id,
            Assassino__c = assassino.Id,
            DataHora__c = System.now()
            );
        insert assinato;
    }

    

}