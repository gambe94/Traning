@isTest(seeAllData=true)
public class LeadProcessorTest {
	@isTest(seeAllData=true)
	static void test1()	{
	 //SETUP
		List<Lead> leadList= new List<lead>();
		for(Integer i=0; i<200; i++){
			leadList.add(new Lead(LastName='Teszt '+i, Company='Test'+i));
		}

		insert leadList;
		
	
	// EXERCISE
 
		Test.startTest();
			Database.executeBatch(new LeadProcessor(),2000);
		Test.stopTest();
 
	// VERIFY
		leadList= [SELECT LeadSource FROM Lead Where id in :leadList];
		for(Lead l:leadList){
			System.assertEquals('Dreamforce',l.LeadSource);
		}
	}

 }