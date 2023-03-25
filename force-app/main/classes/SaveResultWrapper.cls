public inherited sharing class SaveResultWrapper
{
    private Database.SaveResult save_result = null;

    private ID sr_id = null;
    private Boolean is_success;

    private SaveResultWrapper(Database.SaveResult sr)
    {
        save_result = sr;
    }

    private SaveResultWrapper(Id i, Boolean success)
    {
        sr_id = i;
        is_success = success;
    }

    //----------------------------------------
    //  Static
    //----------------------------------------
    public static List<SaveResultWrapper> create(List<Database.SaveResult> srList)
    {
        List<SaveResultWrapper> result = new List<SaveResultWrapper>();

        for (Database.SaveResult sr : srList)
        {
            result.add(new SaveResultWrapper(sr));
        }

        return result;
    }

    @TestVisible
    private static SaveResultWrapper create(Id i, Boolean success)
    {
        return new SaveResultWrapper(i, success);
    }

    //----------------------------------------
    //  Public
    //----------------------------------------
    public List<Database.Error> getErrors()
    {
        if (save_result != null)
        {
            return save_result.getErrors();
        }
        else
        {
            // Can't create Database.Error.  Should we mock it?
            return new List<Database.Error>();
        }
    }

    public ID getID()
    {
        if (save_result != null)
        {
            return save_result.getID();
        }
        else
        {
            return sr_id;
        }
    }

    public Boolean isSuccess()
    {
        if (save_result != null)
        {
            return save_result.isSuccess();
        }
        else
        {
            return is_success;
        }
    }
}
