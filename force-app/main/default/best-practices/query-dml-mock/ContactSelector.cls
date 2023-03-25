public inherited sharing class ContactSelector
	implements IContactSelector
{
	public List<Contact> selectById(Set<Id> idSet)
	{
		return [SELECT Id, FirstName, LastName, Description FROM Contact WHERE Id IN :idSet];
	}
}