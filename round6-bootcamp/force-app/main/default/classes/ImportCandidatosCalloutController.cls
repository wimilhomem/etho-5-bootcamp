public with sharing class ImportCandidatosCalloutController {
    
    @AuraEnabled
    public static void insertCandidatos(Integer quantidade) {
        try {
            AddCandidatosQueuable filaCandidato = new AddCandidatosQueuable(quantidade);        
            ID jobID = System.enqueueJob(filaCandidato);
            
        } catch(Exception e) {
            throw new AuraHandledException('Ocorreu ao enfileirar o trabalho: '+e.getMessage());
        }
    }
}
