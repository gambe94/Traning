global class DailyLeadProcessor implements Schedulable {
	
	global void execute(SchedulableContext sc) {        
		List<Lead> leadList= new List<Lead>([SELECT id FROM Lead Where LeadSource=null]);

		for(Lead l:leadList){
			l.LeadSource='Dreamforce';
		}

		update leadList;

		

	}
}