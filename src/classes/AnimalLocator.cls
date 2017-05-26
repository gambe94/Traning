public class AnimalLocator {
	public static String  getAnimalNameById(Integer i){
		Http http= new Http();
		HttpRequest request= new HttpRequest();
		request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + i);
		request.setMethod('GET');
		Map<String,Object> animal = new Map<String,Object>();

		HttpResponse response= http.send(request);

		if (response.getStatusCode() == 200) {
			 Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());

			animal= (Map<String, Object>)  result.get('animal');


		}
		return (String)animal.get('name');
		}

}