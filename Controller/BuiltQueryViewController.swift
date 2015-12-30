//
//  BuiltQueryViewController.swift
//  Pavefs
//
//  Created by Zacharias Yiakoumi on 21/11/15.
//  Copyright © 2015 Nayeye. All rights reserved.
//

import UIKit

protocol NameForQueryDelegate
{
    func QueryCodeName(NameModel :Child)
    func QueryOntology(OntologyModel :Ontology, lblCode:Int)
    func IndividualCodeName(NameModel :Ontology)
}






class BuiltQueryViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate, IndividualServiceDelegate,OntologyServiceDelegate,ShowDataDelegate {

    var keyForShow :String!
    var DataCase: Int!
    var InCase :String!
    var ontology :Ontology = Ontology()
    var ontologyObj:OntologyModel = OntologyModel()
    var delegate: NameForQueryDelegate!
    var individualObj:IndividualModel = IndividualModel()
     //var individualObj:IndividualModel = IndividualModel()
    
    @IBOutlet weak var QueryData: UITableView!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Query"
        //DataCase = 0
        self.QueryData.delegate = self
        self.QueryData.dataSource = self
        self.navigationItem.leftBarButtonItem = Utility.backButton(self)

       Settings.startLoader()
        
        
        if (InCase != nil) {
            self.ontologyObj.delegate = self
            self.ontologyObj.RetrieveOntologyClass(InCase)
        
        }
      
      //  ontologyObj.delegate = self
        //ontologyObj.RetrieveOntology()
        
        
    }
    func retrieveIndividual ()
    {
       // Settings.startLoader()
        individualObj.retrieveIndividual()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func NextPressed(sender: UIButton!) {
    //edw
        ontologyObj.setUpChildren(ontologyObj.arrOntology[sender.tag].children)
        self.QueryData.reloadData()
    
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
         let cell = tableView.dequeueReusableCellWithIdentifier("OntologyCellIdentifier", forIndexPath: indexPath) as! OntologyCell
        
        cell.titleLbl.font=UIFont(name: cell.textLabel!.font.fontName, size: 12)
        cell.titleLbl?.lineBreakMode = NSLineBreakMode.ByWordWrapping;
        cell.titleLbl?.numberOfLines = 0;
        if (DataCase != nil) {
        switch(DataCase){
        case 1 :
            
           cell.titleLbl?.text = self.individualObj.arrChildren[indexPath.row].child_code
            
            break
        default  :
            
            if (self.ontologyObj.arrOntology[indexPath.row].children != nil){
                cell.nextBtn.addTarget(self, action: "NextPressed:", forControlEvents: .TouchUpInside)
                cell.nextBtn.tag = indexPath.row
                if LocalizedGetLanguage() == "el"{
                cell.titleLbl?.text = "\(self.ontologyObj.arrOntology[indexPath.row].labelGR)"
                
                }else{
                 cell.titleLbl?.text = "\(self.ontologyObj.arrOntology[indexPath.row].labelEN)"
                
                }
                cell.nextChildrenImg.hidden=false
            }else{
                
                if LocalizedGetLanguage() == "el"{
                cell.titleLbl?.text = self.ontologyObj.arrOntology[indexPath.row].labelGR
                }else{
                cell.titleLbl?.text = self.ontologyObj.arrOntology[indexPath.row].labelEN
                
                }
                 cell.nextChildrenImg.hidden=true
            }
            break
           
        
        }
        }else{
            if (self.ontologyObj.arrOntology[indexPath.row].children != nil){
                
                cell.nextBtn.addTarget(self, action: "NextPressed:", forControlEvents: .TouchUpInside)
                cell.nextBtn.tag = indexPath.row
                if LocalizedGetLanguage() == "el"{
                    cell.titleLbl?.text = "\(self.ontologyObj.arrOntology[indexPath.row].labelGR)"
                    
                }else{
                    cell.titleLbl?.text = "\(self.ontologyObj.arrOntology[indexPath.row].labelEN)"
                    
                }
                cell.nextChildrenImg.hidden=false
            }else{
                
                if LocalizedGetLanguage() == "el"{
                    cell.titleLbl?.text = self.ontologyObj.arrOntology[indexPath.row].labelGR
                }else{
                    cell.titleLbl?.text = self.ontologyObj.arrOntology[indexPath.row].labelEN
                    
                }
                cell.nextChildrenImg.hidden=true
            }

        
        }
        
        
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("DataCase ---> \(self.DataCase)")
        if (DataCase != nil) {
        
        switch(DataCase){
        case 1 :
            
            return self.individualObj.arrChildren.count
            
            
       default :
            
            return self.ontologyObj.arrOntology.count
            
       
            
        }

        }else{
        
        return self.ontologyObj.arrOntology.count
        }
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
        
        if (DataCase != nil) {
        switch(DataCase){
        case 1 :
            
            delegate.QueryCodeName(self.individualObj.arrChildren[indexPath.row])
            self.navigationController?.popViewControllerAnimated(true)

            
            break
//
        default :
//            if (self.ontologyObj.arrOntology[indexPath.row].children != nil){
//            ontologyObj.setUpChildren(ontologyObj.arrOntology[indexPath.row].children)
//            self.QueryData.reloadData()
//            }else{
//           
//            
//                
            delegate.QueryOntology(self.ontologyObj.arrOntology[indexPath.row],lblCode: DataCase)
            self.navigationController?.popViewControllerAnimated(true)
           // }
            break
        }
        }else{
        
//            if (self.ontologyObj.arrOntology[indexPath.row].children != nil){
//                ontologyObj.setUpChildren(ontologyObj.arrOntology[indexPath.row].children)
//                self.QueryData.reloadData()
//            }else{
//                
//                delegate.IndividualCodeName(ontologyObj.arrOntology[indexPath.row])
//                
              delegate.IndividualCodeName(self.ontologyObj.arrOntology[indexPath.row])
//              
               self.navigationController?.popViewControllerAnimated(true)
//            }

        }
        
        
    }
    func popToPreviousController(sender:UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }

    
    func individualService(operationName:String, alertMessage:String, moveForward: Bool)
    {
        Settings.stopLoader()
        self.QueryData.reloadData()
        
    }

    func ontologyService(alertMessage:String, moveForward:Bool){
    print("ontology")
        Settings.stopLoader()
        self.QueryData.reloadData()
        
        
    }

    func TheDataIs(Data:Int){
    self.DataCase = Data
        print("Data (\(Data))")
        switch(Data){
        case 1 :
           
            self.individualObj.delegate = self
            self.retrieveIndividual()
            
        break
        case 2 :
            
            self.ontologyObj.delegate = self
            self.ontologyObj.RetrieveOntologyClass("Class_13")
            
            // self.ontologyObj.RetrieveOntology()
            
            
            break
        case 3: //Class_675
            self.ontologyObj.delegate = self
            self.ontologyObj.RetrieveOntologyClass("Class_675")
            break
        case 4: //Class_459
            self.ontologyObj.delegate = self
            self.ontologyObj.RetrieveOntologyClass("Class_459")
            break
        case 5: //Class_336
            self.ontologyObj.delegate = self
            self.ontologyObj.RetrieveOntologyClass("Class_336")
            break
        case 6: //Class_336
            self.ontologyObj.delegate = self
            self.ontologyObj.RetrieveOntologyClass("Class_676")
            break
        case 7,72,73: //Class_676
            self.ontologyObj.delegate = self
            self.ontologyObj.RetrieveOntologyClass("Class_127")
            break
        case 8,82,83,84: //Class_127
            self.ontologyObj.delegate = self
            self.ontologyObj.RetrieveOntologyClass("Class_49")
            break
        case 9,92,93,94: //Class_49
            self.ontologyObj.delegate = self
            self.ontologyObj.RetrieveOntologyClass("Class_611")
            break
//        case 10: //Class_415
//            self.ontologyObj.delegate = self
//            self.ontologyObj.RetrieveOntologyClass("Class_415")
//            break
        case 10,102,103,104: //Class_144
            self.ontologyObj.delegate = self
            self.ontologyObj.RetrieveOntologyClass("Class_144")
            break
        case 11: //Class_542
            self.ontologyObj.delegate = self
            self.ontologyObj.RetrieveOntologyClass("Class_85")
            break
        case 12,122,123,124: //Class_232
            self.ontologyObj.delegate = self
            self.ontologyObj.RetrieveOntologyClass("Class_542")
            break
        case 13: //Class_732
            self.ontologyObj.delegate = self
            self.ontologyObj.RetrieveOntologyClass("Class_232")
            break
        case 14: //Class_739
            self.ontologyObj.delegate = self
            self.ontologyObj.RetrieveOntologyClass("Class_732")
            break
            
        case 15: //Class_733
            self.ontologyObj.delegate = self
            self.ontologyObj.RetrieveOntologyClass("Class_739")
            break
        case 16: //Class_733
            self.ontologyObj.delegate = self
            self.ontologyObj.RetrieveOntologyClass("Class_733")
            break
        case 17 :
            self.ontologyObj.delegate = self
            self.ontologyObj.RetrieveOntologyClass("Class_415")
            break
            
        default :
            break
        }
        
    }
   
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.individualObj.delegate = self
        self.ontologyObj.delegate = self
    }
}
