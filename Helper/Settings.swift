//
//  Settings.swift
//  Pavefs
//


import UIKit

class Settings: NSObject
{
    private static var UserCategory :String!
    static func fetchDeviceLanguage() -> String
    {
        let pre = NSLocale.preferredLanguages()[0]
        var deviceLanaguage:String! = nil;
        if pre == "el"
        {
            deviceLanaguage = "gr"
        }
        else
        {
            deviceLanaguage = "en"
        }
     
        return deviceLanaguage
    }
    
    
    static func setToken (token:String)
    {
        let ud = NSUserDefaults.standardUserDefaults()
        ud.setObject(token, forKey: "Token")
        ud.setBool(true, forKey: "UserLoggedIn")
    }
    
    static func getToken () -> String
    {
        let ud = NSUserDefaults.standardUserDefaults()
        var token:String = "No Token"
        if let storedToken = ud.objectForKey("Token")
        {
            token = storedToken as! String
        }
        

        return token
    }
    
    
    static func userLoggedIn () -> Bool
    {
         return NSUserDefaults.standardUserDefaults().boolForKey("UserLoggedIn")
    }
    
    static func setUserEmail (email:String)
    {
        let ud = NSUserDefaults.standardUserDefaults()
        ud.setObject(email, forKey: "UserEmail")
    }
    
    static func getUserEmail () -> String
    {
        let ud = NSUserDefaults.standardUserDefaults()
        var userEmail:String = "No Email"
        if let email = ud.objectForKey("UserEmail")
        {
            userEmail = email as! String
        }
        
        
        return userEmail
    }
    
    static func userLoggedOut ()
    {
        let ud = NSUserDefaults.standardUserDefaults()
        ud.setObject("No Token", forKey: "Token")
        ud.setBool(false, forKey: "UserLoggedIn")
    }
    
    static func startLoader()
    {
        dispatch_async(dispatch_get_main_queue()) { 
            PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
            PKHUD.sharedHUD.show()
        }
    }
    
    static func stopLoader()
    {
        dispatch_async(dispatch_get_main_queue()) {
            
            PKHUD.sharedHUD.hide()
        }
    }
    
    static func getFile(filename:String) ->String
    {
        return NSBundle.mainBundle().pathForResource(filename, ofType: "xml")!
        
    }
    static func getFilePath (fileName:String) -> String
    {
        var path:String! = ""
        
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            path = dir.stringByAppendingPathComponent(fileName);
        }
        
        return path
    }
    
    
    
    
    static func SetUserCategory (UCategory:String){
        UserCategory = UCategory
    }
    
    static func GetUserCategory () -> String {
        return UserCategory
    
    }
    
    

}
