public inherited sharing class EmailService
    implements IEmailService
{
    //----------------------------------------
    //  Factory
    //----------------------------------------
    public static IEmailService newInstance()
    {
        if (mock_email_service != null)
        {
            return (IEmailService) mock_email_service;
        }

        return new EmailService();
    }

    private static IEmailService mock_email_service = null;

    public static void setMock(IEmailService mockService)
    {
        mock_email_service = mockService;
    }

    private EmailService()
    {
        // Intentionally blank
    }

    //----------------------------------------
    //  Public
    //----------------------------------------

    public void sendEmailToAccountsManager(List<Account> accountList)
    {
        // Does a lot of native Salesforce work that need not be tested
    }
}
