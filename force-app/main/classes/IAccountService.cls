public interface IAccountService
{
    void createOrderForNewAccountSwag(List<Account> accountList);
    void sendEmailToAccountsManager(List<Account> accountList);
    void triggerHandler();
}
