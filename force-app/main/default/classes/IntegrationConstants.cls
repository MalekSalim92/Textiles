public with sharing class IntegrationConstants {
    public static final IntegrationConstants INSTANCE = new IntegrationConstants();
    public final calloutMethod CALLOUT_METHOD = new calloutMethod();
    public final namedCredential NAMED_CREDENTIAL = new namedCredential();
    public class calloutMethod{
        public final String GET = 'GET';
        public final String POST = 'POST';
        public final String PATCH = 'PATCH';
    }

    public class namedCredential{
        public final String SUPABASE = 'JJJJ';
    }
    }
