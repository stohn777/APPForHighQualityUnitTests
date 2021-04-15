public interface IEmailService
    extends IService
{
    void sendEmailToAccountsManager(List<Account> accountList);
}
