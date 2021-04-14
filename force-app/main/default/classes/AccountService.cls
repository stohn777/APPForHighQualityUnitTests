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
        SwagService.newInstance().sendNewAccountSwag(accountList);
    }

    public void sendEmailToAccountsManager(List<Account> accountList)
    {
        EmailService.newInstance().sendEmailToAccountsManager(accountList);
    }

    public void triggerHandler_afterInsert(List<Account> newAccountList)
    {
        sendEmailToAccountsManager(newAccountList);
        createOrderForNewAccountSwag(newAccountList);
    }

    //----------------------------------------
    //  Private
    //----------------------------------------
    private String department = null;
    private String region = null;
}