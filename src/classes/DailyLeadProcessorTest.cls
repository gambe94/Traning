@isTest(seeAllData = true)
public class DailyLeadProcessorTest {

	public static String CRON_EXP = '0 0 0 15 3 ? 2022';
	@isTest(seeAllData = true)
	static void test1() {
		//SETUP


		List<Lead> leadList = new List<Lead> ();
		for (Integer i = 0; i < 200; i++) {
			leadList.add(new Lead(LastName = 'Teszt ' + i, Company = 'Teszt ' + i));
		}

		insert leadList;


		// EXERCISE


		Test.startTest();
		String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());

		Test.stopTest();

		// VERIFY
		leadList = [SELECT LeadSource From Lead where id IN :leadList];


		for (Lead l : leadList) {
			System.assertEquals('Dreamforce', l.LeadSource);
		}

	}



}