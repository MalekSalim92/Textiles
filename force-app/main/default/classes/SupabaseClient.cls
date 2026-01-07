public with sharing class SupabaseClient {


public static List<SupabaseWrapper> getRecords(String tableName){
    HttpResponse response = getResponse(tableName);
    return parseResponse(response);
}

private static HttpResponse getResponse (String tableName){
    String path = ConstantsService.INTEGRATION.PATH.SUPABASE_PATH + tableName;
    HttpClient client = new HttpClient(ConstantsService.INTEGRATION.NAMED_CREDENTIAL.SUPABASE,path);
    HttpResponse response =  client.get();
    if(response.getStatusCode() < 200 || response.getStatusCode() >= 300){
        throw new SupabaseException ('Supabase API error : ' + response.getStatusCode());
    }
    return response;
}
private static List<SupabaseWrapper> parseResponse(HttpResponse response){
    return (List<SupabaseWrapper>) JSON.deserialize(response.getBody(),List<SupabaseWrapper>.class);
}

public class SupabaseWrapper{
    public Integer id;
    public String created_at;
    public String Name;
}

public class SupabaseException extends Exception{}
}