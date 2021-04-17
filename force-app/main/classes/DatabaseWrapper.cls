public inherited sharing class DatabaseWrapper
    implements IDatabaseWrapper
{
    //----------------------------------------
    //  Factory
    //----------------------------------------
    public static IDatabaseWrapper newInstance()
    {
        return (IDatabaseWrapper) ServiceFactory.newInstance(IDatabaseWrapper.class);
    }

    //----------------------------------------
    //  Public
    //----------------------------------------
    public List<SaveResultWrapper> db_insert(List<SObject> sobj_list)
    {
        return SaveResultWrapper.create(Database.insert(sobj_list));
    }

    public List<SaveResultWrapper> db_update(List<SObject> sobj_list)
    {
        return SaveResultWrapper.create(Database.update(sobj_list));
    }
}
