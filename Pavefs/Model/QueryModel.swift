//
//  QueryModel.swift
//  Pavefs
//
//  Created by Zacharias Yiakoumi on 19/11/15.
//  Copyright © 2015 Nayeye. All rights reserved.
//

import UIKit

protocol QueryServiceDelegate
{
    func queryService(alertMessage:String, moveForward:Bool)
}

protocol ViewQueryServiceDelegate
{
    func viewQueryCallDidFinish(fetchedQuestions:[QueryQuestion])
}

class  QueryModel :NSObject, ServiceAPICallDelegate
{
    
    //var username: String!
   // var password: String!
    var arrQuery:Array <Query>! = []
    var query:Query = Query()
    var alertMessage: String!
    var delegate: QueryServiceDelegate!
    var viewQueryDelegate:ViewQueryServiceDelegate?
    
    override init() {
        super.init()
        
      
        self.alertMessage = ""
    }
    
    
    
    
    func RetrieveQueryResult(QueryID:String){
    
        let serviceRequest = ServiceMethod.RetrieveQueryResultRequest(QueryID, token: Settings.getToken(), deviceType: globalConstants.deviceType)
        print("serviceRequest \(serviceRequest)")
        let serviceCall:ServiceAPI = ServiceAPI()
        serviceCall.apiDelegate = self;
        serviceCall.sendRequestToServer(serviceRequest, operationName:apiMethod.RESULTSQUERY_API)
    
    
    }
    
    func ViewQuery(queryId: String)
    {
        let serviceRequest = ServiceMethod.ViewQueryRequest(queryId, token: Settings.getToken(), deviceType: globalConstants.deviceType)
        
        print("serviceRequest \(serviceRequest)")
        
        let call: ServiceAPI = ServiceAPI()
        call.apiDelegate = self
        call.sendRequestToServer(serviceRequest, operationName: apiMethod.VIEWQUERY_API)
    }
    
    func addQuery(query:QueryParams)
    {
        
        let serviceRequest = ServiceMethod.generateAddQueryRequest(query.selChild, queryName: query.queryName, gender: query.gender, age: query.age, tms: query.tms, tme: query.tme, b11: query.b11, kb11: query.kb11, bp11:query.bp11, po11: query.po11, dr11: query.dr11, f11: query.f11, in11: query.in11, ij11: query.ij11, lo11: query.lo11, lop11: query.lop11, lof11: query.lof11, st111: query.st111, st121: query.st121, st131: query.st131, s111: query.st111, s121: query.st121, s131: query.s131, s141: query.s141, p111: query.p111, p121: query.p121, p131: query.p131, n11: query.n11, w111: query.w111, w121: query.w121, w131: query.w131, w141: query.w141, l11: query.l11, lp11: query.lp11, lf11: query.lf11, rp111: query.rp111, rp121: query.rp121, rp131: query.rp131, rp141: query.rp141, as11: query.as11, op111: query.op111, orp111: query.ore111, oro111: query.oro111, ore111: query.ore111, token: Settings.getToken(), deviceType: globalConstants.deviceType)
        
        let serviceCall:ServiceAPI = ServiceAPI()
        serviceCall.apiDelegate = self;
        serviceCall.sendRequestToServer(serviceRequest, operationName:apiMethod.ADD_NEW_QUERY)
    }
    
    func RetrieveQuerylist()
    {
        
        let serviceRequest = ServiceMethod.RetrieveQuerylistRequest(Settings.getToken(), deviceType: globalConstants.deviceType)
        print("serviceRequest \(serviceRequest)")
        let serviceCall:ServiceAPI = ServiceAPI()
        serviceCall.apiDelegate = self;
        serviceCall.sendRequestToServer(serviceRequest, operationName:apiMethod.RETRIVE_QUERYLIST_API)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func serviceCallDidFinish(response:String, operationName:String)
    {
        
        
         var responseDic:Dictionary <String, AnyObject> = Utility.convertStringToDictionary(response)!
        
        print(responseDic)
        if operationName == apiMethod.ADD_NEW_QUERY {
        delegate.queryService("ssd", moveForward:true)
        
        }else if operationName == apiMethod.RETRIVE_QUERYLIST_API{
        
        if(responseDic["success"] as! Int == 1)
        {
           
          //  self.setUpQuery(responseDic)
            let children = responseDic["data"]
            self.setUpChildren(children!)
            print("show list \(arrQuery.count)")
            delegate.queryService("ssd", moveForward:true)
        }
        else
        {
            delegate.queryService("Login Failed", moveForward:false)
        }
        
        }else if operationName == apiMethod.RESULTSQUERY_API{
        
            if(responseDic["success"] as! Int == 1)
            {
                
                //self.setUpQuery(responseDic)
                let query = responseDic["data"]
              
              //  print("show list \(query)")
                self.setUpQuery(query!)
                
                delegate.queryService("ssd", moveForward:true)
            }
            else
            {
                delegate.queryService("Login Failed", moveForward:false)
                //Settings.stopLoader()
            }

        
        
        }
        else if operationName == apiMethod.VIEWQUERY_API {
            
            if(responseDic["success"] as! Int == 1)
            {
                responseDic = responseDic["data"]! as! Dictionary<String, AnyObject>
                
                let parser: ViewQueryParser = ViewQueryParser(jsonData: responseDic as! [String:String])
                
                self.viewQueryDelegate?.viewQueryCallDidFinish(parser.parse())
            }
            else
            {
                delegate.queryService("Login Failed", moveForward:false)
            }
        }
    }
    
    func serviceCallDidFail(error:String, operationName:String)
    {
        delegate.queryService(error, moveForward:false)
    }
    
    
    func setUpQuery(queryObj:AnyObject)
    {
        
         print("\(queryObj.valueForKey("userTask")!.valueForKey("rp1"))")
         print("\(queryObj.valueForKey("userTask")!.valueForKey("rp1Source"))")
         print("\(queryObj.valueForKey("userTask")!.valueForKey("rp2"))")
         print("\(queryObj.valueForKey("userTask")!.valueForKey("rp2Source"))")
         print("\(queryObj.valueForKey("userTask")!.valueForKey("rp3"))")
         print("\(queryObj.valueForKey("userTask")!.valueForKey("rp3Source"))")
         print("\(queryObj.valueForKey("userTask")!.valueForKey("resultCases"))")
         print("\(queryObj.valueForKey("userTask")!.valueForKey("resultTextEN"))")
        
        
        
        self.query.resultCasesArr = queryObj["resultCases"] as! Array
        self.query.childId = queryObj.valueForKey("childId") as? String
        self.query.completed = queryObj.valueForKey("completed") as? String
        self.query.createdAt = queryObj.valueForKey("createdAt") as? String
        self.query.ev1 = queryObj.valueForKey("ev1") as? String
        self.query.ev2 = queryObj.valueForKey("ev2") as? String
        self.query.ev3 = queryObj.valueForKey("ev3") as? String
        self.query.ev4 = queryObj.valueForKey("ev4") as? String
        self.query.feedbackEN = queryObj.valueForKey("feedbackEN") as? String
        self.query.feedbackGR = queryObj.valueForKey("feedbackGR") as? String
        self.query.inputFile = queryObj.valueForKey("inputFile") as? String
        self.query.outputFile = queryObj.valueForKey("outputFile") as? String
        self.query.params = queryObj.valueForKey("params") as? String
        self.query.percentage = queryObj.valueForKey("percentage") as? String
        self.query.queryId = queryObj.valueForKey("queryId") as? String
        self.query.queryName = queryObj.valueForKey("queryName") as? String
        self.query.queryResultId = queryObj.valueForKey("queryResultId") as? String
        self.query.resultCases = queryObj.valueForKey("resultCases") as? String
        self.query.resultTextEN = queryObj.valueForKey("userTask")!.valueForKey("resultTextEN") as? String
        self.query.resultTextGR = queryObj.valueForKey("userTask")!.valueForKey("resultTextGR") as? String
        self.query.rp1 = queryObj.valueForKey("userTask")!.valueForKey("rp1") as? String
        self.query.rp1Source = queryObj.valueForKey("rp1Source") as? String
        self.query.rp2 = queryObj.valueForKey("userTask")!.valueForKey("rp2") as? String
        self.query.rp2Source = queryObj.valueForKey("rp2Source") as? String
        self.query.rp3 = queryObj.valueForKey("userTask")!.valueForKey("rp3") as? String
        self.query.rp3Source = queryObj.valueForKey("rp3Source") as? String
        self.query.rp4 = queryObj.valueForKey("userTask")!.valueForKey("rp4") as? String
        self.query.rp4Source = queryObj.valueForKey("rp4Source") as? String
        self.query.status = queryObj.valueForKey("status") as? String
        self.query.taskId = queryObj.valueForKey("taskId") as? String
        self.query.triggeredAt = queryObj.valueForKey("triggeredAt") as? String
        self.query.userId = queryObj.valueForKey("userId") as? String
        self.query.userRole = queryObj.valueForKey("userRole") as? String
        
    }
    func setUpChildren(children:AnyObject)
    {
        if(children.count > 0)
        {
            if(self.arrQuery.count > 0)
            {
                self.arrQuery.removeAll()
            }
            
            for var index=0; index < children.count; index++
            {
                
                let query:Query = Query()
                query.childId = children[index].valueForKey("childId") as? String
                query.completed = children[index].valueForKey("completed") as? String
                query.createdAt = children[index].valueForKey("createdAt") as? String
                query.ev1 = children[index].valueForKey("ev1") as? String
                query.ev1 = query.appendSquareBrackets(query.ev1)
                query.ev2 = children[index].valueForKey("ev2") as? String
                query.ev2 = query.appendSquareBrackets(query.ev2)
                query.ev3 = children[index].valueForKey("ev3") as? String
                query.ev3 = query.appendSquareBrackets(query.ev3)
                query.ev4 = children[index].valueForKey("ev4") as? String
                query.ev4 = query.appendSquareBrackets(query.ev4)
                query.feedbackEN = children[index].valueForKey("feedbackEN") as? String
                // query.feedbackEN=query.appendSquareBrackets(query.feedbackEN)
                query.feedbackGR = children[index].valueForKey("feedbackGR") as? String
                // query.feedbackGR=query.appendSquareBrackets(query.feedbackGR)
                
                query.inputFile = children[index].valueForKey("inputFile") as? String
                query.outputFile = children[index].valueForKey("outputFile") as? String
                query.params = children[index].valueForKey("params") as? String
                query.percentage = children[index].valueForKey("percentage") as? String
                query.queryId = children[index].valueForKey("queryId") as? String
                query.queryName = children[index].valueForKey("queryName") as? String
                query.queryResultId = children[index].valueForKey("queryResultId") as? String
                query.resultCases = children[index].valueForKey("resultCases") as? String
                query.resultTextEN = children[index].valueForKey("resultTextEN") as? String
                query.resultTextGR = children[index].valueForKey("resultTextGR") as? String
                query.rp1 = children[index].valueForKey("rp1") as? String
                query.rp1Source = children[index].valueForKey("rp1Source") as? String
                query.rp2 = children[index].valueForKey("rp2") as? String
                query.rp2Source = children[index].valueForKey("rp2Source") as? String
                query.rp3 = children[index].valueForKey("rp3") as? String
                query.rp3Source = children[index].valueForKey("rp3Source") as? String
                query.rp4 = children[index].valueForKey("rp4") as? String
                query.rp4Source = children[index].valueForKey("rp4Source") as? String
                query.status = children[index].valueForKey("status") as? String
                query.taskId = children[index].valueForKey("taskId") as? String
                query.triggeredAt = children[index].valueForKey("triggeredAt") as? String
                query.userId = children[index].valueForKey("userId") as? String
                query.userRole = children[index].valueForKey("userRole") as? String
                
                self.arrQuery.append(query)
                
                
            }
        }
    }

    
    
}

