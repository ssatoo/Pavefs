//
//  RegistrationModel.swift
//  Pavefs
//


import UIKit

protocol RegistrationServiceDelegate
{
    func registrationService(alertMessage:String, moveForward:Bool)
}

class RegistrationModel: NSObject, ServiceAPICallDelegate
{

    var email: String!
    var password: String!
    var confirmPassword: String!
    var userCategory:String!
    var userCategoryID:String!
    var agreedTerms:Bool!
    
    var alertMessage: String!
    var delegate: RegistrationServiceDelegate!
    
    var arrCategoriesEN: Array<String>! = ["Trial", "Normal", "Advanced"]
    var arrCategoriesGR: Array<String>! = ["Δοκιμαστικός", "Κανονικός", "Προχωρημένος"]
    var arrCategories: Array<String>! = []
    override init()
    {
        super.init()
        
        self.email = ""
        self.password = ""
        self.confirmPassword = ""
        self.userCategory = ""
        self.userCategoryID = "-1"
        self.agreedTerms = false
        
        if(LocalizedGetLanguage() == "el")
        {
            self.arrCategories = self.arrCategoriesGR
        }
        else
        {
            self.arrCategories = self.arrCategoriesEN
        }
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
        
        if self.password.isEmpty
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
                if self.password != self.confirmPassword
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
    
    
    func validateUserCategory () -> Bool
    {
        var valid: Bool = true
        
        if self.userCategory.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("UserCategoryMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }

    func userAgreedToTerms () -> Bool
    {
        var valid: Bool = true
        
        if (self.agreedTerms == false)
        {
            valid = false
            self.alertMessage = LocalizedString("AgreeTermsOfUse", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    func setUserCategoryID()
    {
       
        if (self.userCategory == "Trial" || self.userCategory == "Δοκιμαστικός")
        {
            self.userCategoryID = "0"
        }
        else if (self.userCategory == "Normal" || self.userCategory == "Κανονικός")
        {
            self.userCategoryID = "1"
        }
        else if (self.userCategory == "Advanced" || self.userCategory == "Προχωρημένος")
        {
            self.userCategoryID = "2"
        }
    }
    
    func register()
    {
        self.setUserCategoryID()
        
       let serviceRequest = ServiceMethod.generateRegistrationRequest(self.email, password1:self.password, confirmPassword:self.confirmPassword, userCategory:self.userCategoryID,  deviceType:globalConstants.deviceType, languageCode:Settings.fetchDeviceLanguage())
        
        let serviceCall:ServiceAPI = ServiceAPI()
        serviceCall.apiDelegate = self;
        serviceCall.sendRequestToServer(serviceRequest, operationName:apiMethod.REGISTRATION_API)
    }
    
    func serviceCallDidFinish(response:String, operationName:String)
    {
        let responseDic:Dictionary <String, String> = Utility.responseStringToDictionary(response)
        
        if(responseDic["success"] == "true")
        {
            delegate.registrationService("Registration Successful", moveForward:true)
        }
        else
        {
            delegate.registrationService("Registration Failed", moveForward:false)
        }

      
        
        
        
        
    }
    
    func serviceCallDidFail(error:String, operationName:String)
    {
        delegate.registrationService(error, moveForward:false)
    }
}
