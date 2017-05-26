public class AccountProcessor { 
@future public static  void countContacts(List<Id> recordIds){	
	 
	 List<Account> accList = new List<Account>([SELECT Number_of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :recordIds]);


	for(Account acc : accList){
		if(acc.Contacts != null) 
			acc.Number_of_Contacts__c = acc.Contacts.size();
	}
	update accList;
}

}