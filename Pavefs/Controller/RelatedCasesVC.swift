//
//  RelatedCasesVC.swift
//  Pavefs
//
//  Created by Zacharias Giakoumi on 11/26/15.
//  Copyright © 2015 Nayeye. All rights reserved.
//

import UIKit

class RelatedCasesVC: UIViewController, RelatedCasesServiceDelegate {

    
    
    
    @IBOutlet var titletxt: UILabel!
    @IBOutlet var casenametxt: UILabel!
    @IBOutlet var agetxt: UILabel!
    @IBOutlet var gendertxt: UILabel!
    @IBOutlet var sdatetxt: UILabel!
    @IBOutlet var edatetxt: UILabel!
    
    @IBOutlet var prifilelbl: UILabel!
    
    @IBOutlet var diagnosislbl: UILabel!
    @IBOutlet var d1: UILabel!
    @IBOutlet var d2: UILabel!
    @IBOutlet var d3: UILabel!
    @IBOutlet var d4: UILabel!
    @IBOutlet var d5: UILabel!
    
    @IBOutlet var rtitle: UILabel!
    @IBOutlet var r1: UILabel!
    @IBOutlet var r2: UILabel!
    @IBOutlet var r3: UILabel!
    @IBOutlet var r4: UILabel!
    @IBOutlet var r5: UILabel!
    
    var ontologyDict:Dictionary <String, Ontology> = [String:Ontology]()
    var CaseId :String = ""
    var relatedCaseObj:RelatedCasesModel = RelatedCasesModel()
    
    
    @IBOutlet weak var CaseNameLbl: UILabel!
    @IBOutlet weak var AgeLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var DStartlbl: UILabel!
    @IBOutlet weak var DEndLbl: UILabel!
    
    
    @IBOutlet weak var d1lbl: UILabel!
    @IBOutlet weak var d2lbl: UILabel!
    @IBOutlet weak var d3lbl: UILabel!
    @IBOutlet weak var d4lbl: UILabel!
    
    
    @IBOutlet weak var rh1: UILabel!
    @IBOutlet weak var rh2: UILabel!
    @IBOutlet weak var rh3: UILabel!
    @IBOutlet weak var rh4: UILabel!
    @IBOutlet weak var rh5: UILabel!
    
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.localizedfileds()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = Utility.backButton(self)
        self.title = LocalizedString("Query info", comment:"")

        print("case id is (\(CaseId))")
        
        
        Settings.startLoader()
        self.relatedCaseObj.delegate = self
        self.relatedCaseObj.RelatedCaseResult(CaseId)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func popToPreviousController(sender:UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func RrelatedCasesService(alertMessage:String, moveForward:Bool){
    print("RrelatedCasesService")
    
        Settings.stopLoader()
        
        
       // print(relatedCaseObj.relatedcase.genderLbl)
        //print(ontologyDict["Class_374"]?.children.)
        
        self.CaseNameLbl.text = relatedCaseObj.relatedcase.CaseNameLbl
       
        self.AgeLbl.text = relatedCaseObj.relatedcase.AgeLbl
        self.DStartlbl.text = relatedCaseObj.relatedcase.DStartlbl
        self.DEndLbl.text = relatedCaseObj.relatedcase.DEndLbl
        
        
        if LocalizedGetLanguage() == "el"{
            
            self.genderLbl.text = ontologyDict["Class_\(relatedCaseObj.relatedcase.genderLbl)"]?.labelGR
            self.d1lbl.text = ontologyDict["Class_\(relatedCaseObj.relatedcase.d1)"]?.labelGR
            self.d2lbl.text = ontologyDict["Class_\(relatedCaseObj.relatedcase.d2)"]?.labelGR
            self.d3lbl.text = ontologyDict["Class_\(relatedCaseObj.relatedcase.d3)"]?.labelGR
            self.d4lbl.text = ontologyDict["Class_\(relatedCaseObj.relatedcase.d4)"]?.labelGR
            
            
            self.rh1.text = ontologyDict["Class_\(relatedCaseObj.relatedcase.rh1)"]?.labelGR
            self.rh2.text = ontologyDict["Class_\(relatedCaseObj.relatedcase.rh2)"]?.labelGR
            self.rh3.text = ontologyDict["Class_\(relatedCaseObj.relatedcase.rh3)"]?.labelGR
            self.rh4.text = ontologyDict["Class_\(relatedCaseObj.relatedcase.rh4)"]?.labelGR
            self.rh5.text = ontologyDict["Class_\(relatedCaseObj.relatedcase.rh5)"]?.labelGR
            
        }else{
            
            self.genderLbl.text = ontologyDict["Class_\(relatedCaseObj.relatedcase.genderLbl)"]?.labelEN
            self.d1lbl.text = ontologyDict["Class_\(relatedCaseObj.relatedcase.d1)"]?.labelEN
            self.d2lbl.text = ontologyDict["Class_\(relatedCaseObj.relatedcase.d2)"]?.labelEN
            self.d3lbl.text = ontologyDict["Class_\(relatedCaseObj.relatedcase.d3)"]?.labelEN
            self.d4lbl.text = ontologyDict["Class_\(relatedCaseObj.relatedcase.d4)"]?.labelEN
            
            
            self.rh1.text = ontologyDict["Class_\(relatedCaseObj.relatedcase.rh1)"]?.labelEN
            self.rh2.text = ontologyDict["Class_\(relatedCaseObj.relatedcase.rh2)"]?.labelEN
            self.rh3.text = ontologyDict["Class_\(relatedCaseObj.relatedcase.rh3)"]?.labelEN
            self.rh4.text = ontologyDict["Class_\(relatedCaseObj.relatedcase.rh4)"]?.labelEN
            self.rh5.text = ontologyDict["Class_\(relatedCaseObj.relatedcase.rh5)"]?.labelEN
            
        }
        
    }
    
    func localizedfileds(){
    
        self.title = LocalizedString("Query info", comment:"")
        
       self.titletxt.text = LocalizedString("Query info", comment: "")
        casenametxt.text = LocalizedString("casename", comment: "")

        agetxt.text = LocalizedString("Age", comment: "")

        gendertxt.text = LocalizedString("Sex", comment: "")

        sdatetxt.text = LocalizedString("tmsQuestion", comment: "")

        edatetxt.text = LocalizedString("tmeQuestion", comment: "")

        
        prifilelbl.text = LocalizedString("profilet", comment: "")

        
        diagnosislbl.text = LocalizedString("d1-d5Question", comment: "")

        d1.text = LocalizedString("Diagnosis1", comment: "")

        d2.text = LocalizedString("Diagnosis2", comment: "")

        d3.text = LocalizedString("Diagnosis3", comment: "")

        d4.text = LocalizedString("Diagnosis4", comment: "")

        d5.text = LocalizedString("Diagnosis5", comment: "")

    
        r1.text = LocalizedString("RiskFactor1", comment: "")
        
        r2.text = LocalizedString("RiskFactor2", comment: "")
        
        r3.text = LocalizedString("RiskFactor3", comment: "")
        
        r4.text = LocalizedString("RiskFactor4", comment: "")
        
        r5.text = LocalizedString("RiskFactor5", comment: "")
        
        rtitle.text = LocalizedString("rh1-rh5Question", comment: "")
        //rh1-rh5Question
    }
}
