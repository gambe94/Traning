@isTest
public class AccountManagerTest {
  @isTest static void testGetAccountById() {
        Id recordId = createAccountRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://eu11.salesforce.com/services/apexrest//Accounts/' +recordId+'/contacts';
            
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAcc = AccountManager.getAccount();
        // Verify results
        System.assert(thisAcc != null);
        System.assertEquals('Gabor teszt acc', thisAcc.Name);
		
    }
	static Id createAccountRecord() {
        // Create test record
        Account testAcc = new Account(
            Name='Gabor teszt acc'
           );
        insert testAcc;

		Contact c=  new Contact(
		FirstName='Gabor',
		LastName='Demeter',
		AccountID= testAcc.Id
		);

        return testAcc.Id;
    }       
 }