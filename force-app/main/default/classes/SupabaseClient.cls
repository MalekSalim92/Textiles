public with sharing class SupabaseClient {


public static List<SupabaseWrapper> getRecords(String tableName){
    HttpResponse response = getResponse(tableName);
    List<SupabaseWrapper> r = parseResponse(response);
    System.debug('r >>>> '  + r);
    return parseResponse(response);
}

private static HttpResponse getResponse (String tableName){
    String path = '/rest/v1/' + tableName;
    HttpClient client = new HttpClient('Supabase_API',path);
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