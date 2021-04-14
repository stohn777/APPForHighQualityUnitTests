public inherited sharing class SwagService
    implements ISwagService
{
    //----------------------------------------
    //  Factory
    //----------------------------------------
    public static ISwagService newInstance()
    {
        if (mock_swag_service != null)
        {
            return (ISwagService) mock_swag_service;
        }

        return new SwagService();
    }

    private static ISwagService mock_swag_service = null;

    public static void setMock(ISwagService mockService)
    {
        mock_swag_service = mockService;
    }

    private SwagService()
    {
        // Intentionally blank
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
