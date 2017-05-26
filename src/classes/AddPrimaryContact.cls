public class AddPrimaryContact implements Queueable { 

	private Contact con;
	private String  state;
	
	public AddPrimaryContact(Contact con, String state){
		this.con=con;
		this.state=state;
	}
	public void execute(QueueableContext context){
		List<Account> accList= new List<Account>([Select id From Account	Where BillingState = :state]);
		List<Contact> cons= new List<Contact>();

		for(Account acc: accList){
			Contact c = con.clone(false, true);
		}
		
		insert cons;
	}
}