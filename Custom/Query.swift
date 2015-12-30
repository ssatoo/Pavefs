//
//  Query.swift
//  Pavefs
//
//  Created by Zacharias Yiakoumi on 19/11/15.
//  Copyright © 2015 Nayeye. All rights reserved.
//

import UIKit

class Query: NSObject {
    
    
   var childId:String!
   var completed:String!
   var createdAt:String!
   var ev1:String!
   var ev2:String!
   var ev3:String!
   var ev4:String!
   var feedbackEN:String!
   var feedbackGR:String!
   var inputFile:String!
   var jarFile:String!
   var outputFile:String!
   var params:String!
   var percentage:String!
   var queryId:String!
   var queryName:String!
   var queryResultId:String!
   var resultCases:String!
   var resultTextEN:String!
   var resultTextGR:String!
   var rp1:String!
   var rp1Source:String!
   var rp2:String!
   var rp2Source:String!
   var rp3:String!
   var rp3Source:String!
   var rp4:String!
   var rp4Source:String!
   var status:String!
   var taskId:String!
   var triggeredAt:String!
   var userId:String!
   var userRole:String!
    
  var resultCasesArr:Array<AnyObject>!
   
    
    override init()
    {
        super.init()
        
        self.childId = ""
        self.completed = ""
        self.createdAt = ""
        self.ev1 = ""
        self.ev2 = ""
        self.ev3 = ""
        self.ev4 = ""
        self.feedbackEN = ""
        self.feedbackGR = ""
        self.inputFile = ""
        self.jarFile = ""
        self.outputFile = ""
        self.params = ""
        self.percentage = ""
        self.queryId = ""
        self.queryName = ""
        self.queryResultId = ""
        self.resultCases = ""
        self.resultTextEN = ""
        self.resultTextGR = ""
        self.rp1 = ""
        self.rp1Source = ""
        self.rp2 = ""
        self.rp2Source = ""
        self.rp3 = ""
        self.rp3Source = ""
        self.rp4 = ""
        self.rp4Source = ""
        self.status = ""
        self.taskId = ""
        self.triggeredAt = ""
        self.userId = ""
        self.userRole = ""
        self.resultCasesArr = []
        
    }
    func appendSquareBrackets(id:String) -> String
    {
        let bracketedID = String(format:"[%@]", id)
        return bracketedID
    }

}
