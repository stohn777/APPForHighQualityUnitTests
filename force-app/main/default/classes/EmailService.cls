public inherited sharing class EmailService
    implements IEmailService
{
    //----------------------------------------
    //  Factory
    //----------------------------------------
    public static IEmailService newInstance()
    {
        return (IEmailService) ServiceFactory.newInstance(IEmailService.class);
    }

    //----------------------------------------
    //  Public
    //----------------------------------------

    public void sendEmailToAccountsManager(List<Account> accountList)
    {
        // Does a lot of native Salesforce work that need not be tested
    }
}
