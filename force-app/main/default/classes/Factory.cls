public inherited sharing class Factory
{
    private static Map<String, String> serviceMap = new Map<String, String>();
    private static Map<String, IService> mock_serviceMap = new Map<String, IService>();

    static
    {
        // Ideally these would be dynamically loaded, e.g. Custom Metadata
        serviceMap.put('IDatabaseWrapper', 'DatabaseWrapper');
        serviceMap.put('IEmailService', 'EmailService');
        serviceMap.put('ISwagService', 'SwagService');
    }

    private static IService newServiceInstance(Type t)
    {
        if (mock_serviceMap.containsKey(t.getName()))
        {
            return mock_serviceMap.get(t.getName());
        }

        Type tyype = Type.forName(serviceMap.get(t.getName()));
        return (IService) tyype.newInstance();
    }

    private static void setServiceMock(Type t, IService mock_service)
    {
        mock_serviceMap.put(t.getName(), mock_service);
    }
}
