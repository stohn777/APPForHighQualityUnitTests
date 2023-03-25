@IsTest
public class DatabaseWrapperMock
    implements IDatabaseWrapper
{
    public List<SObject> inserted_sobjects = new List<SObject>();

    public List<SaveResultWrapper> db_insert(List<SObject> sobj_list)
    {
        inserted_sobjects.addAll(sobj_list);

        // Since this is a test, we not really doing an insert.
        return insert_results;
    }

    public List<SObject> updated_sobjects = new List<SObject>();

    public List<SaveResultWrapper> db_update(List<SObject> sobj_list)
    {
        updated_sobjects.addAll(sobj_list);

        // Since this is a test, we not really doing an update.
        return update_results;
    }

    public List<SaveResultWrapper> insert_results = null;
    public List<SaveResultWrapper> update_results = null;
}
