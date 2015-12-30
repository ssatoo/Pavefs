//
//  IndividualDetailVC.swift
//  Pavefs
//


import UIKit

class IndividualDetailVC: UIViewController, IndividualServiceDelegate,NameForQueryDelegate
{
    
    var child:Child = Child()
    var individualObj:IndividualModel = IndividualModel()
    var IndCase: String = "0"
    
    var ChosenText :NETextField = NETextField()
    
    
    @IBOutlet var scrollView : UIScrollView!
    @IBOutlet var containerView : UIView!
    
    @IBOutlet var lblChildCode: UILabel!
    @IBOutlet var txtChildCode : NETextField!
    
    @IBOutlet var lblBirthMonth: UILabel!
    @IBOutlet var txtBirthMonth : NETextField!
    
    @IBOutlet var lblBirthYear: UILabel!
    @IBOutlet var txtBirthYear: NETextField!
    
    @IBOutlet var lblSex: UILabel!
    @IBOutlet var txtSex : NETextField!
    
    @IBOutlet var lblDiagnosisDate: UILabel!
    @IBOutlet var txtDiagnosisDate : NETextField!
    
    @IBOutlet var lblFunctionalityLevel: UILabel!
    @IBOutlet var txtFunctionalityLevel : NETextField!
    
    @IBOutlet var lblEducationLevel: UILabel!
    @IBOutlet var txtEducationLevel : NETextField!
    
    @IBOutlet var lblInsuranceType: UILabel!
    @IBOutlet var txtInsuranceType : NETextField!
    
    @IBOutlet var lblDiagnosis1: UILabel!
    @IBOutlet var txtDiagnosis1 : NETextField!
    
    @IBOutlet var lblDiagnosis2: UILabel!
    @IBOutlet var txtDiagnosis2 : NETextField!
    
    @IBOutlet var lblDiagnosis3: UILabel!
    @IBOutlet var txtDiagnosis3 : NETextField!
    
    @IBOutlet var lblDiagnosis4: UILabel!
    @IBOutlet var txtDiagnosis4 : NETextField!
    
    @IBOutlet var lblDiagnosis5: UILabel!
    @IBOutlet var txtDiagnosis5 : NETextField!
    
    @IBOutlet var lblRiskFactor1: UILabel!
    @IBOutlet var txtRiskFactor1 : NETextField!
    
    @IBOutlet var lblRiskFactor2: UILabel!
    @IBOutlet var txtRiskFactor2 : NETextField!
    
    @IBOutlet var lblRiskFactor3: UILabel!
    @IBOutlet var txtRiskFactor3 : NETextField!
    
    @IBOutlet var lblRiskFactor4: UILabel!
    @IBOutlet var txtRiskFactor4 : NETextField!
    
    @IBOutlet var lblRiskFactor5: UILabel!
    @IBOutlet var txtRiskFactor5 : NETextField!
    
    @IBOutlet var btnSubmit: UIButton!
    
    var activeField: UITextField?
    
    var selectionType:String!
    
    var arrFunctionality:Array<PickerData> = []
    var arrInsurance:Array<PickerData> = []
    var arrEducationLevel:Array<PickerData> = []
    
    @IBOutlet var selectionPicker: UIPickerView!
    @IBOutlet var pickerView: UIView!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var datePickerView: UIView!
    
    @IBOutlet var btnDropdownDiagnosisDate: UIButton!
    @IBOutlet var btnDropdownFunctionality: UIButton!
    @IBOutlet var btnDropdownEducationalLevel: UIButton!
    @IBOutlet var btnDropdownInsuranceType: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //self.setNavigationBarItem()
        self.btnSubmit.setTitle("Delete", forState: UIControlState.Normal)
        self.title = self.child.child_code
        self.navigationItem.leftBarButtonItem = Utility.backButton(self)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: "editTapped")
        
        self.selectionType = "1"
        self.pickerView.hidden = true
        self.datePickerView.hidden = true
        
        txtDiagnosisDate.userInteractionEnabled = false
        txtFunctionalityLevel.userInteractionEnabled = false
        txtEducationLevel.userInteractionEnabled = false
        txtInsuranceType.userInteractionEnabled = false
       
        self.localizeUIElements()
        
        self.individualObj.delegate = self
        
    }
    
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let center = NSNotificationCenter.defaultCenter()
        center.addObserver(self, selector: "keyboardOnScreen:", name: UIKeyboardDidShowNotification, object: nil)
        center.addObserver(self, selector: "keyboardOffScreen:", name: UIKeyboardDidHideNotification, object: nil)
        
        
        if ChosenText.text == "" {
        
            txtChildCode.becomeFirstResponder()
        }else if ChosenText == txtSex {
             txtChildCode.becomeFirstResponder()
        }
       
       
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        if IndCase == "0" {
            self.getFileData()
            self.setUpFields()
            self.activateTextField(false)
        }else{
        
            self.activateTextField(true)
        }
        
//        self.txtDiagnosis1.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchUpInside)
//        self.txtDiagnosis2.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
//        self.txtDiagnosis3.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
//        self.txtDiagnosis4.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
//        self.txtDiagnosis5.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
//        
//        self.txtRiskFactor1.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
//        self.txtRiskFactor2.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
//        self.txtRiskFactor3.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
//        self.txtRiskFactor4.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
//        self.txtRiskFactor5.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
//        
//        self.txtSex.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        
    }
    func myTargetFunction(textField: NETextField) {
        // user touch field
        print("whathappentxt touched")
        ChosenText = textField
        IndCase = "Class_\(textField.tag)"
        
        
        self.performSegueWithIdentifier("mySegueInd", sender: self)
    }
    
    
    func editTapped ()
    {
        print("Edit Tapped")
        self.btnSubmit.setTitle("Submit", forState: UIControlState.Normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "cancelTapped")
        self.activateTextField(true)
    }
    
    func cancelTapped()
    {
         self.btnSubmit.setTitle("Delete", forState: UIControlState.Normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: "editTapped")
        self.activateTextField(false)
        self.view.endEditing(true)
        self.pickerView.hidden = true
        self.datePickerView.hidden = true
    }
    
    func activateTextField (acitvate:Bool)
    {
        for view in self.containerView.subviews 
        {
            if let textField = view as? NETextField
            {
                if(acitvate == false)
                {
                    textField.backgroundColor = UIColor.whiteColor()
                    textField.userInteractionEnabled = false
                }
                else
                {
                    textField.backgroundColor = UIColor.clearColor()
                    textField.userInteractionEnabled = true

                }
            }
        }
        
        if(acitvate == true)
        {
            txtDiagnosisDate.userInteractionEnabled = false
            txtFunctionalityLevel.userInteractionEnabled = false
            txtEducationLevel.userInteractionEnabled = false
            txtInsuranceType.userInteractionEnabled = false
            
            btnDropdownDiagnosisDate.userInteractionEnabled = true
            btnDropdownFunctionality.userInteractionEnabled = true
            btnDropdownEducationalLevel.userInteractionEnabled = true
            btnDropdownInsuranceType.userInteractionEnabled = true
          //  btnSubmit.userInteractionEnabled = true

        }
        else
        {
            btnDropdownDiagnosisDate.userInteractionEnabled = false
            btnDropdownFunctionality.userInteractionEnabled = false
            btnDropdownEducationalLevel.userInteractionEnabled = false
            btnDropdownInsuranceType.userInteractionEnabled = false
           // btnSubmit.userInteractionEnabled = false
        }
    }
    
    func popToPreviousController(sender:UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }

    
    func getFileData()
    {
        self.arrFunctionality = Utility.fileData("Functionality", keyValue:"functionality")
        self.arrEducationLevel = Utility.fileData("EducationLevel2", keyValue:"education")
        self.arrInsurance = Utility.fileData("Insurance", keyValue:"insurance")
        
        
    }
    
    func localizeUIElements ()
    {
        
        
        self.lblChildCode.text = LocalizedString("ChildCode", comment:"")
        self.txtChildCode!.placeholder = LocalizedString("ChildCodePlaceholder", comment:"")
        self.lblBirthMonth.text = LocalizedString("BirthMonth", comment:"")
        self.txtBirthMonth!.placeholder = LocalizedString("BirthMonthPlaceholder", comment:"")
        self.lblBirthYear.text = LocalizedString("BirthYear", comment:"")
        self.txtBirthYear!.placeholder = LocalizedString("BirthYearPlaceholder", comment:"")
        self.lblSex.text = LocalizedString("Sex", comment:"")
        self.txtSex!.placeholder = LocalizedString("SexPlaceholder", comment:"")
        self.lblDiagnosisDate.text = LocalizedString("DiagnosisDate", comment:"")
        self.txtDiagnosisDate!.placeholder = LocalizedString("DiagnosisDatePlaceholder", comment:"")
        self.lblFunctionalityLevel.text = LocalizedString("FunctionalityLevel", comment:"")
        self.txtFunctionalityLevel!.placeholder = LocalizedString("FunctionalityLevelPlaceholder", comment:"")
        self.lblEducationLevel.text = LocalizedString("EducationLevel", comment:"")
        self.txtEducationLevel!.placeholder = LocalizedString("EducationLevelPlaceholder", comment:"")
        self.lblInsuranceType.text = LocalizedString("InsuranceType", comment:"")
        self.txtInsuranceType!.placeholder = LocalizedString("InsuranceTypePlaceholder", comment:"")
        self.lblDiagnosis1.text = LocalizedString("Diagnosis1", comment:"")
        self.txtDiagnosis1!.placeholder = LocalizedString("Diagnosis1Placeholder", comment:"")
        self.lblDiagnosis2.text = LocalizedString("Diagnosis2", comment:"")
        self.txtDiagnosis2!.placeholder = LocalizedString("Diagnosis2Placeholder", comment:"")
        self.lblDiagnosis3.text = LocalizedString("Diagnosis3", comment:"")
        self.txtDiagnosis3!.placeholder = LocalizedString("Diagnosis3Placeholder", comment:"")
        self.lblDiagnosis4.text = LocalizedString("Diagnosis4", comment:"")
        self.txtDiagnosis4!.placeholder = LocalizedString("Diagnosis4Placeholder", comment:"")
        self.lblDiagnosis5.text = LocalizedString("Diagnosis5", comment:"")
        self.txtDiagnosis5!.placeholder = LocalizedString("Diagnosis5Placeholder", comment:"")
        self.lblRiskFactor1.text = LocalizedString("RiskFactor1", comment:"")
        self.txtRiskFactor1!.placeholder = LocalizedString("RiskFactor1Placeholder", comment:"")
        self.lblRiskFactor2.text = LocalizedString("RiskFactor2", comment:"")
        self.txtRiskFactor2!.placeholder = LocalizedString("RiskFactor2Placeholder", comment:"")
        self.lblRiskFactor3.text = LocalizedString("RiskFactor3", comment:"")
        self.txtRiskFactor3!.placeholder = LocalizedString("RiskFactor3Placeholder", comment:"")
        self.lblRiskFactor4.text = LocalizedString("RiskFactor4", comment:"")
        self.txtRiskFactor4!.placeholder = LocalizedString("RiskFactor4Placeholder", comment:"")
        self.lblRiskFactor5.text = LocalizedString("RiskFactor5", comment:"")
        self.txtRiskFactor5!.placeholder = LocalizedString("RiskFactor5Placeholder", comment:"")
        
      //  self.btnSubmit.setTitle(LocalizedString("Submit", comment:""), forState: UIControlState.Normal)
        
    }
    
    func setUpFields ()
    {
        self.txtChildCode.text = self.child.child_code
        self.txtBirthMonth.text = self.child.birth_month
        self.txtBirthYear.text = self.child.birth_year
        self.txtSex.text = self.child.sex_label
        
        self.txtSex.indID = self.child.sex + " " + self.child.sex_label
        
        self.txtDiagnosisDate.text = self.child.diagnosis_date
        self.txtDiagnosis1.text = self.child.d1_label
        self.txtDiagnosis2.text = self.child.d2_label
        self.txtDiagnosis3.text = self.child.d3_label
        self.txtDiagnosis4.text = self.child.d4_label
        self.txtDiagnosis5.text = self.child.d5_label
        self.txtRiskFactor1.text = self.child.rh1_label
        self.txtRiskFactor2.text = self.child.rh2_label
        self.txtRiskFactor3.text = self.child.rh3_label
        self.txtRiskFactor4.text = self.child.rh4_label
        self.txtRiskFactor5.text = self.child.rh5_label
        
        self.txtDiagnosis1.indID = self.child.d1 + " " + self.child.d1_label
        self.txtDiagnosis2.indID = self.child.d2 + " " + self.child.d2_label
        self.txtDiagnosis3.indID = self.child.d3 + " " + self.child.d3_label
        self.txtDiagnosis4.indID = self.child.d4 + " " + self.child.d4_label
        self.txtDiagnosis5.indID = self.child.d5 + " " + self.child.d5_label
        self.txtRiskFactor1.indID = self.child.rh1 + " " + self.child.rh1_label
        self.txtRiskFactor2.indID = self.child.rh2 + " " + self.child.rh2_label
        self.txtRiskFactor3.indID = self.child.rh3 + " " + self.child.rh3_label
        self.txtRiskFactor4.indID = self.child.rh4 + " " + self.child.rh4_label
        self.txtRiskFactor5.indID = self.child.rh5 + " " + self.child.rh5_label
        
       // self.txtChildCode.indID = self.child.d1
       
     //   let str = "\(self.child.sex.stringByReplacingOccurrencesOfString("Class_", withString: "["))]"
       
        
        if txtSex.indID.containsString("Class_"){
        self.txtSex.indID = "\(self.child.sex.stringByReplacingOccurrencesOfString("Class_", withString: "["))] \(self.child.sex_label)"
        }
        if txtDiagnosis1.indID.containsString("Class_"){
            self.txtDiagnosis1.indID =  "\(self.child.d1.stringByReplacingOccurrencesOfString("Class_", withString: "["))] \(self.child.d1_label)"
        }
        
        if txtDiagnosis2.indID.containsString("Class_"){
            self.txtDiagnosis2.indID =  "\(self.child.d2.stringByReplacingOccurrencesOfString("Class_", withString: "["))] \(self.child.d2_label)"
        }
        if txtDiagnosis3.indID.containsString("Class_"){
            self.txtDiagnosis3.indID =  "\(self.child.d3.stringByReplacingOccurrencesOfString("Class_", withString: "["))] \(self.child.d3_label)"
        }
        if txtDiagnosis4.indID.containsString("Class_"){
        self.txtDiagnosis4.indID =  "\(self.child.d4.stringByReplacingOccurrencesOfString("Class_", withString: "["))] \(self.child.d4_label)"
        }
         if txtDiagnosis5.indID.containsString("Class_"){
        self.txtDiagnosis5.indID =  "\(self.child.d5.stringByReplacingOccurrencesOfString("Class_", withString: "["))] \(self.child.d5_label)"
        }
        
        if txtRiskFactor1.indID.containsString("Class_"){
        self.txtRiskFactor1.indID =  "\(self.child.rh1.stringByReplacingOccurrencesOfString("Class_", withString: "["))] \(self.child.rh1_label)"
        }
        
        if txtRiskFactor2.indID.containsString("Class_"){
        self.txtRiskFactor2.indID =  "\(self.child.rh2.stringByReplacingOccurrencesOfString("Class_", withString: "["))] \(self.child.rh2_label)"
        }
        
        if txtRiskFactor3.indID.containsString("Class_"){
        self.txtRiskFactor3.indID =  "\(self.child.rh3.stringByReplacingOccurrencesOfString("Class_", withString: "["))] \(self.child.rh3_label)"
        }
        
        if txtRiskFactor4.indID.containsString("Class_"){
        self.txtRiskFactor4.indID =  "\(self.child.rh4.stringByReplacingOccurrencesOfString("Class_", withString: "["))] \(self.child.rh4_label)"
        }
        
        if txtRiskFactor5.indID.containsString("Class_"){
        self.txtRiskFactor5.indID =  "\(self.child.rh5.stringByReplacingOccurrencesOfString("Class_", withString: "["))] \(self.child.rh5_label)"
        }
        
       
        
        if(!self.child.functionality_level.isEmpty || self.child.functionality_level != "0")
        {
            self.txtFunctionalityLevel.text =  self.filter(self.child.functionality_level, inArray:self.arrFunctionality)
        }
        else
        {
            self.txtFunctionalityLevel.text = self.child.functionality_level
        }
        if(!self.child.education_level.isEmpty || self.child.education_level != "0")
        {
            self.txtEducationLevel.text = self.filter(self.child.education_level, inArray:self.arrEducationLevel)
        }
        else
        {
            self.txtEducationLevel.text = self.child.education_level
        }
        if(!self.child.insurance_type.isEmpty || self.child.insurance_type != "0")
        {
            self.txtInsuranceType.text = self.filter(self.child.insurance_type, inArray:self.arrInsurance)
        }
        else
        {
            self.txtInsuranceType.text = self.child.insurance_type
        }

        
    }
    
    func editingBegan(sender: UITextField) {
        
        if(sender == txtSex)
                {
                    ChosenText = txtSex
                    IndCase = "Class_\(ChosenText.tag)"
                    self.performSegueWithIdentifier("mySegueInd", sender: self)
        
                }
                else if(sender == txtDiagnosis1)
                {
                    ChosenText = txtDiagnosis1
                    IndCase = "Class_\(ChosenText.tag)"
                     self.performSegueWithIdentifier("mySegueInd", sender: self)
        
                }
                else if(sender == txtDiagnosis2)
                {
                    ChosenText = txtDiagnosis2
                    IndCase = "Class_\(ChosenText.tag)"
                     self.performSegueWithIdentifier("mySegueInd", sender: self)
        
                }
                else if(sender == txtDiagnosis3)
                {
                    ChosenText = txtDiagnosis3
                    IndCase = "Class_\(ChosenText.tag)"
                     self.performSegueWithIdentifier("mySegueInd", sender: self)
        
                }
                else if(sender == txtDiagnosis4)
                {
                    ChosenText = txtDiagnosis4
                    IndCase = "Class_\(ChosenText.tag)"
                     self.performSegueWithIdentifier("mySegueInd", sender: self)
        
                }
                else if(sender == txtDiagnosis5)
                {
                    ChosenText = txtDiagnosis5
                    IndCase = "Class_\(ChosenText.tag)"
                     self.performSegueWithIdentifier("mySegueInd", sender: self)
        
                }
                else if(sender == txtRiskFactor1)
                {
                    ChosenText = txtRiskFactor1
                    IndCase = "Class_\(ChosenText.tag)"
                     self.performSegueWithIdentifier("mySegueInd", sender: self)
        
                }
                else if(sender == txtRiskFactor2)
                {
                    ChosenText = txtRiskFactor2
                    IndCase = "Class_\(ChosenText.tag)"
                     self.performSegueWithIdentifier("mySegueInd", sender: self)
        
                }
                else if(sender == txtRiskFactor3)
                {
                    ChosenText = txtRiskFactor3
                    IndCase = "Class_\(ChosenText.tag)"
                     self.performSegueWithIdentifier("mySegueInd", sender: self)
                }
                else if(sender == txtRiskFactor4)
                {
                    ChosenText = txtRiskFactor4
                    IndCase = "Class_\(ChosenText.tag)"
                     self.performSegueWithIdentifier("mySegueInd", sender: self)
                }
                else if(sender == txtRiskFactor5)
                {
                    ChosenText = txtRiskFactor5
                    IndCase = "Class_\(ChosenText.tag)"
                     self.performSegueWithIdentifier("mySegueInd", sender: self)
                }else{
                    activeField = sender
                }
    
    }
    
    func keyboardOnScreen(notification: NSNotification)
    {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            //let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
            print("Width :- %@",  keyboardSize.width)
            print("Height :- %@",  keyboardSize.height)
            
            let contentInsets:UIEdgeInsets  = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height+20, 0.0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
            var aRect: CGRect = self.view.frame
            aRect.size.height -= keyboardSize.height
            //you may not need to scroll, see if the active field is already visible
           
            if (activeField != nil) {
            
                if (!CGRectContainsPoint(aRect, activeField!.frame.origin) ) {
                    let scrollPoint:CGPoint = CGPointMake(0.0, activeField!.frame.origin.y - keyboardSize.height)
                    scrollView.setContentOffset(scrollPoint, animated: true)
                }
            }
        }
        
        
    }
    
    func keyboardOffScreen(notification: NSNotification){
        let contentInsets:UIEdgeInsets = UIEdgeInsetsZero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool
    {
        
        if(textField == txtSex)
        {
           self.editingBegan(textField)
            
        }
        else if(textField == txtDiagnosis1)
        {
            self.editingBegan(textField)
            
        }
        else if(textField == txtDiagnosis2)
        {
            self.editingBegan(textField)
            
        }
        else if(textField == txtDiagnosis3)
        {
            self.editingBegan(textField)
            
        }
        else if(textField == txtDiagnosis4)
        {
            self.editingBegan(textField)
            
        }
        else if(textField == txtDiagnosis5)
        {
            self.editingBegan(textField)
            
        }
        else if(textField == txtRiskFactor1)
        {
            self.editingBegan(textField)
            
        }
        else if(textField == txtRiskFactor2)
        {
            self.editingBegan(textField)
            
        }
        else if(textField == txtRiskFactor3)
        {
            self.editingBegan(textField)
        }
        else if(textField == txtRiskFactor4)
        {
            self.editingBegan(textField)
        }
        else if(textField == txtRiskFactor5)
        {
            self.editingBegan(textField)
        }else{
            self.editingBegan(textField)
            self.addToolBar(textField)
        }

        
        
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        
        
        
        if(textField == txtChildCode)
        {
            self.child.child_code = txtChildCode.text
            txtBirthMonth.becomeFirstResponder()
            
            
        }
        else if(textField == txtBirthMonth)
        {
            self.child.birth_month = txtBirthMonth.text
            txtBirthYear.becomeFirstResponder()
            
        }
        else if(textField == txtBirthYear)
        {
            self.child.birth_year = txtBirthYear.text
            txtSex.becomeFirstResponder()
            
        }
//        else if(textField == txtSex)
//        {
//            self.child.sex = txtSex.text
//            txtDiagnosis1.becomeFirstResponder()
//            
//        }
//        else if(textField == txtDiagnosis1)
//        {
//            self.child.d1 = txtDiagnosis1.text
//            txtDiagnosis2.becomeFirstResponder()
//            
//        }
//        else if(textField == txtDiagnosis2)
//        {
//            self.child.d2 = txtDiagnosis2.text
//            txtDiagnosis3.becomeFirstResponder()
//            
//        }
//        else if(textField == txtDiagnosis3)
//        {
//            self.child.d3 = txtDiagnosis3.text
//            txtDiagnosis4.becomeFirstResponder()
//            
//        }
//        else if(textField == txtDiagnosis4)
//        {
//            self.child.d4 = txtDiagnosis4.text
//            txtDiagnosis5.becomeFirstResponder()
//            
//        }
//        else if(textField == txtDiagnosis5)
//        {
//            self.child.d5 = txtDiagnosis5.text
//            txtRiskFactor1.becomeFirstResponder()
//            
//        }
//        else if(textField == txtRiskFactor1)
//        {
//            self.child.rh1 = txtRiskFactor1.text
//            txtRiskFactor2.becomeFirstResponder()
//            
//        }
//        else if(textField == txtRiskFactor2)
//        {
//            self.child.rh2 = txtRiskFactor2.text
//            txtRiskFactor3.becomeFirstResponder()
//            
//        }
//        else if(textField == txtRiskFactor3)
//        {
//            self.child.rh3 = txtRiskFactor3.text
//            txtRiskFactor4.becomeFirstResponder()
//        }
//        else if(textField == txtRiskFactor4)
//        {
//            self.child.rh4 = txtRiskFactor4.text
//            txtRiskFactor5.becomeFirstResponder()
//        }
//        else if(textField == txtRiskFactor5)
//        {
//            self.child.rh5 = txtRiskFactor5.text
//            txtRiskFactor5.resignFirstResponder()
//        }

        
        return true
    }
    
    func addToolBar (textField:UITextField)
    {
        let keyboardToolbar = UIToolbar(frame: CGRectMake(0,0,320,50))
        keyboardToolbar.barStyle = UIBarStyle.Default
        
        if(textField == txtBirthMonth || textField == txtBirthYear)
        {
            keyboardToolbar.items = [
                UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "keyboardCancelButtonTapped:"),
                UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil),
                UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.Plain, target: self, action: "keyboardNextButtonTapped:"),
            ]
        }
        else
        {
            keyboardToolbar.items = [
                UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "keyboardCancelButtonTapped:"),
                UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil),
            ]
        }
        
        keyboardToolbar.sizeToFit()
        keyboardToolbar.barTintColor = UIColor.orangeColor()
        textField.inputAccessoryView = keyboardToolbar
        
    }
    func keyboardCancelButtonTapped (sender:UIBarButtonItem)
    {
        self.view.endEditing(true)
    }
    
    func keyboardNextButtonTapped (sender:UIBarButtonItem)
    {
        if(activeField == txtBirthMonth)
        {
            txtBirthYear.becomeFirstResponder()
        }
        else if(activeField == txtBirthYear)
        {
            txtSex.becomeFirstResponder()
        }
    }
    
    
    
    @IBAction func submit (sender:UIButton)
    {
        
      
        if sender.titleLabel?.text == "Submit" {
         self.btnSubmit.setTitle("Delete", forState: UIControlState.Normal)
            
            self.child.child_code = txtChildCode.text
            self.child.birth_month = txtBirthMonth.text
            self.child.birth_year = txtBirthYear.text
            self.child.sex = txtSex.indID
            self.child.diagnosis_date = txtDiagnosisDate.text
            print("txtDiagnosis1.indID (\(txtDiagnosis1.indID))")
            self.child.d1 = txtDiagnosis1.indID
            self.child.d2 = txtDiagnosis2.indID
            self.child.d3 = txtDiagnosis3.indID
            self.child.d4 = txtDiagnosis4.indID
            self.child.d5 = txtDiagnosis5.indID
            self.child.rh1 = txtRiskFactor1.indID
            self.child.rh2 = txtRiskFactor2.indID
            self.child.rh3 = txtRiskFactor3.indID
            self.child.rh4 = txtRiskFactor4.indID
            self.child.rh5 = txtRiskFactor5.indID
            
            self.individualObj.selectedChild = self.child
            
            if !individualObj.validateChildCode()
            {
                showAlertWithMessage(individualObj.alertMessage)
            }
            else if !individualObj.validateBirthMonth()
            {
                showAlertWithMessage(individualObj.alertMessage)
            }
            else if !individualObj.validateBirthYear()
            {
                showAlertWithMessage(individualObj.alertMessage)
            }
            else if !individualObj.validateSex()
            {
                showAlertWithMessage(individualObj.alertMessage)
            }
            else if !individualObj.validateDiagnosisDate()
            {
                showAlertWithMessage(individualObj.alertMessage)
            }
            else if !individualObj.validateFunctionalityLevel()
            {
                showAlertWithMessage(individualObj.alertMessage)
            }
            else if !individualObj.validateEducationLevel()
            {
                showAlertWithMessage(individualObj.alertMessage)
            }
            else if !individualObj.validateInsuranceType()
            {
                showAlertWithMessage(individualObj.alertMessage)
            }
            else if !individualObj.validateDiagnosis1()
            {
                showAlertWithMessage(individualObj.alertMessage)
            }
            else if !individualObj.validateRiskFactor1()
            {
                showAlertWithMessage(individualObj.alertMessage)
            }
            else
            {
                Settings.startLoader()
                individualObj.editingChild = true
                individualObj.selectedChild = self.child
                individualObj.editIndividual()
            }

            self.activateTextField(false)
        }else{
         self.btnSubmit.setTitle("Submit", forState: UIControlState.Normal)
            
            
            let alert = UIAlertController(title: "", message: "Delete individual?", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default, handler: nil))
            alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default, handler: { action in
                switch action.style{
                case .Default:
                    print("default")
                    print("Deleted")
                    // self.individualObj.selectedChild = self.child
                    Settings.startLoader()
                    self.individualObj.deleteIndividual()
                    self.navigationController?.popViewControllerAnimated(true)
                case .Cancel:
                    print("cancel")
                    
                case .Destructive:
                    print("destructive")
                }
            }))
            self.presentViewController(alert, animated: true, completion: nil)
            
            
            
       
            

        
        }
        
        
        
    }
    
    
    @IBAction func dropDownButtonClicked (sender:UIButton)
    {
        var viewOfPicker:UIView
        
        if(sender.tag == globalConstants.openPicker.functionality)
        {
            self.selectionType = "5"
            self.selectionPicker.reloadAllComponents()
            pickerView.hidden = false
            viewOfPicker = pickerView
            self.editingBegan(txtFunctionalityLevel)
        }
        else if(sender.tag == globalConstants.openPicker.education)
        {
            self.selectionType = "4"
            self.selectionPicker.reloadAllComponents()
            pickerView.hidden = false
            viewOfPicker = pickerView
            self.editingBegan(txtEducationLevel)
        }
        else if(sender.tag == globalConstants.openPicker.insurance)
        {
            self.selectionType = "6"
            self.selectionPicker.reloadAllComponents()
            pickerView.hidden = false
            viewOfPicker = pickerView
            self.editingBegan(txtInsuranceType)
        }
        else
        {
            pickerView.hidden = true
            datePickerView.hidden = false
            viewOfPicker = datePickerView
            self.editingBegan(txtDiagnosisDate)
        }
        
        
        let contentInsets:UIEdgeInsets  = UIEdgeInsetsMake(0.0, 0.0, viewOfPicker.frame.height, 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        var aRect: CGRect = self.view.frame
        aRect.size.height -= viewOfPicker.frame.height
        //you may not need to scroll, see if the active field is already visible
        if (!CGRectContainsPoint(aRect, activeField!.frame.origin) ) {
            let scrollPoint:CGPoint = CGPointMake(0.0, activeField!.frame.origin.y+70 - viewOfPicker.frame.height)
            scrollView.setContentOffset(scrollPoint, animated: true)
        }
    }
    
    @IBAction func doneButtonClicked (sender:UIButton)
    {
        pickerView.hidden = true;
        
        let contentInsets:UIEdgeInsets = UIEdgeInsetsZero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @IBAction func datePickerDoneButtonClicked (sender:UIButton)
    {
        datePickerView.hidden = true;
        
        let contentInsets:UIEdgeInsets = UIEdgeInsetsZero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @IBAction func datePickerAction(sender: AnyObject) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let strDate = dateFormatter.stringFromDate(datePicker.date)
        self.txtDiagnosisDate.text = strDate
        //self.profileObj.user.birth_year = strDate
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        var rows:Int = 0
        
        if(self.selectionType == globalConstants.selectionType.functionality)
        {
            rows = self.arrFunctionality.count
        }
        else if (self.selectionType == globalConstants.selectionType.education)
        {
            rows = self.arrEducationLevel.count
        }
        else if (self.selectionType == globalConstants.selectionType.insurance)
        {
            rows = self.arrInsurance.count
        }
        
        return rows
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var value:String = ""
        var obj:PickerData = PickerData()
        if(self.selectionType == globalConstants.selectionType.functionality)
        {
            obj = self.arrFunctionality[row]
            value = obj.name
        }
        else if (self.selectionType == globalConstants.selectionType.education)
        {
            obj = self.arrEducationLevel[row]
            value = obj.name
        }
        else if (self.selectionType == globalConstants.selectionType.insurance)
        {
            obj = self.arrInsurance[row]
            value = obj.name
        }
        
        
        
        return value
        
        
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        var obj:PickerData = PickerData()
        if(self.selectionType == globalConstants.selectionType.functionality)
        {
            obj = self.arrFunctionality[row]
            txtFunctionalityLevel.text = obj.name
            self.child.functionality_level = obj.code
        }
        else if (self.selectionType == globalConstants.selectionType.education)
        {
            obj = self.arrEducationLevel[row]
            txtEducationLevel.text = obj.name
            self.child.education_level = obj.code
        }
        else if (self.selectionType == globalConstants.selectionType.insurance)
        {
            obj = self.arrInsurance[row]
            txtInsuranceType.text = obj.name
            self.child.insurance_type = obj.code
        }
        
        
        
        
    }
    
    func individualService(operationName:String, alertMessage:String, moveForward: Bool)
    {
        Settings.stopLoader()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        if(moveForward == true)
        {
            
            appDelegate.refresheIndividualList = true
        }
        else
        {
            appDelegate.refresheIndividualList = false
        }
        self.showAlertWithMessage(alertMessage)
        
    }
    
    
    func showAlertWithMessage(alertMessage:String)
    {
        let alertController = UIAlertController(title:globalConstants.alertTitle.appName, message:alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title:LocalizedString("OkButton", comment:""), style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func filter(value:String, inArray:Array<PickerData>) ->String
    {
        let predicate = NSPredicate(format: "code CONTAINS[cd] %@",value);
        let tempArr:NSArray = inArray as NSArray
        
        let filteredArray = tempArr.filteredArrayUsingPredicate(predicate);
        print(filteredArray)
        
        var stringValue:String = ""
        if(filteredArray.count > 0)
        {
            let data:PickerData = filteredArray[0] as! PickerData
            stringValue = data.name
        }
        
        return stringValue
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func QueryCodeName(NameModel :Child){
    
    }
    
    func IndividualCodeName(NameModel :Ontology){
    
        
        
         self.activateTextField(false)
        
        
        
        
        if LocalizedGetLanguage() == "el"{
         
            ChosenText.text = NameModel.labelGR
             ChosenText.indID = "\(NameModel.nodeId.stringByReplacingOccurrencesOfString("Class_", withString: "["))] \(NameModel.labelGR)"// NameModel.nodeId
        }else{
           
            ChosenText.text = NameModel.labelEN
             ChosenText.indID = "\(NameModel.nodeId.stringByReplacingOccurrencesOfString("Class_", withString: "["))] \(NameModel.labelEN)"// NameModel.nodeId
        }
   // ChosenText.indID = "\(NameModel.nodeId.stringByReplacingOccurrencesOfString("Class_", withString: "["))] \(NameModel.labelEN)"// NameModel.nodeId
        
    print("NameModel.nodeId \(NameModel.nodeId)")
    print("ChosenText.indID \(ChosenText.indID)")
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
      
        if segue.identifier == "mySegueInd"{
            
            let vc = segue.destinationViewController as! BuiltQueryViewController
            
           vc.InCase = IndCase
            // vc.colorString = colorLabel.text
            vc.delegate = self
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
func QueryOntology(OntologyModel :Ontology, lblCode:Int){
    
}
}
