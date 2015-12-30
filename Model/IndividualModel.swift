//
//  IndividualModel.swift
//  Pavefs



import UIKit

protocol IndividualServiceDelegate
{
    func individualService(operationName:String, alertMessage:String, moveForward:Bool)
}

class IndividualModel: NSObject, ServiceAPICallDelegate
{
    
    var user:User = User()
    var arrChildren:Array <Child>! = []
    var selectedChild:Child!
    
    var alertMessage: String!
    var delegate: IndividualServiceDelegate!
    
    var editingChild:Bool!
    
    override init() {
        super.init()
        
        self.alertMessage = ""
        self.editingChild = false
    }
    
    func validateChildCode () -> Bool
    {
        var valid: Bool = true
        
        if self.selectedChild.child_code.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("ChildCodeMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    func validateAge () -> Bool
    {
        var valid: Bool = true
        
        if self.selectedChild.birth_date.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("AgeMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    func validateBirthMonth () -> Bool
    {
        var valid: Bool = true
        
        if self.selectedChild.birth_month.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("AgeMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    func validateBirthYear () -> Bool
    {
        var valid: Bool = true
        
        if self.selectedChild.birth_year.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("AgeMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    func validateSex () -> Bool
    {
        var valid: Bool = true
        
        if self.selectedChild.sex.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("SexMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    func validateDiagnosisDate () -> Bool
    {
        var valid: Bool = true
        
        if self.selectedChild.diagnosis_date.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("DiagnosisDateMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    func validateFunctionalityLevel () -> Bool
    {
        var valid: Bool = true
        
        if self.selectedChild.functionality_level.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("FunctioalityLevelMissing", comment:"")
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
        
        if self.selectedChild.education_level.isEmpty
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
    func validateInsuranceType () -> Bool
    {
        var valid: Bool = true
        
        if self.selectedChild.insurance_type.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("InsuranceTypeMissing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    func validateDiagnosis1 () -> Bool
    {
        var valid: Bool = true
        
        print("self.selectedChild.d1 \(self.selectedChild.d1)")
        
        if (self.selectedChild.d1 == nil)
        {
            valid = false
            self.alertMessage = LocalizedString("Diagnosis1Missing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    func validateRiskFactor1 () -> Bool
    {
        var valid: Bool = true
        
        if self.selectedChild.rh1.isEmpty
        {
            valid = false
            self.alertMessage = LocalizedString("RiskFactor1Missing", comment:"")
        }
        else
        {
            valid = true
        }
        
        return valid
    }
    
    
    func retrieveIndividual()
    {
        let serviceRequest = ServiceMethod.generateRetrieveIndividualRequest(Settings.getToken(), email:Settings.getUserEmail(),  deviceType:globalConstants.deviceType)
        
        let serviceCall:ServiceAPI = ServiceAPI()
        serviceCall.apiDelegate = self;
        serviceCall.sendRequestToServer(serviceRequest, operationName:apiMethod.RETRIEVE_INDIVIDUAL_API)
        
    }
    
    func addIndividual()
    {
        
        let serviceRequest = ServiceMethod.generateAddIndividaulRequest(Settings.getToken(),  childCode:self.selectedChild.child_code, birthMonth:self.selectedChild.birth_month, birthYear:self.selectedChild.birth_year, sex:self.selectedChild.sex, diagnosisDate:self.selectedChild.diagnosis_date, functionalityLevel:self.selectedChild.functionality_level, educationLevel:self.selectedChild.education_level, insuranceType:self.selectedChild.insurance_type, d1:self.selectedChild.d1, d2:self.selectedChild.d2, d3:self.selectedChild.d3, d4:self.selectedChild.d4, d5:self.selectedChild.d5, rh1:self.selectedChild.rh1, rh2:self.selectedChild.rh2, rh3:self.selectedChild.rh3, rh4:self.selectedChild.rh4, rh5:self.selectedChild.rh5, deviceType:globalConstants.deviceType)
        
        let serviceCall:ServiceAPI = ServiceAPI()
        serviceCall.apiDelegate = self;
        serviceCall.sendRequestToServer(serviceRequest, operationName:apiMethod.ADD_INDIVIDUAL_API)
    }
    
    
    func editIndividual()
    {
        
        let serviceRequest = ServiceMethod.generateEditIndividaulRequest(Settings.getToken(),  childID:self.selectedChild.child_id, childCode:self.selectedChild.child_code, birthMonth:self.selectedChild.birth_month, birthYear:self.selectedChild.birth_year, sex:self.selectedChild.sex, diagnosisDate:self.selectedChild.diagnosis_date, functionalityLevel:self.selectedChild.functionality_level, educationLevel:self.selectedChild.education_level, insuranceType:self.selectedChild.insurance_type, d1:self.selectedChild.d1, d2:self.selectedChild.d2, d3:self.selectedChild.d3, d4:self.selectedChild.d4, d5:self.selectedChild.d5, rh1:self.selectedChild.rh1, rh2:self.selectedChild.rh2, rh3:self.selectedChild.rh3, rh4:self.selectedChild.rh4, rh5:self.selectedChild.rh5, deviceType:globalConstants.deviceType)
        
        print("serviceRequest\(serviceRequest)")
        
        let serviceCall:ServiceAPI = ServiceAPI()
        serviceCall.apiDelegate = self;
        serviceCall.sendRequestToServer(serviceRequest, operationName:apiMethod.EDIT_INDIVIDUAL_API)
    }
    
    func deleteIndividual ()
    {
        let serviceRequest = ServiceMethod.generateDeleteIndividualRequest(Settings.getToken(), childID:self.selectedChild.child_id,  deviceType:globalConstants.deviceType)
        
        let serviceCall:ServiceAPI = ServiceAPI()
        serviceCall.apiDelegate = self;
        serviceCall.sendRequestToServer(serviceRequest, operationName:apiMethod.DELETE_INDIVIDUAL_API)
    }

    func serviceCallDidFinish(response:String, operationName:String)
    {
        
        
        if(operationName == apiMethod.RETRIEVE_INDIVIDUAL_API)
        {
            //let responseDic:Dictionary <String, String> = Utility.responseStringToDictionary(response)
            let responseDic:Dictionary <String, AnyObject> = Utility.convertStringToDictionary(response)!
            
            if(responseDic["success"] as! Int == 1)
            {
                let userInfo = responseDic["user"]
                self.setUpUser(userInfo!)
                let children = responseDic["children_list"]
                self.setUpChildren(children!)
                
                
                delegate.individualService(operationName, alertMessage:"", moveForward:true)
            }
            else
            {
                let message:String = LocalizedString("RetrieveIndividualServiceFailed", comment:"")
                
                
                delegate.individualService(operationName, alertMessage:message, moveForward:false)
            }
        }
        else if(operationName == apiMethod.ADD_INDIVIDUAL_API && self.editingChild == false)
        {
            
            let responseDic:Dictionary <String, AnyObject> = Utility.convertStringToDictionary(response)!
            
            
            if(responseDic["success"] as! Int == 1)
            {
                
                delegate.individualService(operationName, alertMessage:LocalizedString("AddIndividualServiceSuccessful",comment:""), moveForward:true)
            }
            else
            {
                let message:String = LocalizedString("AddIndividualServiceFailed", comment:"")
                
                
                delegate.individualService(operationName, alertMessage:message, moveForward:false)
            }
            
        }
        else if(operationName == apiMethod.EDIT_INDIVIDUAL_API && self.editingChild == true)
        {
            self.editingChild = false
            
            let responseDic:Dictionary <String, AnyObject> = Utility.convertStringToDictionary(response)!
            
            
            if(responseDic["success"] as! Int == 1)
            {
                
                delegate.individualService(operationName, alertMessage:LocalizedString("EditIndividualServiceSuccessfull", comment:""), moveForward:true)
            }
            else
            {
                let message:String = LocalizedString("EditIndividualServiceFailed", comment:"")
                
                
                delegate.individualService(operationName, alertMessage:message, moveForward:false)
            }
            
        }
        else if(operationName == apiMethod.DELETE_INDIVIDUAL_API)
        {
            let responseDic:Dictionary <String, AnyObject> = Utility.convertStringToDictionary(response)!
            
            
            if(responseDic["success"] as! Int == 1)
            {
                
                self.arrChildren.removeAll()
                
                delegate.individualService(operationName, alertMessage:"", moveForward:true)
            }
            else
            {
                let message:String = LocalizedString("DeleteIndividualServiceFailed", comment:"")
                
                
                delegate.individualService(operationName, alertMessage:message, moveForward:false)
            }

            
        }
        
        
    }

    func serviceCallDidFail(error:String, operationName:String)
    {
        delegate.individualService(operationName, alertMessage:error, moveForward:false)
    }
    
    
    func setUpUser(userObj:AnyObject)
    {
        
        self.user.end_user_id = userObj.valueForKey("end_user_id") as? String
        self.user.user_name = userObj.valueForKey("user_name") as? String
        self.user.user_surname = userObj.valueForKey("user_surname") as? String
        self.user.user_email = userObj.valueForKey("user_email") as? String
        self.user.user_pass = userObj.valueForKey("user_pass") as? String
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
        self.user.children_limit = userObj.valueForKey("children_limit") as? String
    }
    
    func setUpChildren(children:AnyObject)
    {
       
        if(children.count > 0)
        {
            if(self.arrChildren.count > 0)
            {
                self.arrChildren.removeAll()
            }
            
            for var index=0; index < children.count; index++
            {
                
                let child:Child = Child()
                child.child_id = children[index].valueForKey("child_id") as? String
                child.parent_id = children[index].valueForKey("parent_id") as? String
                child.child_code = children[index].valueForKey("child_code") as? String
                child.birth_date = children[index].valueForKey("birth_date") as? String
                child.sex = children[index].valueForKey("sex") as? String
                child.sex = child.appendSquareBrackets(child.sex)
                child.d1 = children[index].valueForKey("d1") as? String
                child.d1 = child.appendSquareBrackets(child.d1)
                child.d2 = children[index].valueForKey("d2") as? String
                child.d2 = child.appendSquareBrackets(child.d2)
                child.d3 = children[index].valueForKey("d3") as? String
                child.d3 = child.appendSquareBrackets(child.d3)
                child.d4 = children[index].valueForKey("d4") as? String
                child.d4 = child.appendSquareBrackets(child.d4)
                child.d5 = children[index].valueForKey("d5") as? String
                child.d5 = child.appendSquareBrackets(child.d5)
                child.rh1 = children[index].valueForKey("rh1") as? String
                child.rh1 = child.appendSquareBrackets(child.rh1)
                child.rh2 = children[index].valueForKey("rh2") as? String
                child.rh2 = child.appendSquareBrackets(child.rh2)
                child.rh3 = children[index].valueForKey("rh3") as? String
                child.rh3 = child.appendSquareBrackets(child.rh3)
                child.rh4 = children[index].valueForKey("rh4") as? String
                child.rh4 = child.appendSquareBrackets(child.rh4)
                child.rh5 = children[index].valueForKey("rh5") as? String
                child.rh5 = child.appendSquareBrackets(child.rh5)
                
                child.created = children[index].valueForKey("created") as? String
                child.sex_label = children[index].valueForKey("sex_label") as? String
                child.d1_label = children[index].valueForKey("d1_label") as? String
                child.d2_label = children[index].valueForKey("d2_label") as? String
                child.d3_label = children[index].valueForKey("d3_label") as? String
                child.d4_label = children[index].valueForKey("d4_label") as? String
                child.d5_label = children[index].valueForKey("d5_label") as? String
                child.rh1_label = children[index].valueForKey("rh1_label") as? String
                child.rh2_label = children[index].valueForKey("rh2_label") as? String
                child.rh3_label = children[index].valueForKey("rh3_label") as? String
                child.rh4_label = children[index].valueForKey("rh4_label") as? String
                child.rh5_label = children[index].valueForKey("rh5_label") as? String
                child.diagnosis_date = children[index].valueForKey("diagnosis_date") as? String
                child.education_level = children[index].valueForKey("education_level") as? String
                child.insurance_type = children[index].valueForKey("insurance_type") as? String
                child.functionality_level = children[index].valueForKey("functionality_level") as? String
                child.pin = children[index].valueForKey("pin") as? String
                child.birth_month = children[index].valueForKey("birth_month") as? String
                child.birth_year = children[index].valueForKey("birth_year") as? String
                
                self.arrChildren.append(child)
                
                
            }
        }
    }
}
