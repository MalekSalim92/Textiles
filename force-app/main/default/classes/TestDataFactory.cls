public with sharing class TestDataFactory {

    public static  ProductBuilder product(){
        return new ProductBuilder();

    }

    public class ProductBuilder{
        private Product2 product = new Product2();
        private Integer count = 1;

        public ProductBuilder(){
            this.product.Name = 'Default Product';
            this.product.isActive = false;
        }

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

        public List<Product2> build(Boolean doInsert){
            List<Product2> productsToInsert = new List<Product2>();
            for(Integer i = 0 ; i< count ; i ++){
                Product2 product = this.product.clone(false,true);
                product.Name = this.product.Name + '_' + i;
                productsToInsert.add(product);
            }
            
            if(doInsert) insert productsToInsert;
            return productsToInsert;
        }

    }

}