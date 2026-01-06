public with sharing class ConstantsService {

    public static final IntegrationConstants INTEGRATION{
        get{
            return IntegrationConstants.INSTANCE;
        }
    }

    public static final ProductConstants PRODUCT{
        get{
            return ProductConstants.INSTANCE;
        }
    }
}