
//
//  RelatedCasesModel.swift
//  Pavefs
//
//  Created by Zacharias Giakoumi on 11/26/15.
//  Copyright © 2015 Nayeye. All rights reserved.
//

import UIKit



protocol RelatedCasesServiceDelegate
{
    func RrelatedCasesService(alertMessage:String, moveForward:Bool)
}


class RelatedCasesModel: NSObject, ServiceAPICallDelegate{

    
    var arrRelatedCase:Array <RelatedCases>! = []
    var relatedcase:RelatedCases = RelatedCases()
    
    
    var alertMessage: String!
    var delegate :RelatedCasesServiceDelegate!
   
    
    
    
    
    func RelatedCaseResult(RcID:String){
        
        let serviceRequest = ServiceMethod.RelatedCasesRequest(RcID, token: Settings.getToken(), deviceType: globalConstants.deviceType)
        print("serviceRequest \(serviceRequest)")
        let serviceCall:ServiceAPI = ServiceAPI()
        serviceCall.apiDelegate = self;
        serviceCall.sendRequestToServer(serviceRequest, operationName:apiMethod.RELATEDCASES_API)
        
        
    }
    
    
    func serviceCallDidFinish(response:String, operationName:String){
    
        let responseDic:Dictionary <String, AnyObject> = Utility.convertStringToDictionary(response)!
        
        print(responseDic)
      
        
        
            
            if(responseDic["success"] as! Int == 1)
            {
                
               
                let children = responseDic["data"]
                
                
                
                
                
                print("case name \(children?.valueForKey("caseName") as! String)")
                relatedcase.CaseNameLbl = children?.valueForKey("caseName") as! String
                relatedcase.AgeLbl =  children?.valueForKey("age") as! String
                relatedcase.genderLbl =  children?.valueForKey("gender") as! String
                relatedcase.DStartlbl =  children?.valueForKey("tms") as! String
                relatedcase.DEndLbl =  children?.valueForKey("tme") as! String
                
                relatedcase.d1 =  children?.valueForKey("d1") as! String
                relatedcase.d2 =  children?.valueForKey("d2") as! String
                relatedcase.d3 =  children?.valueForKey("d3") as! String
                relatedcase.d4 =  children?.valueForKey("d4") as! String
                
                relatedcase.rh1 =  children?.valueForKey("d1") as! String
                relatedcase.rh2 =  children?.valueForKey("d2") as! String
                relatedcase.rh3 =  children?.valueForKey("d3") as! String
                relatedcase.rh4 =  children?.valueForKey("d4") as! String
                relatedcase.rh5 =  children?.valueForKey("d4") as! String
                
                
                delegate.RrelatedCasesService("", moveForward:false)
                
              
            }
            else
            {
                delegate.RrelatedCasesService("Failed", moveForward:false)
            }
            
    }
    
    
   
    
    func serviceCallDidFail(error:String, operationName:String){
    
    }
    
}
