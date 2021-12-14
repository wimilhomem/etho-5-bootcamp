public class AddCandidatosQueuable implements Queueable {    
    private Integer quantidadeCandidatos;

    public AddCandidatosQueuable(Integer quantidadeCandidatos) {
        this.quantidadeCandidatos = quantidadeCandidatos;

    }
    public void execute(QueueableContext qc) {   
        
        try {
            
            GetCandidatosApi.addCandidatos(new List<Integer>{quantidadeCandidatos});        
            String messagem = quantidadeCandidatos == 1 ? '1 candidato importado !' : quantidadeCandidatos+ ' candidatos importados !';    
            CustomNotification.sendNotifications(messagem, '', userinfo.getUserId(), 'Importação de candidatos.', 'NotificacaoCandidatos', new set<String>{UserInfo.getUserId()});   
                  
        } catch (Exception e) {
           CustomNotification.sendNotifications('Erro na importação, contate o adm do sistema ! \n Enviado em : ' +System.now(), '', userinfo.getUserId(), 'Importação de candidatos.', 'NotificacaoCandidatos', new set<String>{UserInfo.getUserId()});   
            
        }
		
    }
}