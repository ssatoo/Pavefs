//
//  PasswordModel.swift
//  Pavefs
//


import UIKit

protocol PasswordServiceDelegate
{
    func passwordService(alertMessage:String, moveForward:Bool)
}

class PasswordModel: NSObject, ServiceAPICallDelegate
{

    var email: String!
    var newPassword: String!
    var confirmPassword: String!
    
    var alertMessage: String!
    var delegate: PasswordServiceDelegate!
    
    override init() {
        super.init()
        
        self.email = ""
        self.newPassword = ""
        self.confirmPassword = ""
        self.alertMessage = ""
    }
    
    
    func validateEmail () -> Bool
    {
        var valid: Bool = true
        
        if self.email.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("EmailMissing", comment:"")
        }
        else
        {
            if(Utility.isValidEmail(self.email) == false)
            {
                valid = false
                self.alertMessage = LocalizedString("NotValidEmail", comment:"")
            }
            else
            {
                valid = true
            }
        }
        
        return valid
    }
    
    func validatePassword () -> Bool
    {
        var valid: Bool = true
        
        if self.newPassword.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("PasswordMissing", comment:"")
        }
        else
        {
            
            if self.confirmPassword.isEmpty
                
            {
                valid = false
                self.alertMessage = LocalizedString("ConfirmPasswordMissing", comment:"")
            }
            else
            {
                if self.newPassword != self.confirmPassword
                {
                    valid = false
                    self.alertMessage = LocalizedString("PasswordDoesNotMatch", comment:"")
                }
                else
                {
                    valid = true
                }
            }
            
        }
        
        return valid
    }
    
    
    func changePassword()
    {
        
        let serviceRequest = ServiceMethod.generateChangePasswordRequest(Settings.getToken(), email:self.email, newPassword:self.newPassword, confirmPassword:self.confirmPassword, deviceType:globalConstants.deviceType)
        
        let serviceCall:ServiceAPI = ServiceAPI()
        serviceCall.apiDelegate = self;
        serviceCall.sendRequestToServer(serviceRequest, operationName:apiMethod.CHANGE_PASSWORD_API)
        
       
    }
    
    func serviceCallDidFinish(response:String, operationName:String)
    {
        
       
        let responseDic:Dictionary <String, String> = Utility.responseStringToDictionary(response)
        
        if(responseDic["success"] == "true")
        {
            
            delegate.passwordService(LocalizedString("PasswordChangedSuccessfully", comment:""), moveForward:true)
        }
        else
        {
            var message:String = LocalizedString("ChangePasswordFailed", comment:"")
            
            if(responseDic["reason"] != nil)
            {
                message = responseDic["reason"]!
            }
            
            delegate.passwordService(message, moveForward:false)
        }
        
        
    }
    
    func serviceCallDidFail(error:String, operationName:String)
    {
        delegate.passwordService(error, moveForward:false)
    }
}
