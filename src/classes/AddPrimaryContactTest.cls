@isTest(seeAllData=true)
public class AddPrimaryContactTest {

	@isTest(seeAllData=true)
	static void test1()	{
	 //SETUP
		List<Account> accList= new List<Account>();
		for(Integer i=0; i<50; i++){
			accLIst.add(new Account(Name='Teszt '+i, BillingState ='NY'));
		}
		for(Integer i=0; i<50; i++){
			accList.add(new Account(Name='Teszt '+i, BillingState ='CA'));
		}


		insert accList;
		Contact c= new Contact(LastName='Valaki10');
		insert c;
	
	// EXERCISE
 
		Test.startTest();
			 System.enqueueJob(new AddPrimaryContact(c,'CA'));
		Test.stopTest();
 
	// VERIFY
		List<Contact> conList = new List<Contact>([SELECT LastName From Contact Where AccountID IN :accList and Account.BillingState='CA']);


		for(Contact con:conList){
			System.assertEquals(c.LastName, con.LastName);
		}

	}
 }