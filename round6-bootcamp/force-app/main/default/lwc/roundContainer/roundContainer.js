import { LightningElement,api,track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class RoundContainer extends LightningElement {
  @api round;//expondo a variavel 
  
  filtro = '';
  listaJogadoresFiltrados = new Array();
  
  
  filtrarJogadores() {   
    
    return this.listaJogadoresFiltrados.filter(item => item.Name.includes(this.filtro)) ;    

  }

  handleChange(event) {
    //this.filtro[event.target.dataset.attributeName] = event.target.value;
    this.filtro = event.target.value;
    
    if (this.filtrarJogadores().length === 0) {
      this.showToast('Jogador {0} não encontrado');

    }  
  }
  
  get jogadoresFiltrados() {
    this.listaJogadoresFiltrados = this.round.Jogadores__r;

    return this.filtrarJogadores();

  }

  showToast(message) {
    const event = new ShowToastEvent({
      // title: '',
      message: message,
      messageData: [
        this.filtro
     ],
      variant: 'warning'

    });
    this.dispatchEvent(event);
  } 
}