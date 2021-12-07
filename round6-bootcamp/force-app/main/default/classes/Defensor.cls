public class Defensor {
   
    Jogador__c jogador;
    
    public Defensor(Jogador__c jogador) {
       this.jogador = jogador;                
    }

    public Decimal rolarDado() {//d10
        return Utils.generateRandomNumber(1,10);
    }

    public Decimal poder() {
        return 
            rolarDado() + rolarDado()
            + jogador.Inteligencia__c //verificar se é null
            + jogador.Velocidade__c;            
    }

    public Jogador__c jogador() {
        return jogador;
    }

}