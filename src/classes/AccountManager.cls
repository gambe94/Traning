@RestResource(urlMapping='/Accounts/*/contacts')//<Account_ID>//contacts
global without sharing class AccountManager { 

@HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the account from the end of the URL
        String accountID = request.requestURI.substringBeforeLast('/').substringAfterLast('/');
         return  
			[
				SELECT
					Name, 
					(
						SELECT 
							Name
						FROM 
							Contacts
					)
				FROM 
					Account
				WHERE 
					Id = :accountID
			];

       

    }

}