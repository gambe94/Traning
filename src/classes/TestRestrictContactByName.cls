@isTest
public class TestRestrictContactByName {

	
	
	
	
	
	
		@isTest
	static void TestInValidContact(){
	
		
  		 Contact c=new Contact(FirstName='Gabor', Lastname='INVALIDNAME');
  		 
  		 
  	Boolean exceptionCaught=false;
  	Test.startTest();
  	try{
		insert c;
  	}catch(Exception e){
  		exceptionCaught= true;
  	}
	Test.stopTest();
	
	
	System.assert(exceptionCaught);
	}
	
	
	
}