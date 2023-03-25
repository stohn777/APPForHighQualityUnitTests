public inherited sharing class ContactService
	implements IContactService
{
	@TestVisible
	private static Date todaysDate = Date.today();

	public void upsertDescriptionWithTodaysDate(Set<Id> idSet)
	{
		IUnitOfWork uow = (IUnitOfWork) ServiceFactory.newInstance(IUnitOfWork.class);

		for (Contact ctc : ((IContactSelector) ServiceFactory.newInstance(IContactSelector.class)).selectById(idSet))
		{
			if (ctc.LastName.startsWithIgnoreCase('x'))
			{
				ctc.Description = 'Today\'s date is: ' + todaysDate.format();
				uow.registerDirty(ctc);
			}
		}

		uow.commitWork();
	}
}