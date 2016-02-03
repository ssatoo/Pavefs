//
//  OntologyPojo.swift
//  Pavefs
//
//  Created by Zacharias Yiakoumi on 23/11/15.
//  Copyright © 2015 Nayeye. All rights reserved.
//

import UIKit

class OntologyPojo: NSObject {
    
    
    
    var ontologyClass :String!
    var ontologyLabel :String!
    var ontology : OntologyPojo!
    
    override init()
    {
        super.init()
        
        self.ontologyClass = ""
        self.ontologyLabel = ""
        self.ontology=OntologyPojo()
        
    }

    
    
    
}
