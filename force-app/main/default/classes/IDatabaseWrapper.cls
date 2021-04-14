public interface IDatabaseWrapper
{
    List<SaveResultWrapper> db_insert(List<SObject> sobj_list);
    List<SaveResultWrapper> db_update(List<SObject> sobj_list);
}
