public without sharing class ProductSelector {

private Static final ProductSelector INSTANCE = new ProductSelector();
public static ProductSelector getInstance(){
    return INSTANCE;
}
private ProductSelector(){}

public List<Product2> selectByNames(set<String> productNames){
    return [SELECT Id FROM Product2 WHERE Name IN :productNames];
}
}