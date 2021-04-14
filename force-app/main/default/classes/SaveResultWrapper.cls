public inherited sharing class SaveResultWrapper
{
    private Database.SaveResult save_result = null;

    private List<Database.Error> mock_errors = null;
    private ID sr_id = null;
    private Boolean is_success;

    private SaveResultWrapper(Database.SaveResult sr)
    {
        save_result = sr;
    }

    private SaveResultWrapper(List<Database.Error> errorList, Id i, Boolean success)
    {
        mock_errors = errorList;
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
    private static SaveResultWrapper create(List<Database.Error> errorList, Id i, Boolean success)
    {
        return new SaveResultWrapper(errorList, i, success);
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
            return mock_errors;
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
