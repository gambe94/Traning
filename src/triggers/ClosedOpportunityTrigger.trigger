trigger ClosedOpportunityTrigger on Opportunity (after update, after insert) {   
   	
   	
   	
   	if(Trigger.isInsert && Trigger.isAfter){
   		
   		List<Task> ts= new List<Task>();
   		 for(Integer i =0; i<Trigger.size; i++){
    				if(Trigger.new[i].StageName=='Closed Won'){
    				Task t= new Task(Subject='Follow Up Test Task');
    				t.WhatId= Trigger.new[i].Id;
    				ts.add(t);
    				}
   		 }
   		 
   		 insert ts;
   	}
   	
   	if(Trigger.isUpdate && Trigger.isAfter){
   		
   		List<Task> ts= new List<Task>();
   		
  		 for(Integer i =0; i<Trigger.size; i++){
    			if(Trigger.new[i].StageName != Trigger.old[i].StageName && Trigger.new[i].StageName=='Closed Won'){
    				Task t= new Task(Subject='Follow Up Test Task');
    				t.WhatId= Trigger.new[i].Id;
    				ts.add(t);
    			}
   		 }
   		 insert ts;
   		 
   	}
}