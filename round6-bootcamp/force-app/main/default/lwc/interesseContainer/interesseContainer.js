import { LightningElement,api } from 'lwc';
// import CANDIDATO_OBJECT from '@salesforce/schema/Candidato__c';

// import NAME from '@salesforce/schema/Candidato__c.Name';
// import EMAIL from '@salesforce/schema/Candidato__c.Email__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import insertCandidato from '@salesforce/apex/InteresseController.createInteresse';


export default class InteresseContainer extends LightningElement {

  candidato = { Name:'', Email__c:'', Celular__c:'', ValorDaDivida__c:''};

  handleClickLimpar(event) {
   this.template.querySelector('lightning-input').value = '';  

  }

  handleChange(event) {
    this.candidato[event.target.dataset.attributeName] = event.target.value;    
  }

  handleClickEnviar() {
    console.log(JSON.stringify(this.candidato)); 
    //TODO: validar candidato vazio 
    insertCandidato ({ candidato : this.candidato })
        .then(result => {
                                              
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Interesse registrado',
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
            window.console.log("error", JSON.stringify(this.error));

        });
}
}

/**
 * duvidas:
 * - usar schema existente
 * 
 * 
 */