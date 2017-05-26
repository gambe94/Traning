public class NewCaseListController { 
	public List<Case> getNewCases(){
		 return new List<Case>([ SELECT Id, CaseNumber FROM Case WHERE STATUS = 'NEW']);

	}
}