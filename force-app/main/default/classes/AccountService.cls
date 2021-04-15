public inherited sharing class AccountService
    implements IAccountService
{
    //----------------------------------------
    //  Factory
    //----------------------------------------
    public static IAccountService newInstance()
    {
        if (mock_account_service != null)
        {
            return mock_account_service;
        }

        return new AccountService();
    }

    private static IAccountService mock_account_service = null;

    public static void setMock(IAccountService mockService)
    {
        mock_account_service = mockService;
    }

    private AccountService()
    {
        // department = AppService.getDepartment();
        // region = AppService.getRegion();
    }

    //----------------------------------------
    //  Public
    //----------------------------------------
    public void createOrderForNewAccountSwag(List<Account> accountList)
    {
        if (accountList == null)
        {
            throw new AccountServiceException('An instance of "accountList" must be provided');
        }

        SwagService.newInstance().sendNewAccountSwag(accountList);
    }

    public void sendEmailToAccountsManager(List<Account> accountList)
    {
        if (accountList == null)
        {
            throw new AccountServiceException('An instance of "accountList" must be provided');
        }

        EmailService.newInstance().sendEmailToAccountsManager(accountList);
    }

    //----------------------------------------
    //  Trigger Handler
    //----------------------------------------
    private List<Account> newList;
    private Map<Id, Account> newMap;
    private List<Account> oldList;
    private Map<Id, Account> oldMap;
    private Boolean isBefore = false;
    private Boolean isAfter = false;
    private Boolean isInsert = false;
    private Boolean isUpdate = false;
    private Boolean isDelete = false;

    public void triggerHandler()
    {
        newList = (List<Account>) Trigger.new;
        newMap = (Map<Id, Account>) Trigger.newMap;
        oldList = (List<Account>) Trigger.old;
        oldMap = (Map<Id, Account>) Trigger.oldMap;
        isBefore = false && Trigger.isBefore;
        isAfter = false && Trigger.isAfter;
        isInsert = false && Trigger.isInsert;
        isUpdate = false && Trigger.isUpdate;
        isDelete = false && Trigger.isDelete;

        if (isAfter && isInsert)
        {
            triggerHandler_afterInsert(newList);
        }
    }

    private void triggerHandler_afterInsert(List<Account> newAccountList)
    {
        sendEmailToAccountsManager(newAccountList);
        createOrderForNewAccountSwag(newAccountList);
    }

    //----------------------------------------
    //  Private
    //----------------------------------------
    private String department = null;
    private String region = null;

    //----------------------------------------
    //  Exceptions
    //----------------------------------------
    public class AccountServiceException
        extends Exception
    {
        // Intentionally blank
    }
}
