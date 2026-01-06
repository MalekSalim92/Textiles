@isTest
public with sharing class ProductSelector_Test {
    private static final Integer count = 200;
    @TestSetup
    static void makeData(){
        List<Product2> products = TestDataFactory.product().withName('Peanuts').isActive().count(count).build(true);
        List<Product2> activeProducts = TestDataFactory.product().withName('Active').isActive().count(count).build(true);
        List<Product2> hardwareProducts = TestDataFactory.product().withFamily(ConstantsService.PRODUCT.RECORD_TYPE.HARDWARE).isActive().count(count).build(true);
    }

    @isTest
    static void selectByNameTest(){
        Set<String> productNames = new Set<String>();
        for(Integer i =0  ; i < count ; i ++){
            productNames.add('Peanuts_' + i);
        }
        productNames.add('Non Exisitng Product');
        Test.startTest();
        List<Product2> returnedProducts = ProductSelector.getInstance().selectByNames(productNames);
        Test.stopTest();

        System.assertEquals(returnedProducts.size() , count , 'Should find exactly the number of products inserted' + count );
    }

    @isTest
    static void selectActiveTest(){
        Test.startTest();
        List<Product2> returnedActiveProducts = ProductSelector.getInstance().selectActive();
        Test.stopTest();
        Integer activeFound = 0;
        for(Product2 product : returnedActiveProducts){
            if(product.Name.contains('Active')) activeFound ++;
        } 
        System.assertEquals(activeFound, count, 'Should find exactly the number of peanuts products inserted' + count );
    }
    @isTest
    static void selectHardwareTest(){
        Test.startTest();
        List<Product2> returnedHardwareProducts = ProductSelector.getInstance().selectHardware();
        Test.stopTest();
        System.assertEquals(returnedHardwareProducts.size(), count, 'Should find exactly the number of products inserted' + count );

        for(Product2 product : returnedHardwareProducts) {
            System.assertEquals(ConstantsService.PRODUCT.RECORD_TYPE.HARDWARE, product.Family, 'Every record must be' + ConstantsService.PRODUCT.RECORD_TYPE.HARDWARE + 'family');
        }
    }
}