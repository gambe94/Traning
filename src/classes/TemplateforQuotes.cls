public class TemplateforQuotes {

	public Opportunity currentOpportunity { get; set; }
	public List<SelectOption> pickList { get; set; }

	public String selectedTemplateName { get; set; }
	public String newQuoteName { get; set; }
	

	public TemplateforQuotes()
	{
		if (pickList == null) {
			pickList = new list<SelectOption> ();
		}

		currentOpportunity = [
		    SELECT Id, Name, AccountId, Pricebook2Id
		    FROM Opportunity
		    WHERE Id = :ApexPages.currentPage().getParameters().get('id')
		];

		List<Quote> templates = [
			SELECT Id, Name
			FROM Quote
			Where Template__c = true
		];

		for (Quote q : templates) {
			picklist.add(new SelectOption(String.valueOf(q.Name), String.valueOf(q.Name)));
		}
		selectedTemplateName = picklist[0].getValue();
	}


	public PageReference newQuote() {

		Quote templateQuote = [
		    Select Id, Pricebook2Id, Name
		    FROM Quote
		    Where Name = :selectedTemplateName
		];

		Quote newQuoteFromTemplate = new Quote();

		newQuoteFromTemplate.Name = newQuoteName;
		newQuoteFromTemplate.OpportunityId = currentOpportunity.Id;
		newQuoteFromTemplate.Pricebook2Id  = templateQuote.Pricebook2Id;

		insert newQuoteFromTemplate;

		
		List<QuoteLineItem> templateQuoteLineItem = [
				SELECT Id, Description, Discount,
				ListPrice, PricebookEntryId, Product2Id, Quantity, QuoteId, ServiceDate, Subtotal, TotalPrice, UnitPrice
				FROM QuoteLineItem
				Where QuoteId = :templateQuote.Id			
		];

		

		if(templateQuoteLineItem.size() > 0){
			List<QuoteLineItem> quoteLineItemToInsert = new List<QuoteLineItem>(); 

			quoteLineItemToInsert = templateQuoteLineItem.deepClone();

			for(QuoteLineItem qli : quoteLineItemToInsert){			
				qli.QuoteId  = newQuoteFromTemplate.id;
				System.debug('QuoteLineItem: '+qli.PricebookEntryId);
			}
		
			insert quoteLineItemToInsert;
		}

		return null;
	}


}