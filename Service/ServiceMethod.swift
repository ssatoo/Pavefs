//
//  APIRequest.swift
//  ClaimAll
//


import UIKit

class ServiceMethod: NSObject
{

    override init() {
        super.init()
        
    }
    
    static func generateRegistrationRequest (email:String, password1:String,  confirmPassword:String,  userCategory:String, deviceType:String, languageCode:String) -> String
    {
        let request = String(format:apiRequest.registrationRequest.request, email, password1, confirmPassword, userCategory, deviceType, languageCode)
        print("Request For Operation registerUser :-  " + request)
        
        return request
    }
    
    static func generateLoginRequest (username:String, password:String, languageCode:String, deviceType:String) -> String
    {
        let request = String(format:apiRequest.loginRequest.request, username, password, languageCode, deviceType)
        print("Request For Operation login :-  " + request)
        
        return request
    }
    
    static func generateLogoutRequest (deviceType:String) -> String
    {
        let request = String(format:apiRequest.logoutRequest.request, deviceType)
        print("Request For Operation logout :-  " + request)
        
        return request
    }
    
    static func generateUserProfileRequest (token:String, deviceType:String) -> String
    {
        let request = String(format:apiRequest.userProfileRequest.request, token, deviceType)
        print("Request For Operation Retrieve Profile :-  " + request)
        
        return request
    }
    
    static func generateUpdateProfileRequest (token:String, name:String, surname:String, email:String, password:String, confirmPassword:String, gender:String, birthdate:String, phone:String, fax:String, address:String, address2:String, postcode:String, city:String, area:String, country:String, timezone:String, profession:String, educationLevel:String, personalID:String, yearsOfExperience:String, deviceType:String) -> String
    {
        let request = String(format:apiRequest.updateProfileRequest.request, token, name, surname, email, password, confirmPassword, gender, birthdate, phone, fax, address, address2, postcode, city, area, country, timezone, profession, educationLevel, personalID, yearsOfExperience, deviceType)
        print("Request For Operation Update Profile :-  " + request)
        
        return request
    }
    
    static func generateChangePasswordRequest (token:String, email:String, newPassword:String, confirmPassword:String, deviceType:String) ->String
    {
        let request = String(format:apiRequest.changePasswordRequest.request, token, email, newPassword, confirmPassword, deviceType)
        print("Request For Operation Change Password :-  " + request)
        
        return request
    }
    
    
    static func generateRetrieveIndividualRequest (token:String, email:String, deviceType:String) ->String
    {
        let request = String(format:apiRequest.retrieveIndividualRequest.request, token, email, deviceType)
        print("Request For Operation Retrieve Individual :-  " + request)
        
        return request
    }
    
    static func generateAddIndividaulRequest (token:String, childCode:String, birthMonth:String,
        birthYear:String, sex:String, diagnosisDate:String, functionalityLevel:String, educationLevel:String, insuranceType:String, d1:String, d2:String, d3:String, d4:String, d5:String, rh1:String, rh2:String, rh3:String, rh4:String, rh5:String, deviceType:String) ->String
    {
        let request = String(format:apiRequest.addIndividualRequest.request, token, childCode, birthMonth, birthYear, sex, diagnosisDate, functionalityLevel, educationLevel, insuranceType, d1, d2, d3, d4, d5, rh1, rh2, rh3, rh4, rh5, deviceType)
        print("Request For Operation Add Individual :-  " + request)
    
        return request
    }
    
    
    static func generateEditIndividaulRequest (token:String, childID:String, childCode:String, birthMonth:String, birthYear:String, sex:String, diagnosisDate:String, functionalityLevel:String, educationLevel:String, insuranceType:String, d1:String, d2:String, d3:String, d4:String, d5:String, rh1:String, rh2:String, rh3:String, rh4:String, rh5:String, deviceType:String) ->String
    {
        let request = String(format:apiRequest.editIndividualRequest.request, token,childID, childCode, birthMonth, birthYear, sex, diagnosisDate, functionalityLevel, educationLevel, insuranceType, d1, d2, d3, d4, d5, rh1, rh2, rh3, rh4, rh5, deviceType)
        print("Request For Operation Edit Individual :-  " + request)
        
        return request
    }

    
    static func generateDeleteIndividualRequest (token:String, childID:String, deviceType:String) ->String
    {
        let request = String(format:apiRequest.deleteIndividualRequest.request, token, childID, deviceType)
        print("Request For Operation Delete Individual :-  " + request)
        
        return request
    }
    
    
    static func RetrieveQuerylistRequest (token:String, deviceType:String) ->String
    {
        let request = String(format:apiRequest.RetrieveQuerylistRequest.request, token, deviceType)
        print("Request For Retrieve Query list :-  " + request)
        
        return request
    }
   
    
    static func generateAddQueryRequest (selChild:String, queryName:String, gender:String,
        age:String, tms:String, tme:String, b11:String, kb11:String, bp11:String, po11:String, dr11:String, f11:String, in11:String, ij11:String, lo11:String, lop11:String, lof11:String, st111:String, st121:String, st131:String,s111:String,s121:String,s131:String,s141:String,p111:String,p121:String,p131:String,n11:String,w111:String,w121:String,w131:String,w141:String,l11:String,lp11:String,lf11:String,rp111:String,rp121:String,rp131:String,rp141:String,as11:String,op111:String,orp111:String,oro111:String,ore111:String,token:String, deviceType:String) ->String
    {
        let request = String(format:apiRequest.AddNewQueryRequest.request, selChild, queryName, gender, age, tms, tme, b11, kb11, bp11, po11, dr11, f11, in11, ij11, lo11, lop11, lof11, st111, st121,st131,s111,s121,s131,s141,p111,p121,p131,n11,w111,w121,w131,w141,l11,lp11,lf11,rp111,rp121,rp131,rp141,as11,op111,orp111,oro111,ore111,token, deviceType)
        print("Request For Operation Add Query :-  " + request)
        
        return request
    }
    
    static func RetrieveOntologyRequest (token:String, deviceType:String) ->String
    {
        let request = String(format:apiRequest.RetrieveQuerylistRequest.request, token, deviceType)
        print("Request For Ontology Query list :-  " + request)
        
        return request
    }
    
    static func RetrieveOntologyClassRequest (Note:String, token:String, deviceType:String) ->String
    {
        let request = String(format:apiRequest.RetrieveClassOntologyRequest.request,Note, token, deviceType)
        print("Request For Ontology Query class :-  " + request)
        
        return request
    }

    static func RetrieveQueryResultRequest (id:String, token:String, deviceType:String) ->String
    {
        let request = String(format:apiRequest.RetrieveQueryResultRequest.request,id, token, deviceType)
        print("Request For QueryResult  :-  " + request)
        
        return request
    }
    
    
    static func ViewQueryRequest (id:String, token:String, deviceType:String) ->String
    {
        let request = String(format:apiRequest.ViewQueryRequest.request,id, token, deviceType)
        print("Request For Query  :-  " + request)
        
        return request
    }
    
    static func RelatedCasesRequest (id:String, token:String, deviceType:String) ->String
    {
        let request = String(format:apiRequest.RelatedCasesRequest.request,id, token, deviceType)
        print("Request For Related Cases  :-  " + request)
        
        return request
    }
    static func RateResponsesRequest (rp1:String,rp2:String,rp3:String,rp4:String, queryResultID:String, token:String, deviceType:String) ->String
    {
        let request = String(format:apiRequest.RateResponsesRequest.request,rp1,rp2,rp3,rp4,queryResultID, token, deviceType)
        print("Request For Related Cases  :-  " + request)
        
        return request
    }
    
    
    
    
}
