global class CalloutCandidatoHeroku {
  
    public static List<Candidato> getCandidatos(Integer qtd) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();//TODO: handle para http+url endpoint
        request.setTimeout(11000);//heroku demora 10s para subir
        request.setEndpoint('https://round6-mock.herokuapp.com/mock/'+qtd);
        request.setMethod('GET');


        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        List<Candidato> listCandidatos = new List<Candidato>();   

        if(response.getStatusCode() == 200) {
        // Deserialize the JSON string into collections of data types.
            listCandidatos = (List<Candidato>) JSON.deserialize(response.getBody(), List<Candidato>.class);

        }

        return listCandidatos;

    }
   
}