//
//  Ontology.swift
//  Pavefs
//
//  Created by Zacharias Yiakoumi on 21/11/15.
//  Copyright © 2015 Nayeye. All rights reserved.
//

import UIKit

class Ontology: NSObject {

    
    
    var descrEN: String!
    var descrGR:String!
    var fieldPrefix:String!
    var labelEN:String!
    var labelGR:String!
    var nodeId:String!
    var ontologyId:String!
    var order:String!
    var parentNodes:String!
    var siblingNodes:String!
    var children:Array<AnyObject>!
    
    
    
    override init()
    {
        super.init()
        
        self.descrEN = ""
        self.descrGR = ""
        self.fieldPrefix = ""
        self.labelEN = ""
        self.labelGR = ""
        self.nodeId = ""
        self.ontologyId = ""
        self.order = ""
        self.parentNodes = ""
        self.siblingNodes = ""
        self.children = []
        
    }
    
    
}
