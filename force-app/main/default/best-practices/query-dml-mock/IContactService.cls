public interface IContactService
	extends IService
{
	void upsertDescriptionWithTodaysDate(Set<Id> idSet);
}