import { LightningElement,api } from 'lwc';

export default class JogadorContainer extends LightningElement {
  @api jogador;
  @api vencedor;
  get jogadorClass() {
    if(this.jogador.Eliminado__c) {

      return "slds-card_boundary slds-grid slds-theme_shade cardJogadorEliminado";

    }
    return "slds-card_boundary slds-grid slds-theme_shade cardJogador";
  }


  get isVencedor() {
    console.log('this.vencedor='+ this.vencedor);
    return this.vencedor === this.jogador.Id ? true : false;
}

}