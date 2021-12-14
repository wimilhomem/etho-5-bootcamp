import { LightningElement } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import insertCandidatos from '@salesforce/apex/ImportCandidatosCalloutController.insertCandidatos';
export default class ImportCandidadosCallout extends LightningElement {

  quantidade = 0;

  handleChange(event) {
    this.quantidade = event.target.value;    
  }

  handleClickEnviar() {    
    
  insertCandidatos ({ quantidade : this.quantidade })
      .then(result => { 
                                            
              this.dispatchEvent(
                  new ShowToastEvent({
                      title: 'Success',
                      message: 'Solicitação enviada',
                      variant: 'success',
                  }),
              );          
      })
      .catch(error => {
        this.dispatchEvent(
          new ShowToastEvent({
              title: 'Error creating record',
              message: error.body.message,
              variant: 'error',
          }),
      );
      console.log('error', JSON.stringify(error));
    
      });
}
}