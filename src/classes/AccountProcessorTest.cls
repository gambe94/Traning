@isTest(seeAllData=true)
public class AccountProcessorTest { 


	@isTest(seeAllData=true)
	static void test1()	{
	 //SETUP
		List<Account> accList= new List<Account>{
		new Account(Name='acc1'),
		new Account(Name='acc2')
		};
		insert accList;

		List<Contact> cons= new List<Contact>{
			new Contact(LastName='Demeter', AccountId=accList[0].Id),
			new Contact(LastName='Nagy', AccountId=accList[0].Id),
			new Contact(LastName='Kiss', AccountId=accList[1].Id)
		};
		
	insert cons;
	// EXERCISE
 
		Test.startTest();
			AccountProcessor.countContacts(new List<Id>{accList[0].Id,accList[1].Id});
		Test.stopTest();
 
	// VERIFY
		accList= [Select Number_of_Contacts__c  From Account Where Id IN :accList Order By Name Asc];
		System.assertEquals(2,accList[0].Number_of_Contacts__c);
		System.assertEquals(1,accList[1].Number_of_Contacts__c);
	}
 
}