public class LeadProcessor implements Database.Batchable<sObject>{

	public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT LeadSource FROM Lead');
    }

    public void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        for (Lead l : scope) {
           l.LeadSource='Dreamforce';
        }
        update scope;
    }    

    public void finish(Database.BatchableContext bc){
      
    }   


 }