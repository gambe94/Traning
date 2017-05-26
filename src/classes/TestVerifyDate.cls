@isTest
public class TestVerifyDate {
    @isTest static void testIn30day(){
    	Date date1=  Date.newInstance(2016,1,1);
    	Date date2=  Date.newInstance(2016,1,28);
    	Date mydate= VerifyDate.CheckDates(date1,date2);
    	System.assertEquals(date2, mydate);
    }
    
    
     @isTest static void testIn30daywrongOrder(){
    	Date date1=  Date.newInstance(2016,1,1);
    	Date date2=  Date.newInstance(2016,1,28);
    	Date mydate= VerifyDate.CheckDates(date2,date1);
    	System.assertEquals(Date.newInstance(2016,1,31), mydate);
    }
    
      @isTest static void testOut30day(){
    	Date date1=  Date.newInstance(2016,1,1);
    	Date date2=  Date.newInstance(2016,2,20);
    	Date mydate= VerifyDate.CheckDates(date1,date2);
    	System.assertEquals(Date.newInstance(2016,1,31), mydate);
    }
    
    
      @isTest static void testOut30daywrongOrder(){
    	Date date1=  Date.newInstance(2016,1,1);
    	Date date2=  Date.newInstance(2016,3,20);
    	Date mydate= VerifyDate.CheckDates(date2,date1);
    	System.assertEquals(Date.newInstance(2016,3,31), mydate);
    }
    
    
    
    
    
}