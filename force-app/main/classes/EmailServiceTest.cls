@IsTest
private class EmailServiceTest
{
    @IsTest
    private static void test()
    {
        EmailService.newInstance().sendEmailToAccountsManager(new List<Account>());
    }
}
