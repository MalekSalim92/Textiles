public with sharing class HttpClient {
    private String endpoint;
     private Map<String,String> headers;
    private Integer timeout; 
    public HttpClient(String namedCredential , String path) {
        this.endpoint = 'callout:' + namedCredential + path;
        this.headers = new Map<String,String>();
        this.timeout = 120000;
    }

    public HttpResponse get(){
        return send('GET',null);
    }

    public HttpResponse post(String body){
        return send('POST',body);
    }

    private HttpResponse send(String method , String body){
        HttpRequest request = buildHttpRequest(method, body);
        Http http = new Http();
        try{
            return http.send(request);
        }
        catch(CalloutException e){
            throw new CalloutException(e.getMessage());
        }
    }

    private HttpRequest buildHttpRequest(String method , String body){
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod(method);

        for(String key : headers.keySet()){
            request.setHeader(key,headers.get(key));
        }
        if(body != null){
            request.setBody(body);
        }

        return request;
    }

    public HttpClient setHeader(String key , String value){
        headers.put(key,value);
        return this;
    }

    public HttpClient setTimeout(Integer timeout){
        this.timeout = timeout;
        return this;
    }
}