public with sharing class ContactSearch {
    public static List<Contact> searchForContacts(String a, String b){
    	List<Contact> result;
    	result = [SELECT Id,Name, mailingpostalcode FROM Contact 
                   WHERE LastName=:a and MailingPostalCode=:b
                   ];
          return result; 
		
    }
    
}