import { LightningElement,api } from "lwc";

export default class ResultadoRoundContainer extends LightningElement {
  @api round;

  get vencedores() {
    let maiorNumero =0;
    let vencedor;

    let lista = new Array();

    lista = this.round;
    
    if (this.round) {

      console.log('lista='+JSON.stringify(lista));

      

      // lista.forEach(item => {
  
      //     if(item.Jogadores__r.QuantidadeAssassinatos__c > maiorNumero) {
      //         maiorNumero = item.Jogadores__r.QuantidadeAssassinatos__c;
      //         vencedor =  item.Jogadores__r.Name;
  
      //     }
  
        
      // });
      for(let item of lista.Jogadores__r) {
        if(item.QuantidadeAssassinatos__c > maiorNumero) {
          maiorNumero = item.QuantidadeAssassinatos__c;
          vencedor =  item.Name ;  
          console.log('name:'+ item.QuantidadeAssassinatos__c);
        
        }
       
      }
      return vencedor;
    }

    return 'aa';
  }


}
