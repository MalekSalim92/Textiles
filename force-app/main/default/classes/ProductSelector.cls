public without sharing class ProductSelector {

private static final ProductSelector INSTANCE = new ProductSelector();
public static ProductSelector getInstance(){
    return INSTANCE;
}
private ProductSelector(){}

public List<Product2> selectByNames(set<String> productNames){
    return [SELECT Id FROM Product2 WHERE Name IN :productNames AND isActive = true];
}

public List<Product2> selectActive(){
    return [SELECT Id,Name FROM Product2 WHERE IsActive = true];
}

public List<Product2> selectHardware(){
    return [SELECT Id,Name,Family FROM Product2 WHERE Family = :ConstantsService.PRODUCT.RECORD_TYPE.HARDWARE AND isActive = true];
}
}