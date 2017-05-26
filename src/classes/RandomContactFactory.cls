public class RandomContactFactory { 

public static List<Contact> generateRandomContacts(Integer numContacts, String paramtoLastName){
	List<Contact> con= new List<Contact>();
	for(Integer i=0; i<numContacts; i++){
		Contact c = new Contact(LastName=paramtoLastName, FirstName='Gabor'+ i);
		con.add(c);
	}
	return con;
}


}