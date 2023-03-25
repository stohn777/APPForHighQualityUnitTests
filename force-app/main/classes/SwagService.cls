public inherited sharing class SwagService
    implements ISwagService
{
    //----------------------------------------
    //  Factory
    //----------------------------------------
    public static ISwagService newInstance()
    {
        return (ISwagService) ServiceFactory.newInstance(ISwagService.class);
    }

    //----------------------------------------
    //  Public
    //----------------------------------------
    public void sendNewAccountSwag(List<Account> accountList)
    {
        List<Order> orderList = new List<Order>();

        for (Account acct : accountList)
        {
            orderList.add(
                new Order(
                    AccountId = acct.Id,
                    Description = 'Order some swag for ' + acct.name
                )
            );
        }

        DatabaseWrapper.newInstance().db_insert(orderList);
    }
}
