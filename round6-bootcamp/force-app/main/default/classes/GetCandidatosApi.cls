global class GetCandidatosApi {

    @Future(callout=true)
    global static void addCandidatos(List<Integer> request){
       List<Candidato__c> listCandidatosResponse = new List<Candidato__c>();
       Integer qtdGerar = request.get(0);
        
       List<Candidato> listC = CalloutCandidatoHeroku.getCandidatos(qtdGerar);
        
        for(Candidato candidato : listC){//todo: refatorar metodo add.
            Candidato__c cAux = new Candidato__c();
            cAux.Name = candidato.nome;
            cAux.Email__c = candidato.email;
            cAux.Celular__c = candidato.celular;
            caux.DataNascimento__c = Date.valueOf(candidato.dataNascimento);
            cAux.ValorDaDivida__c = candidato.valorDivida;
            
            listCandidatosResponse.add(cAux);
        }
        
        insert listCandidatosResponse;
       
    }
     
}