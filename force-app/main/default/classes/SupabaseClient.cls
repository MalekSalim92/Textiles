public with sharing class SupabaseClient {

public static List<SupabaseWrapper> getRecords(String tableName){
    HttpResponse response = getResponse(tableName);
    return parseResponse(response);
}


private static HttpResponse getResponse (String tableName){
    HttpClient client = buildClient(tableName);
    HttpResponse response =  client.get();
    if(response.getStatusCode() < 200 || response.getStatusCode() >= 300){
        throw new SupabaseException ('Supabase API error : ' + response.getStatusCode());
    }
    return response;
}

private static HttpClient buildClient(String tableName){
    String path = ConstantsService.INTEGRATION.PATH.SUPABASE_PATH + tableName;
    return new HttpClient(ConstantsService.INTEGRATION.NAMED_CREDENTIAL.SUPABASE,path);

}
private static List<SupabaseWrapper> parseResponse(HttpResponse response){
    return (List<SupabaseWrapper>) JSON.deserialize(response.getBody(),List<SupabaseWrapper>.class);
}


public static void postRecords(List<SObject> recordsToInsert, String tableName){
    HttpClient client = buildClient(tableName); 
    List<Map<String,Object>> payload = buildPayload(recordsToInsert);
    HttpResponse response = client.post(JSON.serialize(payload));
    

}

private static List<Map<String,Object>> buildPayload(List<SObject> recordsToInsert){

    List<Map<String,Object>> payload = new List<Map<String,Object>>();
    for(SObject record : recordsToInsert){
        Map<String,Object> fields = new Map<String,Object>();
        fields.put('name',record.get('Name'));
        payload.add(fields);
    }
    return payload;


}
public class SupabaseWrapper{
    public Integer id;
    public String created_at;
    public String name;
}

public class SupabaseException extends Exception{}
}