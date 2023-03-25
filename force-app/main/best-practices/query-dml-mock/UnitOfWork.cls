public inherited sharing class UnitOfWork
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

	public void commitWork()
	{
		for (List<SObject> dirtyList : dirtySObjectMap.values())
		{
			Database.update(dirtyList);
		}

		for (List<SObject> newList : newSObjectMap.values())
		{
			Database.insert(newList);
		}
	}

	private static void assureSObjectTypeInMap(SObjectType sot, Map<SObjectType, List<SObject>> m)
	{
		if (!m.containsKey(sot))
		{
			m.put(sot, new List<SObject>());
		}
	}
}