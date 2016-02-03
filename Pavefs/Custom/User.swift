//
//  User.swift
//  Pavefs
//


import UIKit

class User: NSObject {

    
    var end_user_id:String!
    var user_name:String!
    var user_surname:String!
    var user_email:String!
    var user_pass:String!
    var active:String!
    var profile_completed:String!
    var temp_hash:String!
    var registration_ip:String!
    var registration_time:String!
    var activated_by:String!
    var activated_time:String!
    var last_seen:String!
    var last_seen_ip:String!
    var user_category:String!
    var birth_year:String!
    var phone:String!
    var mobile:String!
    var fax:String!
    var address:String!
    var address2:String!
    var postcode:String!
    var city:String!
    var area:String!
    var country:String!
    var timezone:String!
    var personal_ID:String!
    var sex:String!
    var profession:String!
    var education_level:String!
    var default_lang:String!
    var years_of_experience:String!
    var children_limit:String!
    
    
    var confirm_password:String!
    
    override init()
    {
        super.init()
        
        
        self.end_user_id = ""
        self.user_name = ""
        self.user_surname = ""
        self.user_email = ""
        self.user_pass = ""
        self.active = ""
        self.profile_completed = ""
        self.temp_hash = ""
        self.registration_ip = ""
        self.registration_time = ""
        self.activated_by = ""
        self.activated_time = ""
        self.last_seen = ""
        self.last_seen_ip = ""
        self.user_category = ""
        self.birth_year = ""
        self.phone = ""
        self.mobile = ""
        self.fax = ""
        self.address = ""
        self.address2 = ""
        self.postcode = ""
        self.city = ""
        self.area = ""
        self.country = ""
        self.timezone = ""
        self.personal_ID = ""
        self.sex = ""
        self.profession = ""
        self.education_level = ""
        self.default_lang = ""
        self.years_of_experience = ""
        self.children_limit = ""
        
        self.confirm_password = ""
        
    
    }
    
    
    
    
}
