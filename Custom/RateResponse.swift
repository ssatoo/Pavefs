//
//  RateResponse.swift
//  Pavefs
//
//  Created by Zacharias Giakoumi on 12/30/15.
//  Copyright © 2015 Nayeye. All rights reserved.
//

import UIKit

class RateResponse: NSObject {
    
    
    var RateText:String!
    var RateId:String!
    var caseId:String!

    
    override init()
    {
        super.init()
    
        RateText = ""
        RateId = "-1"
        caseId = ""
        
    }

    
}
