//
//  Child.swift
//  Pavefs
//


import UIKit

class Child: NSObject
{

    var child_id:String!
    var parent_id:String!
    var child_code:String!
    var birth_date:String!
    var sex:String!
    var d1:String!
    var d2:String!
    var d3:String!
    var d4:String!
    var d5:String!
    var rh1:String!
    var rh2:String!
    var rh3:String!
    var rh4:String!
    var rh5:String!
    var created:String!
    var sex_label:String!
    var d1_label:String!
    var d2_label:String!
    var d3_label:String!
    var d4_label:String!
    var d5_label:String!
    var rh1_label:String!
    var rh2_label:String!
    var rh3_label:String!
    var rh4_label:String!
    var rh5_label:String!
    var diagnosis_date:String!
    var education_level:String!
    var insurance_type:String!
    var functionality_level:String!
    var pin:String!
    var birth_month:String!
    var birth_year:String!
    
    override init()
    {
        super.init()
        
        self.child_id = ""
        self.parent_id = ""
        self.child_code = ""
        self.birth_date = ""
        self.sex = ""
        self.d1 = ""
        self.d2 = ""
        self.d3 = ""
        self.d4 = ""
        self.d5 = ""
        self.rh1 = ""
        self.rh2 = ""
        self.rh3 = ""
        self.rh4 = ""
        self.rh5 = ""
        self.created = ""
        self.sex_label = ""
        self.d1_label = ""
        self.d2_label = ""
        self.d3_label = ""
        self.d4_label = ""
        self.d5_label = ""
        self.rh1_label = ""
        self.rh2_label = ""
        self.rh3_label = ""
        self.rh4_label = ""
        self.rh5_label = ""
        self.diagnosis_date = ""
        self.education_level = ""
        self.insurance_type = ""
        self.functionality_level = ""
        self.pin = ""
        self.birth_month = ""
        self.birth_year = ""
        
    }
    
    func appendSquareBrackets(id:String) -> String
    {
        let bracketedID = String(format:"[%@]", id)
        return bracketedID
    }
   
    
}
