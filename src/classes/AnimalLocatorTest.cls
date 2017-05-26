@isTest
public class AnimalLocatorTest  {
    
    @isTest static void testGetCallout() {
     
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        
        String result = AnimalLocator.getAnimalNameById(2);
     //'{"animal":{"id":2,"name":"bear","eats":"berries, campers, adam seligman","says":"yum yum"}}'
        String expectedResult='bear';
        System.assertEquals(result, expectedResult);

    }   // end method
    
}   // end class