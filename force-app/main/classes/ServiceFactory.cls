public inherited sharing class ServiceFactory
{
    private static Map<String, String> serviceMap = new Map<String, String>();
    private static Map<String, IService> mock_serviceMap = new Map<String, IService>();

    static
    {
        // Ideally these would be dynamically loaded, e.g. Custom Metadata
        serviceMap.put('IContactSelector', 'ContactSelector');
        serviceMap.put('IContactService', 'ContactService');
        serviceMap.put('IDatabaseWrapper', 'DatabaseWrapper');
        serviceMap.put('IEmailService', 'EmailService');
        serviceMap.put('IRandomStringConsumer', 'RandomStringConsumer');
        serviceMap.put('IRandomStringService', 'RandomStringService');
        serviceMap.put('ISwagService', 'SwagService');
        serviceMap.put('IUnitOfWork', 'UnitOfWork');
    }

    public static IService newInstance(System.Type t)
    {
        if (mock_serviceMap.containsKey(t.getName()))
        {
            return mock_serviceMap.get(t.getName());
        }

        Type tyype = Type.forName(serviceMap.get(t.getName()));
        return (IService) tyype.newInstance();
    }

    @TestVisible
    private static void setMock(Type t, IService mock_service)
    {
        mock_serviceMap.put(t.getName(), mock_service);
    }
}
