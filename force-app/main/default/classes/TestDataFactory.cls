public with sharing class TestDataFactory {

    public static  ProductBuilder product(){
        return new ProductBuilder();

    }

    public class ProductBuilder{
        private Product2 product = new Product2(Name = 'Default Product', isActive = false);
        private Integer count = 1;
        private Boolean doInsert = false;

        public ProductBuilder withName (String name){
            this.product.Name = name;
            return this;
        }
        public ProductBuilder isActive (){
            this.product.isActive  = true;
            return this;
        }
        public ProductBuilder withFamily(String family){
            this.product.Family = family;
            return this;
        }
        public ProductBuilder count(Integer count){
            this.count = count;
            return this;
        }
        public ProductBuilder save(){
            this.doInsert = true;
            return this;
        }

        public List<Product2> build(){
            return (List<Product2>) buildRecords(product, this.count, doInsert);
    
        }
        }

    
    public static AccountBuilder account(){
        return new AccountBuilder();
    }

    public class AccountBuilder{
        private Account account = new Account(Name = 'Default Name');
        private Integer count = 1;
        private Boolean doInsert = false;

    public AccountBuilder withName(String name){
        this.account.Name = name;
        return this;
    }
    public AccountBuilder count(Integer count){
        this.count = count;
        return this;
    }

    public AccountBuilder save(){
        this.doInsert = true;
        return this;
    }
    public List<Account> build(){
        return (List<Account>) buildRecords(account, this.count, doInsert);

    }

    }

    private static List<SObject> buildRecords(SObject record , Integer count , Boolean doInsert){
        List<SObject> sObjectToReturn = new List<SObject>();
        for(Integer i = 0 ; i < count ; i++){
            SObject newRecord = record.clone(false,true);
            newRecord.put('Name',record.get('Name'));
            sObjectToReturn.add(newRecord);
        }
        if(doInsert) insert sObjectToReturn;
        return sObjectToReturn;
    }

}