public with sharing class ProductConstants {
    public static final ProductConstants INSTANCE = new ProductConstants();
    
    public final RecordType RECORD_TYPE = new RecordType();    
    public class RecordType{
        public final String HARDWARE = 'Hardware';
    }
}