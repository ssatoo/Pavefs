//
//  OntologyModel.swift
//  Pavefs
//
//  Created by Zacharias Yiakoumi on 21/11/15.
//  Copyright © 2015 Nayeye. All rights reserved.
//

import UIKit


protocol OntologyServiceDelegate
{
    func ontologyService(alertMessage:String, moveForward:Bool)
}
class OntologyModel: NSObject, ServiceAPICallDelegate {

    
    var arrOntology:Array <Ontology>! = []
    var query:Ontology = Ontology()
 
    var ontologyDict:Dictionary <String, Ontology> = [String:Ontology]()
    var alertMessage: String!
    var delegate :OntologyServiceDelegate!
    var ontologyClass :String=String()
    
    
    
    
    
        
    
    func RetrieveOntologyClass(Note:String)
    {
        
        let serviceRequest = ServiceMethod.RetrieveOntologyClassRequest(Note,token: Settings.getToken(), deviceType: globalConstants.deviceType)
        print("serviceRequest \(serviceRequest)")
        let serviceCall:ServiceAPI = ServiceAPI()
        serviceCall.apiDelegate = self;
        serviceCall.sendRequestToServer(serviceRequest, operationName:apiMethod.ONTOLOGYTREE_API)
        
//        let serviceRequest = ServiceMethod.RetrieveOntologyRequest(Settings.getToken(), deviceType: globalConstants.deviceType)
//        print("serviceRequest \(serviceRequest)")
//        let serviceCall:ServiceAPI = ServiceAPI()
//        serviceCall.apiDelegate = self;
//        serviceCall.sendRequestToServer(serviceRequest, operationName:apiMethod.ONTOLOGY_API)
//        self.ontologyClass = Note
        
    }
    
    func RetrieveOntology()
    {
        
        let serviceRequest = ServiceMethod.RetrieveOntologyRequest(Settings.getToken(), deviceType: globalConstants.deviceType)
        print("serviceRequest \(serviceRequest)")
        let serviceCall:ServiceAPI = ServiceAPI()
        serviceCall.apiDelegate = self;
        serviceCall.sendRequestToServer(serviceRequest, operationName:apiMethod.ONTOLOGY_API)
        
    }
    
    func serviceCallDidFinish(response:String, operationName:String)
    {
        
        
        let responseDic:Dictionary <String, AnyObject> = Utility.convertStringToDictionary(response)!
        
      //  print(responseDic)
       
        if(responseDic["success"] as! Int == 1)
        {
            
            if(operationName == apiMethod.ONTOLOGY_API){
            
            let singleOntologyNode = responseDic["data"]
            let children = singleOntologyNode!["singleOntologyNode"]
            self.setUpChildren(children!!)
            // self.setUpChildren(children!)
            
                delegate.ontologyService("", moveForward: false)
            }else if operationName == apiMethod.ONTOLOGYTREE_API{
            
                let data = responseDic["data"]
                print("-----data----\n\(data?.allKeys)")
                //let children=data?.valueForKey("_children")
               
                var children:Array <AnyObject>
                children = (data?.valueForKey("_children"))! as! Array<AnyObject>
                 self.setUpChildren(children[0])

                delegate.ontologyService("", moveForward: false)
                
            
            }
            
        }
        
        
    }
    
    func serviceCallDidFail(error:String, operationName:String)
    {
       
    }
    func setUpChildren(children:AnyObject)
    {
        
       
        //let data = children[].dataUsingEncoding(NSUTF8StringEncoding)
        
    
        print("------------------------------\n\(children.firstItem)\n-----------------------------------")
         print("------------------------------\n\(children.count)\n-----------------------------------")
        if(children.count > 0)
        {
            
        
            
            if(self.arrOntology.count > 0)
            {
                self.arrOntology.removeAll()
            }
            
         
            for var index=0; index < children.count; index++
            {
                
               
                let ontology:Ontology = Ontology()
//               
                
//                  ontology.ontologyClass = children[index].valueForKey("labelGR") as? String
//                  ontology.ontologyLabel = children[index].valueForKey("parentNodes") as? String
//                  self.arrOntology.append(ontology)
//                 self.setUpChildren(children.valueForKey("_children")!)
                
                
                
                
                
                print("in func --\(children.valueForKey("labelEN")![index][index])")
                ontology.descrEN = children[index].valueForKey("descrEN") as? String
                ontology.descrGR = children[index].valueForKey("descrGR") as? String
                ontology.fieldPrefix = children[index].valueForKey("fieldPrefix") as? String
                ontology.labelEN = children[index].valueForKey("labelEN") as? String
                ontology.labelGR = children[index].valueForKey("labelGR") as? String
                ontology.nodeId = children[index].valueForKey("nodeId") as? String
                ontology.order = children[index].valueForKey("order") as? String
                ontology.parentNodes = children[index].valueForKey("parentNodes") as? String
                ontology.siblingNodes = children[index].valueForKey("siblingNodes") as? String
                ontology.children = children[index].valueForKey("_children") as? Array<AnyObject>
                self.arrOntology.append(ontology)
               // self.ontologyDict[ontology.parentNodes] = ontology
                if (ontology.nodeId != nil) {
               
                 
                    self.ontologyDict[ontology.nodeId] = ontology
                    }
                   
                
               // self.arrOntology.append(ontology)
                
               // self.ontologyDict[ontology.parentNodes] = ontology
                
            // }
            }
            
            print("self.arrOntology.count\(self.arrOntology.count)")
            
        }
    }
    
    

    
    
}
