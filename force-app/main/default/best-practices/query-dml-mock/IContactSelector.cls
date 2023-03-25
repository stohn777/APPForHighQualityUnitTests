public interface IContactSelector
	extends IService
{
	List<Contact> selectById(Set<Id> idSet);
}