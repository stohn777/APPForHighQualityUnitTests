public interface IUnitOfWork
	extends IService
{
	void registerDirty(SObject sobj);
	void registerNew(SObject sobj);
	void commitWork();
}