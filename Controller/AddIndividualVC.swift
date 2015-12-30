//
//  AddIndividualVC.swift
//  Pavefs
//


import UIKit

class AddIndividualVC: UIViewController, IndividualServiceDelegate, NameForQueryDelegate  {

    var child:Child = Child()
    let individualObj:IndividualModel = IndividualModel()
    
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

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        //self.setNavigationBarItem()
        self.title = LocalizedString("AddIndividual", comment:"")
        self.navigationItem.leftBarButtonItem = Utility.backButton(self)
        
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

        //347
        self.txtDiagnosis1.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.txtDiagnosis2.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.txtDiagnosis3.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.txtDiagnosis4.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.txtDiagnosis5.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        
        self.txtDiagnosis1.tag = 97
        self.txtDiagnosis2.tag = 97
        self.txtDiagnosis3.tag = 97
        self.txtDiagnosis4.tag = 97
        self.txtDiagnosis5.tag = 97

        
        self.txtRiskFactor1.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.txtRiskFactor2.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.txtRiskFactor3.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.txtRiskFactor4.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.txtRiskFactor5.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        
        self.txtRiskFactor1.tag = 93
        self.txtRiskFactor2.tag = 93
        self.txtRiskFactor3.tag = 93
        self.txtRiskFactor4.tag = 93
        self.txtRiskFactor5.tag = 93
        
       self.txtSex.addTarget(self, action: "myTargetFunction:", forControlEvents: UIControlEvents.TouchDown)
        self.txtSex.tag = 374
        
    }
    func myTargetFunction(textField: NETextField) {
        // user touch field
        print("whathappentxt touched")
        ChosenText = textField
        IndCase = "Class_\(textField.tag)"
        
        
        self.performSegueWithIdentifier("MysequeAdd", sender: self)
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.getFileData()
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
        
        self.btnSubmit.setTitle(LocalizedString("Submit", comment:""), forState: UIControlState.Normal)
        
    }
    
    func editingBegan(sender: UITextField) {
        activeField = sender
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
        self.editingBegan(textField)
        self.addToolBar(textField)
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
        else if(textField == txtSex)
        {
            self.child.sex = txtSex.text
            txtDiagnosis1.becomeFirstResponder()
            
        }
        else if(textField == txtDiagnosis1)
        {
            self.child.d1 = txtDiagnosis1.text
            txtDiagnosis2.becomeFirstResponder()
            
        }
        else if(textField == txtDiagnosis2)
        {
            self.child.d2 = txtDiagnosis2.text
            txtDiagnosis3.becomeFirstResponder()
            
        }
        else if(textField == txtDiagnosis3)
        {
            self.child.d3 = txtDiagnosis3.text
            txtDiagnosis4.becomeFirstResponder()
            
        }
        else if(textField == txtDiagnosis4)
        {
            self.child.d4 = txtDiagnosis4.text
            txtDiagnosis5.becomeFirstResponder()
            
        }
        else if(textField == txtDiagnosis5)
        {
            self.child.d5 = txtDiagnosis5.text
            txtRiskFactor1.becomeFirstResponder()
            
        }
        else if(textField == txtRiskFactor1)
        {
            self.child.rh1 = txtRiskFactor1.text
            txtRiskFactor2.becomeFirstResponder()
            
        }
        else if(textField == txtRiskFactor2)
        {
            self.child.rh2 = txtRiskFactor2.text
            txtRiskFactor3.becomeFirstResponder()
            
        }
        else if(textField == txtRiskFactor3)
        {
            self.child.rh3 = txtRiskFactor3.text
            txtRiskFactor4.becomeFirstResponder()
        }
        else if(textField == txtRiskFactor4)
        {
            self.child.rh4 = txtRiskFactor4.text
            txtRiskFactor5.becomeFirstResponder()
        }
        else if(textField == txtRiskFactor5)
        {
            self.child.rh5 = txtRiskFactor5.text
            txtRiskFactor5.resignFirstResponder()
        }
        
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
         self.child.child_code = txtChildCode.text
         self.child.birth_month = txtBirthMonth.text
         self.child.birth_year = txtBirthYear.text
        // self.child.sex = txtSex.text
         self.child.diagnosis_date = txtDiagnosisDate.text
        
         self.child.sex = txtSex.indID
        
        if (txtDiagnosis1.indID != nil) {
            self.child.d1 = txtDiagnosis1.indID
        }else {
        
            self.child.d1 = "[-1]"
        }
        
        if (txtDiagnosis2.indID != nil) {
            self.child.d2 = txtDiagnosis2.indID
        }else {
            
            self.child.d2 = "[-1]"
        }
        
        if (txtDiagnosis3.indID != nil) {
            self.child.d3 = txtDiagnosis3.indID
        }else {
            
            self.child.d3 = "[-1]"
        }
        
        if (txtDiagnosis4.indID != nil) {
            self.child.d4 = txtDiagnosis4.indID
        }else {
            
            self.child.d4 = "[-1]"
        }
        
        if (txtDiagnosis5.indID != nil) {
            self.child.d5 = txtDiagnosis5.indID
        }else {
            
            self.child.d5 = "[-1]"
        }
        
        if (txtRiskFactor1.indID != nil) {
            self.child.rh1 = txtRiskFactor1.indID
        }else {
            
            self.child.rh1 = "[-1]"
        }
            
        if (txtRiskFactor2.indID != nil) {
            self.child.rh2 = txtRiskFactor2.indID
        }else {
            
            self.child.rh2 = "[-1]"
        }
                
                
        if (txtRiskFactor3.indID != nil) {
            self.child.rh3 = txtRiskFactor3.indID
        }else {
            
            self.child.rh3 = "[-1]"
        }
        
        if (txtRiskFactor4.indID != nil) {
            self.child.rh4 = txtRiskFactor4.indID
        }else {
            
            self.child.rh4 = "[-1]"
        }
        
        if (txtRiskFactor5.indID != nil) {
            self.child.rh5 = txtRiskFactor5.indID
        }else {
            
            self.child.rh5 = "[-1]"
        }
        
        
        
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
            individualObj.editingChild = false
            individualObj.selectedChild = self.child
            individualObj.addIndividual()
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
            //[datePicker setDate:[NSDate dateWithTimeIntervalSince1970:NSTimeIntervalSince1970]];
            //[datePicker setDate:[NSDate date]];
            self.datePicker.setDate(NSDate(timeIntervalSince1970:NSTimeIntervalSince1970), animated:true)
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
        self.child.diagnosis_date = strDate
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    func QueryCodeName(NameModel :Child){
    }
    func QueryOntology(OntologyModel :Ontology, lblCode:Int){
    }
    func IndividualCodeName(NameModel :Ontology){
        
        if LocalizedGetLanguage() == "el"{
            
            ChosenText.text = NameModel.labelGR
            ChosenText.indID = "\(NameModel.nodeId.stringByReplacingOccurrencesOfString("Class_", withString: "["))] \(NameModel.labelGR)"
        }else{
            
            ChosenText.text = NameModel.labelEN
            ChosenText.indID = "\(NameModel.nodeId.stringByReplacingOccurrencesOfString("Class_", withString: "["))] \(NameModel.labelEN)"
        }

    //ChosenText.indID = NameModel.nodeId
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if segue.identifier == "MysequeAdd"{
            
            let vc = segue.destinationViewController as! BuiltQueryViewController
            
            vc.InCase = IndCase
            // vc.colorString = colorLabel.text
            vc.delegate = self
        }
    }
    
    
}
