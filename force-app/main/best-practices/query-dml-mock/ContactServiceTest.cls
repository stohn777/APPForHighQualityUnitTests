@IsTest
private class ContactServiceTest
{
	@IsTest
	static void testBehavior()
	{
		MockSelector mock_sel = new mockSelector();

		Set<Id> contactIdSet = new Set<Id>();

		Contact ctc_h = new Contact(Id = TestUtilities.generateMockId(Contact.SObjectType));
		ctc_h.LastName = 'Howard';
		mock_sel.listToReturn.add(ctc_h);
		contactIdSet.add(ctc_h.Id);

		Contact ctc_x = new Contact(Id = TestUtilities.generateMockId(Contact.SObjectType));
		ctc_x.LastName = 'Xavier';
		mock_sel.listToReturn.add(ctc_x);
		contactIdSet.add(ctc_x.Id);

		MockUnitOfWork mock_uow = new MockUnitOfWork();

		ServiceFactory.setMock(IContactSelector.class, mock_sel);
		ServiceFactory.setMock(IUnitOfWork.class, mock_uow);
		ContactService.todaysDate = Date.newInstance(2023, 3, 14);

		((IContactService) ServiceFactory.newInstance(IContactService.class)).upsertDescriptionWithTodaysDate(contactIdSet);

		// Logically we could inspect the ctc_h and ctc_x object directly,
		// but let's illustrate the usage of a mock UnitOfWork.

		Map<Id, Contact> contactMap = createContactByIdMap(mock_uow.dirtySObjectMap.get(Contact.SObjectType));
		Assert.isTrue(mock_uow.commitWorkCalled);

		Assert.isTrue(!contactMap.containsKey(ctc_h.Id));

		Assert.isTrue(String.isNotBlank(contactMap.get(ctc_x.Id).Description));
		Assert.areEqual('Today\'s date is: ' + Date.newInstance(2023, 3, 14).format(), contactMap.get(ctc_x.Id).Description);
	}

	private static Map<Id, Contact> createContactByIdMap(List<Contact> contactList)
	{
		Map<Id, Contact> m = new Map<Id, Contact>();

		for (Contact ctc : contactList)
		{
			m.put(ctc.Id, ctc);
		}

		return m;
	}

	public class MockSelector
		implements IContactSelector
	{
		public List<Contact> listToReturn = new List<Contact>();

		public List<Contact> selectById(Set<Id> idSet)
		{
			return listToReturn;
		}
	}

	public class MockUnitOfWork
		implements IUnitOfWork
	{
		Map<SObjectType, List<SObject>> dirtySObjectMap = new Map<SObjectType, List<SObject>>();
		Map<SObjectType, List<SObject>> newSObjectMap = new Map<SObjectType, List<SObject>>();

		public void registerDirty(SObject sobj)
		{
			assureSObjectTypeInMap(sobj.getSObjectType(), dirtySObjectMap);
			dirtySObjectMap.get(sobj.getSObjectType()).add(sobj);
		}

		public void registerNew(SObject sobj)
		{
			assureSObjectTypeInMap(sobj.getSObjectType(), newSObjectMap);
			newSObjectMap.get(sobj.getSObjectType()).add(sobj);
		}

		public Boolean commitWorkCalled = false;

		public void commitWork()
		{
			// We don't want to do any DML
			commitWorkCalled = true;
		}

		private void assureSObjectTypeInMap(SObjectType sot, Map<SObjectType, List<SObject>> m)
		{
			if (!m.containsKey(sot))
			{
				m.put(sot, new List<SObject>());
			}
		}
	}
}