@isTest
public class ParkLocatorTest { 
	 @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String countryName='India';
        String[] result = ParkLocator.country(countryName);
        // Verify that a fake result is returned

       System.assertEquals(new List<String>{'Hamburg Wadden Sea National Park', 'Hainich National Park', 'Bavarian Forest National Park'}, result);
    }
}