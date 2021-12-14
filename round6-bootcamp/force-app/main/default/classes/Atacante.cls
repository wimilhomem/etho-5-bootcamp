public class Atacante {
    
    Jogador__c jogador;
    
    public Atacante(Jogador__c jogador) {
        this.jogador = jogador;                
    }

    public Decimal rolarDado() {//d20
        return Utils.generateRandomNumber(1,20);
    }

    public Decimal poder() {
        return jogador.Forca__c + rolarDado();
    }

    public Jogador__c jogador() {
        return jogador;
    }

}