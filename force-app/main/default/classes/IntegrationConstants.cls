public with sharing class IntegrationConstants {
    public static final IntegrationConstants INSTANCE = new IntegrationConstants();
    public final CalloutMethod CALLOUT_METHOD = new CalloutMethod();
    public final NamedCredential NAMED_CREDENTIAL = new NamedCredential();
    public final Path PATH = new Path();
    public class CalloutMethod{
        public final String GET = 'GET';
        public final String POST = 'POST';
        public final String PATCH = 'PATCH';
    }

    public class NamedCredential{
        public final String SUPABASE = 'Supabase_API';    
    
    }

    public class Path{
        public final String SUPABASE_PATH = '/rest/v1/';
    }
    }
