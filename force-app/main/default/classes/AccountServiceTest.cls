@IsTest
private class AccountServiceTest

{
    @IsTest
    private static void createOrderForNewAccountSwag_withInstance()
    {
        ServiceFactory.setMock(ISwagService.class, new MockSwagService());

        AccountService.newInstance().createOrderForNewAccountSwag(new List<Account>());
    }

    @IsTest
    private static void createOrderForNewAccountSwag_withoutInstance()
    {
        ServiceFactory.setMock(ISwagService.class, new MockSwagService());

        try
        {
            AccountService.newInstance().createOrderForNewAccountSwag(null);
            System.assert(false, 'Execution should have failed');
        }
        catch (AccountService.AccountServiceException ase)
        {
            // As expected
        }
    }

    @IsTest
    private static void sendEmailToAccountsManager_withInstance()
    {
        ServiceFactory.setMock(IEmailService.class, new MockEmailService());

        AccountService.newInstance().sendEmailToAccountsManager(new List<Account>());
    }

    @IsTest
    private static void sendEmailToAccountsManager_withoutInstance()
    {
        ServiceFactory.setMock(IEmailService.class, new MockEmailService());

        try
        {
            AccountService.newInstance().sendEmailToAccountsManager(null);
            System.assert(false, 'Execution should have failed');
        }
        catch (AccountService.AccountServiceException ase)
        {
            // As expected
        }
    }

    @IsTest
    private static void triggerHandler()
    {
        ServiceFactory.setMock(IEmailService.class, new MockEmailService());
        ServiceFactory.setMock(ISwagService.class, new MockSwagService());

        AccountService.newInstance().triggerHandler_afterInsert(new List<Account>());
    }

    private class MockEmailService
        implements IEmailService
    {
        public void sendEmailToAccountsManager(List<Account> accountList)
        {
            // Doing nothing intentionally
        }
    }

    private class MockSwagService
        implements ISwagService
    {
        public void sendNewAccountSwag(List<Account> accountList)
        {
            // Doing nothing intentionally
        }
    }
}
