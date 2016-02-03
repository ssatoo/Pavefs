//
//  ServiceAPI.swift
//  Pavefs
//


import UIKit
import SystemConfiguration

public class Reachability {
    
    class func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }
        var flags = SCNetworkReachabilityFlags()
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
}

struct connectionInfo
{
    //"http://pavefs-cms.upatras.gr/user/"
    static let WEBERVICE_PRODUCTION_SERVER_URL = "http://pavefs-cms.upatras.gr/user/" //"http://staging.pavefs.org/user/"
    static let WEBERVICE_DEVELOPMENT_SERVER_URL = "http://pavefs-cms.upatras.gr/user/"//"http://staging.pavefs.org/user/"
    static let HTTP_HEADER_ENCODING = "application/json; charset=utf-8"
    static let HTTP_CONTENT_TYPE = "Content-Type"
    static let HTTP_SOAPACTION_TYPE = "SOAPAction"
    static let HTTP_CONTENT_LENGTH = "Content-Length"
    static let HTTP_METHOD = "POST"
    
   
    
}

protocol ServiceAPICallDelegate
{
    func serviceCallDidFinish(response:String, operationName:String)
    func serviceCallDidFail(error:String, operationName:String)
}

class ServiceAPI: NSObject
{
    var apiDelegate : ServiceAPICallDelegate!
    var mutableData:NSMutableData  = NSMutableData()
    var operationName: String = ""
    
    override init() {
        super.init()
        
    }
    
    func sendRequestToServer (request:String, operationName:String)
    {
        
        if(Reachability.isConnectedToNetwork())
        {
            self.operationName = operationName;
            
            let httpRequest:NSMutableURLRequest = NSMutableURLRequest()
            
            httpRequest.URL = NSURL(string:String(format:"%@%@", connectionInfo.WEBERVICE_DEVELOPMENT_SERVER_URL, operationName))
            
            httpRequest.HTTPMethod = "POST"
            httpRequest.HTTPBody = request.dataUsingEncoding(NSUTF8StringEncoding);
            print("httpRequest :\(httpRequest)")
            
            let conn:NSURLConnection = NSURLConnection(request:httpRequest, delegate:self, startImmediately:true)!
            
            conn.start()
        }
        else
        {
            apiDelegate.serviceCallDidFail("NoInternetAccess", operationName:self.operationName)
        }
        
        
        
    }
    

    
    func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        mutableData.length = 0;
    }
    
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        mutableData.appendData(data)
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError)
    {
        print("Error :- " + error.description)
        apiDelegate.serviceCallDidFail(error.description, operationName:self.operationName)
       
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
    
        
        let response = NSString(data:mutableData, encoding: NSUTF8StringEncoding) as! String
      //  print("Response For Operation \(operationName) :- " + response)
        
        
        
        
        if let delegate = self.apiDelegate
        {
            delegate.serviceCallDidFinish(response, operationName:self.operationName)
        }
        
    }

}
