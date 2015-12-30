//
//  LoginModel.swift
//  Pavefs
//

import UIKit

protocol LoginServiceDelegate
{
    func loginService(alertMessage:String, moveForward:Bool)
}

class LoginModel: NSObject, ServiceAPICallDelegate
{

    var username: String!
    var password: String!
    
    var alertMessage: String!
    var delegate: LoginServiceDelegate!
    
    override init() {
        super.init()
        
        self.username = ""
        self.password = ""
        self.alertMessage = ""
    }
    
    
    
    func validateUsername () -> Bool
    {
        var valid: Bool = true
        
        if self.username.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("UsernameMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    func validatePassword () -> Bool
    {
        var valid: Bool = true
        
        if self.password.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("PasswordMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }

    
    func login()
    {
        /*let loginDic = ["username":"name","password":"pass","lang":"gr","device_type":"mobile"]
        let requestJSON = JSONDictionary(dict:loginDic)
       
        
        var jsonRequestString:String = ""
        do{
            jsonRequestString = try requestJSON.stringify()
            print(jsonRequestString)
        }
        catch _
        {
            print("Something went wrong")
        }
        */
        
        let serviceRequest = ServiceMethod.generateLoginRequest(self.username, password:self.password, languageCode: Settings.fetchDeviceLanguage(), deviceType:globalConstants.deviceType)
        
        let serviceCall:ServiceAPI = ServiceAPI()
        serviceCall.apiDelegate = self;
        serviceCall.sendRequestToServer(serviceRequest, operationName:apiMethod.LOGIN_API)
        
        /*let serviceRequest = ServiceMethod.generateRegistrationRequest("tester@gmail.com", password1:"tester", password2:"tester", userCategory:"1",  deviceType:"mobile", languageCode: "gr")
        
        let serviceCall:ServiceAPI = ServiceAPI()
        serviceCall.apiDelegate = self;
        serviceCall.sendRequestToServer(serviceRequest, operationName:apiMethod.REGISTRATION_API)*/
    }
    
    func serviceCallDidFinish(response:String, operationName:String)
    {
        
       
        let responseDic:Dictionary <String, String> = Utility.responseStringToDictionary(response)
        
        if(responseDic["success"] == "true")
        {
            Settings.setToken(responseDic["token"]!)
            Settings.setUserEmail(self.username)
            delegate.loginService("", moveForward:true)
        }
        else
        {
            delegate.loginService("Login Failed", moveForward:false)
        }
        
        
    }
    
    func serviceCallDidFail(error:String, operationName:String)
    {
        delegate.loginService(error, moveForward:false)
    }
}
