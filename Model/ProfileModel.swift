//
//  ProfileModel.swift
//  Pavefs
//


import UIKit

protocol ProfileServiceDelegate
{
    func profileService(operationName:String, alertMessage:String, moveForward:Bool)
}

class ProfileModel: NSObject, ServiceAPICallDelegate
{

  
    var user:User = User()
    var alertMessage: String!
    var delegate: ProfileServiceDelegate!
    
    override init() {
        super.init()
        
        
        self.alertMessage = ""
    }
    
    
    func validateName () -> Bool
    {
        var valid: Bool = true
        
        if self.user.user_name.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("NameMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    func validateSurname () -> Bool
    {
        var valid: Bool = true
        
        if self.user.user_surname.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("SurnameMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    func validateEmail () -> Bool
    {
        var valid: Bool = true
        
        if self.user.user_email.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("EmailMissing", comment:"")
        }
        else
        {
            if(Utility.isValidEmail(self.user.user_email) == false)
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
        
        if self.user.user_pass.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("PasswordMissing", comment:"")
        }
        else
        {
            
            if self.user.confirm_password.isEmpty
                
            {
                valid = false
                self.alertMessage = LocalizedString("ConfirmPasswordMissing", comment:"")
            }
            else
            {
                if self.user.user_pass != self.user.confirm_password
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
    
    
    func validateGender () -> Bool
    {
        var valid: Bool = true
        
        if self.user.sex.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("GenderMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    func validateBirthdate () -> Bool
    {
        var valid: Bool = true
        
        if self.user.birth_year.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("BirthDateMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    func validatePhone () -> Bool
    {
        var valid: Bool = true
        
        if self.user.phone.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("PhoneMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    
    func validateFax () -> Bool
    {
        var valid: Bool = true
        
        if self.user.fax.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("FaxMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    func validateAddress () -> Bool
    {
        var valid: Bool = true
        
        if self.user.address.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("AddressMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    
    func validateAreaLocation () -> Bool
    {
        var valid: Bool = true
        
        if self.user.address2.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("AreaLocationMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    
    func validatePostcode () -> Bool
    {
        var valid: Bool = true
        
        if self.user.postcode.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("PostcodeMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    
    func validateCity () -> Bool
    {
        var valid: Bool = true
        
        if self.user.city.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("CityMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    func validateArea () -> Bool
    {
        var valid: Bool = true
        
        if self.user.area.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("AreaMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    func validateCountry () -> Bool
    {
        var valid: Bool = true
        
        if self.user.country.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("CountryMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    func validateTimezone () -> Bool
    {
        var valid: Bool = true
        
        if self.user.timezone.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("TimezoneMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    
    func validateProfession () -> Bool
    {
        var valid: Bool = true
        
        if self.user.profession.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("ProfessionMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    
    func validateEducationLevel () -> Bool
    {
        var valid: Bool = true
        
        if self.user.education_level.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("EducationLevelMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    func validatePersonalID () -> Bool
    {
        var valid: Bool = true
        
        if self.user.personal_ID.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("PersonalIDMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    
    func validateYearsOfExperience () -> Bool
    {
        var valid: Bool = true
        
        if self.user.years_of_experience.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("YearsOfExperienceMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    

    
    
    func retrieveUserProfile()
    {
        
        let serviceRequest = ServiceMethod.generateUserProfileRequest(Settings.getToken(),deviceType:globalConstants.deviceType)
        
        let serviceCall:ServiceAPI = ServiceAPI()
        serviceCall.apiDelegate = self;
        serviceCall.sendRequestToServer(serviceRequest, operationName:apiMethod.RETRIEVE_PROFILE_API)
        
       
    }
    
    func updateUserProfile()
    {
        
        /*let serviceRequest = ServiceMethod.generateUpdateProfileRequest(Settings.getToken(), name:self.user.user_name, surname:self.user.user_surname, email:self.user.user_email, password:self.user.user_pass, confirmPassword:self.user.confirm_password, gender:self.user.sex, birthdate:self.user.birth_year, phone:self.user.phone, fax:self.user.fax, address:self.user.address, address2:self.user.address2, postcode:self.user.postcode, city:self.user.city, area:self.user.area, country:self.user.country, timezone:self.user.timezone, profession:self.user.profession, educationLevel:self.user.education_level, personalID:self.user.personal_ID, yearsOfExperience:self.user.years_of_experience, deviceType:globalConstants.deviceType)*/
        
        let serviceRequest = ServiceMethod.generateUpdateProfileRequest(Settings.getToken(), name:self.user.user_name, surname:self.user.user_surname, email:"", password:"", confirmPassword:"", gender:self.user.sex, birthdate:self.user.birth_year, phone:self.user.phone, fax:self.user.fax, address:self.user.address, address2:self.user.address2, postcode:self.user.postcode, city:self.user.city, area:self.user.area, country:self.user.country, timezone:self.user.timezone, profession:self.user.profession, educationLevel:self.user.education_level, personalID:self.user.personal_ID, yearsOfExperience:self.user.years_of_experience, deviceType:globalConstants.deviceType)
        
        print("serviceRequest \(serviceRequest)")
        
        let serviceCall:ServiceAPI = ServiceAPI()
        serviceCall.apiDelegate = self;
        serviceCall.sendRequestToServer(serviceRequest, operationName:apiMethod.UPDATE_PROFILE_API)
        
        
    }
    
    func serviceCallDidFinish(response:String, operationName:String)
    {
        
        if(operationName == apiMethod.RETRIEVE_PROFILE_API)
        {
            let responseDic:Dictionary <String, AnyObject> = Utility.convertStringToDictionary(response)!
            
            if(responseDic["success"] as! Int == 1)
            {
                let userInfo = responseDic["user"]
                self.setUpUser(userInfo!)
                
                delegate.profileService(operationName, alertMessage:"", moveForward:true)
            }
            else
            {
                delegate.profileService(operationName, alertMessage:LocalizedString("ProfileRetrieveFailed", comment:""), moveForward:false)
            }
        }
        else if(operationName == apiMethod.UPDATE_PROFILE_API)
        {
            let responseDic:Dictionary <String, AnyObject> = Utility.convertStringToDictionary(response)!
            
            if(responseDic["success"] as! Int == 1)
            {
                
                let userInfo = responseDic["end_user"]
                self.setUpUser(userInfo!)
                delegate.profileService(operationName, alertMessage:LocalizedString("ProfileUpdateSuccessfully", comment:""), moveForward:true)
            }
            else
            {
                delegate.profileService(operationName, alertMessage:responseDic["reason"] as! String, moveForward:true)
                //delegate.profileService(operationName, alertMessage:"ProfileUpdateFailed", moveForward:false)
            }
        }
        
    }
    
    func serviceCallDidFail(error:String, operationName:String)
    {
        delegate.profileService(operationName, alertMessage:error, moveForward:false)
    }
    
    func setUpUser(userObj:AnyObject)
    {
        
        self.user.end_user_id = userObj.valueForKey("end_user_id") as? String
        self.user.user_name = userObj.valueForKey("user_name") as? String
        self.user.user_surname = userObj.valueForKey("user_surname") as? String
        self.user.user_email = userObj.valueForKey("user_email") as? String
        self.user.user_pass = userObj.valueForKey("user_pass") as? String
        self.user.confirm_password = userObj.valueForKey("user_pass") as? String
        self.user.active = userObj.valueForKey("active") as? String
        self.user.profile_completed = userObj.valueForKey("profile_completed") as? String
        self.user.temp_hash = userObj.valueForKey("temp_hash") as? String
        self.user.registration_ip = userObj.valueForKey("registration_ip") as? String
        self.user.registration_time = userObj.valueForKey("registration_time") as? String
        self.user.activated_by = userObj.valueForKey("activated_by") as? String
        self.user.activated_time = userObj.valueForKey("activated_time") as? String
        self.user.last_seen = userObj.valueForKey("last_seen") as? String
        self.user.last_seen_ip = userObj.valueForKey("last_seen_ip") as? String
        self.user.user_category = userObj.valueForKey("user_category") as? String
        self.user.birth_year = userObj.valueForKey("birth_year") as? String
        self.user.phone = userObj.valueForKey("phone") as? String
        self.user.mobile = userObj.valueForKey("mobile") as? String
        self.user.fax = userObj.valueForKey("fax") as? String
        self.user.address = userObj.valueForKey("address") as? String
        self.user.address2 = userObj.valueForKey("address2") as? String
        self.user.postcode = userObj.valueForKey("postcode") as? String
        self.user.city = userObj.valueForKey("city") as? String
        self.user.area = userObj.valueForKey("area") as? String
        self.user.country = userObj.valueForKey("country") as? String
        self.user.timezone = userObj.valueForKey("timezone") as? String
        self.user.personal_ID = userObj.valueForKey("personal_ID") as? String
        self.user.sex = userObj.valueForKey("sex") as? String
        self.user.profession = userObj.valueForKey("profession") as? String
        self.user.education_level = userObj.valueForKey("education_level") as? String
        self.user.default_lang = userObj.valueForKey("default_lang") as? String
        self.user.years_of_experience = userObj.valueForKey("years_of_experience") as? String
        self.user.children_limit = userObj.valueForKey("children_limit") as? String    }
}
