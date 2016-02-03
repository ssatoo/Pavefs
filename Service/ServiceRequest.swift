//
//  ServiceRequest.swift
//  Pavefs
//


import Foundation

struct apiRequest {
    
    struct registrationRequest
    {
        static let request = "email=%@&password1=%@&password2=%@&user_category=%@&device_type=%@&lang=%@"
    }
    
    struct loginRequest
    {
        static let request = "username=%@&password=%@&lang=%@&device_type=%@"
    }
    struct logoutRequest
    {
        static let request = "device_type=%@"
    }
        
    struct userProfileRequest
    {
        static let request = "token=%@&device_type=%@"
    }
    
    struct updateProfileRequest
    {
         static let request = "token=%@&user_name=%@&user_surname=%@&user_email=%@&user_pass=%@&user_pass_confirm=%@&sex=%@&birth_year=%@&phone=%@&fax=%@&address=%@&address2=%@&postcode=%@&city=%@&area=%@&country=%@&timezone=%@&profession=%@&education_level=%@&personal_ID=%@&years_of_experience=%@&device_type=%@"
    }
    
    struct changePasswordRequest
    {
        static let request = "token=%@&user_email=%@&user_pass=%@&user_pass_confirm=%@&device_type=%@"
    }
    
    struct retrieveIndividualRequest
    {
        static let request = "token=%@&user_email=%@&device_type=%@"
    }
    
    struct addIndividualRequest
    {
        static let request = "token=%@&child_code=%@&birth_month=%@&birth_year=%@&sex=%@&diagnosis_date=%@&functionality_level=%@&education_level=%@&insurance_type=%@&d1=%@&d2=%@&d3=%@&d4=%@&d5=%@&rh1=%@&rh2=%@&rh3=%@&rh4=%@&rh5=%@&device_type=%@"
    }
    
    struct editIndividualRequest
    {
        static let request = "token=%@&child_id=%@&child_code=%@&birth_month=%@&birth_year=%@&sex=%@&diagnosis_date=%@&functionality_level=%@&education_level=%@&insurance_type=%@&d1=%@&d2=%@&d3=%@&d4=%@&d5=%@&rh1=%@&rh2=%@&rh3=%@&rh4=%@&rh5=%@&device_type=%@"
    }
    
    struct deleteIndividualRequest
    {
        static let request = "token=%@&child_id=%@&device_type=%@"
    }
    
    struct RetrieveQuerylistRequest
    {
        static let request = "token=%@&device_type=%@"
    }
    struct AddNewQueryRequest
    {
        static let request = "selChild=%@&queryName=%@&gender=%@&age=%@&tms=%@&tme=%@&b11=%@&kb11=%@&bp11=%@&po11=%@&dr11=%@&f11=%@&in11=%@&ij11=%@&lo11=%@&lop11=%@&lof11=%@&st111=%@&st121=%@&st131=%@&s111=%@&s121=%@&s131=%@&s141=%@&p111=%@&p121=%@&p131=%@&n11=%@&w111=%@&w121=%@&w131=%@&w141=%@&l11=%@&lp11=%@&lf11=%@&rp111=%@&rp121=%@&rp131=%@&rp141=%@&as11=%@&op111=%@&orp111=%@&oro111=%@&ore111=%@&token=%@&device_type=%@"
        
        
        
        
    }
    struct RetrieveOntologyRequest
    {
        static let request = "token=%@&device_type=%@"
    }
    
    struct RetrieveClassOntologyRequest
    {
        static let request = "oNodes=%@&token=%@&device_type=%@"
    }
    
    struct RetrieveQueryResultRequest
    {
        static let request = "id=%@&token=%@&device_type=%@"
    }
    struct ViewQueryRequest
    {
        static let request = "id=%@&token=%@&device_type=%@"
    }
    
    struct RelatedCasesRequest
    {
        static let request = "id=%@&token=%@&device_type=%@"
    }
    
    struct RateResponsesRequest
    {
        static let request = "rp1=%@&rp2=%@&rp3=%@&rp4=%@&queryResultId=%@&token=%@&device_type=%@"
    }
    
    

    
}

struct apiMethod
{
    static let REGISTRATION_API = "auth/registerUser"
    static let LOGIN_API = "auth/login"
    static let LOGOUT_API = "auth/logout"
    static let RETRIEVE_PROFILE_API = "profile/retrieve"
    static let UPDATE_PROFILE_API = "profile/update"
    static let CHANGE_PASSWORD_API = "auth/changePassword"
    static let RETRIEVE_INDIVIDUAL_API = "children/retrieve"
    static let ADD_INDIVIDUAL_API = "children/save"
    static let EDIT_INDIVIDUAL_API = "children/save"
    static let DELETE_INDIVIDUAL_API = "children/delete"
    static let RETRIVE_QUERYLIST_API = "case/mobilist"
    static let ADD_NEW_QUERY = "case/msave"
    static let ONTOLOGY_API = "ui/ontology"
    static let ONTOLOGYTREE_API = "ui/ontologytree"
    static let RESULTSQUERY_API = "case/resultsmobi"
    static let VIEWQUERY_API = "case/viewquerymobi"
    static let RELATEDCASES_API = "case/relatedcasemobi"
    static let RATERESPONCES_API = "case/updateusertaskmobi"
    
}