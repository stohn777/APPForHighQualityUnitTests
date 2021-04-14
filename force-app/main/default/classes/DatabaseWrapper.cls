public inherited sharing class DatabaseWrapper
    implements IDatabaseWrapper
{
    //----------------------------------------
    //  Factory
    //----------------------------------------
    public static IDatabaseWrapper newInstance()
    {
        if (mock_database_wrapper != null)
        {
            return (IDatabaseWrapper) mock_database_wrapper;
        }

        return new DatabaseWrapper();
    }

    private static IDatabaseWrapper mock_database_wrapper = null;

    public static void setMock(IDatabaseWrapper mockWrapper)
    {
        mock_database_wrapper = mockWrapper;
    }

    private DatabaseWrapper()
    {
        // Intentionally blank
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
