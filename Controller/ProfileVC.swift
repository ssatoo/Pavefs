//
//  ProfileVC.swift
//  Pavefs
//


import UIKit

class ProfileVC: UIViewController, ProfileServiceDelegate,UITextFieldDelegate {

     let profileObj:ProfileModel = ProfileModel()
    
    @IBOutlet var txtName : NETextField!
    @IBOutlet var txtSurname : NETextField!
    //@IBOutlet var txtEmail : NETextField!
    //@IBOutlet var txtPassword : NETextField!
    //@IBOutlet var txtConfirmPassword : NETextField!
    @IBOutlet var txtGender : NETextField!
    @IBOutlet var txtBirthDate : NETextField!
    @IBOutlet var txtPhone : NETextField!
    @IBOutlet var txtFax : NETextField!
    @IBOutlet var txtAddress : NETextField!
    @IBOutlet var txtAreaLocation : NETextField!
    @IBOutlet var txtPostCode : NETextField!
    @IBOutlet var txtCity : NETextField!
    @IBOutlet var txtArea : NETextField!
    @IBOutlet var txtCountry : NETextField!
    @IBOutlet var txtTimeZone : NETextField!
    @IBOutlet var txtProfession : NETextField!
    @IBOutlet var txtEducationLevel : NETextField!
    @IBOutlet var txtPersonalID : NETextField!
    @IBOutlet var txtYearOfExperience : NETextField!
    
    @IBOutlet var btnUpdateProfile: UIButton!
    @IBOutlet var scrollView:UIScrollView!
    @IBOutlet var selectionPicker: UIPickerView!
    @IBOutlet var pickerView: UIView!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var datePickerView: UIView!
    
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var surname: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var bdate: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var fax: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var postcode: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var area: UILabel!
    @IBOutlet weak var personalID: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var yearofexperience: UILabel!
    @IBOutlet weak var timezone: UILabel!
    @IBOutlet weak var profession: UILabel!
    @IBOutlet weak var educationlevel: UILabel!
    
    
     var activeField: UITextField?
    
    var selectionType:String!

    
    var arrCountries:Array<PickerData> = []
    var arrGender:Array<PickerData> = []
    var arrTimeZone:Array<PickerData> = []
    var arrEducationLevel:Array<PickerData> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        self.txtName.delegate = self
        self.txtSurname.delegate = self
        self.txtGender.delegate = self
        self.txtBirthDate.delegate = self
        self.txtPhone.delegate = self
        self.txtFax.delegate = self
        self.txtAddress.delegate = self
       // self.txtAreaLocation.delegate = self
        self.txtPostCode.delegate = self
        self.txtCity.delegate = self
        self.txtArea.delegate = self
        self.txtCountry.delegate = self
        self.txtTimeZone.delegate = self
        self.txtProfession.delegate = self
        self.txtEducationLevel.delegate = self
        self.txtPersonalID.delegate = self
        self.txtYearOfExperience.delegate = self
        
        
        // Do any additional setup after loading the view.
       //Utility.addSlideMenuButtonAndSetTitle(self, title:"Profile")
        self.setNavigationBarItem()
        self.title = LocalizedString("profile", comment:"")
        profileObj.delegate = self
        self.localizeUIElements()
        self.setScrollViewToInitialPosition()
        
        self.txtGender.userInteractionEnabled = false
        self.txtBirthDate.userInteractionEnabled = false
        self.txtCountry.userInteractionEnabled = false
        self.txtTimeZone.userInteractionEnabled = false
        self.txtEducationLevel.userInteractionEnabled = false
        
        self.selectionType = "1"
        self.pickerView.hidden = true
        self.datePickerView.hidden = true
        
        self.retrieveProfile()
    }
    
    
    
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
       
        let center = NSNotificationCenter.defaultCenter()
        center.addObserver(self, selector: "keyboardOnScreen:", name: UIKeyboardDidShowNotification, object: nil)
        center.addObserver(self, selector: "keyboardOffScreen:", name: UIKeyboardDidHideNotification, object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.localizeUIElements()
        self.getFileData()
    }
    
    
    func getFileData()
    {
        self.arrGender = Utility.fileData("Gender", keyValue:"gender")
        self.arrEducationLevel = Utility.fileData("EducationLevel", keyValue:"education")
        self.arrCountries = Utility.fileData("Countries", keyValue:"countries")
        self.arrTimeZone = Utility.fileData("Timezone", keyValue:"timezone")
        
    }
    
    
    func localizeUIElements ()
    {
        
  
        
        self.title = LocalizedString("profile", comment: "")
        self.name.text = LocalizedString("name", comment: "")
        self.surname.text = LocalizedString("SurnamePlaceholder", comment: "")
        self.gender.text = LocalizedString("SexPlaceholder", comment: "")
        self.bdate.text = LocalizedString("BirthDatePlaceholder", comment: "")
        self.phone.text = LocalizedString("PhonePlaceholder", comment: "")
        self.fax.text = LocalizedString("FaxPlaceholder", comment: "")
        self.address.text = LocalizedString("AddressPlaceholder", comment: "")
        self.postcode.text = LocalizedString("PostCodePlaceholder", comment: "")
        self.city.text = LocalizedString("CityPlaceholder", comment: "")
        self.area.text = LocalizedString("AreaPlaceholder", comment: "")
        self.personalID.text = LocalizedString("PersonalIDPlaceholder", comment: "")
        self.country.text = LocalizedString("CountryPlaceholder", comment: "")
        self.yearofexperience.text = LocalizedString("YearOfExperiencePlaceholder", comment: "")
        self.timezone.text = LocalizedString("TimeZonePlaceholder", comment: "")
        self.profession.text = LocalizedString("ProfessionPlaceholder", comment: "")
        self.educationlevel.text = LocalizedString("EducationLevelPlaceholder", comment: "")
        self.btnUpdateProfile.setTitle(LocalizedString("UpdateProfile", comment: ""), forState: UIControlState.Normal)

      
        self.txtName!.placeholder = LocalizedString("NamePlaceholder", comment:"")
        self.txtSurname!.placeholder = LocalizedString("SurnamePlaceholder", comment:"")
        //self.txtEmail!.placeholder = NSLocalizedString("EmailPlaceholder", comment:"")
        //self.txtPassword!.placeholder = NSLocalizedString("PasswordPlaceholder", comment:"")

        //self.txtConfirmPassword!.placeholder = NSLocalizedString("ConfirmPasswordPlaceholder", comment:"")
        self.txtGender!.placeholder = LocalizedString("GenderPlaceholder", comment:"")
        self.txtBirthDate!.placeholder = LocalizedString("BirthDatePlaceholder", comment:"")
        self.txtPhone!.placeholder = LocalizedString("PhonePlaceholder", comment:"")
        self.txtFax!.placeholder = LocalizedString("FaxPlaceholder", comment:"")
        self.txtAddress!.placeholder = LocalizedString("AddressPlaceholder", comment:"")
       // self.txtAreaLocation!.placeholder = LocalizedString("AreaLocationPlaceholder", comment:"")
        self.txtPostCode!.placeholder = LocalizedString("PostCodePlaceholder", comment:"")
        self.txtCity!.placeholder = LocalizedString("CityPlaceholder", comment:"")
        self.txtArea!.placeholder = LocalizedString("AreaPlaceholder", comment:"")
        self.txtCountry!.placeholder = LocalizedString("CountryPlaceholder", comment:"")
        self.txtTimeZone!.placeholder = LocalizedString("TimeZonePlaceholder", comment:"")
        self.txtProfession!.placeholder = LocalizedString("ProfessionPlaceholder", comment:"")
        self.txtEducationLevel!.placeholder = LocalizedString("EducationLevelPlaceholder", comment:"")
        self.txtPersonalID!.placeholder = LocalizedString("PersonalIDPlaceholder", comment:"")
        self.txtYearOfExperience!.placeholder = LocalizedString("YearOfExperiencePlaceholder", comment:"")
        
        self.btnUpdateProfile.setTitle(LocalizedString("UpdateProfile", comment:""), forState: UIControlState.Normal)
        
        
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }

    
    
    func retrieveProfile()
    {
        Settings.startLoader()
        profileObj.retrieveUserProfile()
    }
    
    func setupUserDetail()
    {
        
        
        txtName.text = self.profileObj.user.user_name
        txtSurname.text = self.profileObj.user.user_surname
        //txtEmail.text = self.profileObj.user.user_email
        //txtPassword.text = self.profileObj.user.user_pass
        //txtConfirmPassword.text = self.profileObj.user.user_pass
        txtBirthDate.text = self.profileObj.user.birth_year
        txtPhone.text = self.profileObj.user.phone
        txtFax.text = self.profileObj.user.fax
        txtAddress.text = self.profileObj.user.address
       // txtAreaLocation.text = self.profileObj.user.address2
        txtPostCode.text = self.profileObj.user.postcode
        txtCity.text = self.profileObj.user.city
        txtArea.text = self.profileObj.user.area
        txtProfession.text = self.profileObj.user.profession
        txtEducationLevel.text = self.profileObj.user.education_level
        txtPersonalID.text = self.profileObj.user.personal_ID
        txtYearOfExperience.text = self.profileObj.user.years_of_experience
        
        if(!self.profileObj.user.sex.isEmpty || self.profileObj.user.sex != "0")
        {
            txtGender.text =  self.filter(self.profileObj.user.sex, inArray:self.arrGender)
        }
        else
        {
            txtGender.text = self.profileObj.user.sex
        }
        if(!self.profileObj.user.country.isEmpty || self.profileObj.user.country != "0")
        {
            txtCountry.text = self.filter(self.profileObj.user.country, inArray:self.arrCountries)
        }
        else
        {
            txtCountry.text = self.profileObj.user.country
        }
        if(!self.profileObj.user.timezone.isEmpty || self.profileObj.user.timezone != "0")
        {
            txtTimeZone.text = self.filter(self.profileObj.user.timezone, inArray:self.arrTimeZone)
        }
        else
        {
            txtTimeZone.text = self.profileObj.user.timezone
        }
        if(!self.profileObj.user.education_level.isEmpty || self.profileObj.user.education_level != "0")
        {
            txtEducationLevel.text = self.filter(self.profileObj.user.education_level, inArray:self.arrEducationLevel)
        }
        else
        {
            txtEducationLevel.text = self.profileObj.user.education_level
        }
        
        
        
        
    }
    
    func addToolBar (textField:UITextField)
    {
        let keyboardToolbar = UIToolbar(frame: CGRectMake(0,0,320,50))
        keyboardToolbar.barStyle = UIBarStyle.Default
        
        keyboardToolbar.items = [
            UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "keyboardCancelButtonTapped:"),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil),
        ]
        
        keyboardToolbar.sizeToFit()
        keyboardToolbar.barTintColor = UIColor.orangeColor()
        textField.inputAccessoryView = keyboardToolbar
        
    }
    func keyboardCancelButtonTapped (sender:UIBarButtonItem)
    {
        self.view.endEditing(true)
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
    
    func profileService(operationName:String, alertMessage:String, moveForward:Bool)
    {
        Settings.stopLoader()
        
        if(operationName == apiMethod.RETRIEVE_PROFILE_API)
        {
            if(moveForward == true)
            {
               self.setupUserDetail()
                
            }
            else
            {
                self.showAlertWithMessage(alertMessage)
            }
        }
        else if(operationName == apiMethod.UPDATE_PROFILE_API)
        {
            self.showAlertWithMessage(alertMessage)
        }
    }
    
    func showAlertWithMessage(alertMessage:String)
    {
        let alertController = UIAlertController(title:globalConstants.alertTitle.appName, message:alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title:LocalizedString("OkButton", comment:""), style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    
    
    @IBAction func updateProfile (sender:UIButton)
    {
        self.view.endEditing(true)
        
        self.profileObj.user.user_name = txtName.text
        self.profileObj.user.user_surname = txtSurname.text
        //self.profileObj.user.user_email = txtEmail.text
        //self.profileObj.user.user_pass = txtPassword.text
        //self.profileObj.user.confirm_password = txtConfirmPassword.text
        //self.profileObj.user.sex = txtGender.text
        self.profileObj.user.birth_year = txtBirthDate.text
        self.profileObj.user.phone = txtPhone.text
        self.profileObj.user.fax = txtFax.text
        self.profileObj.user.address = txtAddress.text
        //self.profileObj.user.address2 = txtAreaLocation.text
        self.profileObj.user.postcode = txtPostCode.text
        self.profileObj.user.city = txtCity.text
        self.profileObj.user.area = txtArea.text
        //self.profileObj.user.country = txtCountry.text
        //self.profileObj.user.timezone = txtTimeZone.text
        self.profileObj.user.profession = txtProfession.text
        //self.profileObj.user.education_level = txtEducationLevel.text
        self.profileObj.user.personal_ID = txtPersonalID.text
        self.profileObj.user.years_of_experience = txtYearOfExperience.text
        
        
        
        if !profileObj.validateName()
        {
            showAlertWithMessage(profileObj.alertMessage)
        }
        else if !profileObj.validateSurname()
        {
            showAlertWithMessage(profileObj.alertMessage)
        }
        /*else if !profileObj.validateEmail()
        {
            showAlertWithMessage(profileObj.alertMessage)
        }
        else if !profileObj.validatePassword()
        {
            showAlertWithMessage(profileObj.alertMessage)
        }*/
        else if !profileObj.validateGender()
        {
            showAlertWithMessage(profileObj.alertMessage)
        }
        else if !profileObj.validateBirthdate()
        {
            showAlertWithMessage(profileObj.alertMessage)
        }
        else if !profileObj.validatePhone()
        {
            showAlertWithMessage(profileObj.alertMessage)
        }
        else if !profileObj.validateFax()
        {
            showAlertWithMessage(profileObj.alertMessage)
        }
        else if !profileObj.validateAddress()
        {
            showAlertWithMessage(profileObj.alertMessage)
        }
//        else if !profileObj.validateAreaLocation()
//        {
//            showAlertWithMessage(profileObj.alertMessage)
//        }
        else if !profileObj.validatePostcode()
        {
            showAlertWithMessage(profileObj.alertMessage)
        }
        else if !profileObj.validateCity()
        {
            showAlertWithMessage(profileObj.alertMessage)
        }
        else if !profileObj.validateArea()
        {
            showAlertWithMessage(profileObj.alertMessage)
        }
        else if !profileObj.validateCountry()
        {
            showAlertWithMessage(profileObj.alertMessage)
        }
        else if !profileObj.validateTimezone()
        {
            showAlertWithMessage(profileObj.alertMessage)
        }
        else if !profileObj.validateProfession()
        {
            showAlertWithMessage(profileObj.alertMessage)
        }
        else if !profileObj.validateEducationLevel()
        {
            showAlertWithMessage(profileObj.alertMessage)
        }
        else if !profileObj.validatePersonalID()
        {
            showAlertWithMessage(profileObj.alertMessage)
        }
        else if !profileObj.validateYearsOfExperience()
        {
            showAlertWithMessage(profileObj.alertMessage)
        }
        else
        {
            Settings.startLoader()
           
            profileObj.updateUserProfile()
            
        }

    }
    
    @IBAction func dropDownButtonClicked (sender:UIButton)
    {
         var viewOfPicker:UIView
        
        if(sender.tag == globalConstants.openPicker.gender)
        {
            self.selectionType = "1"
            self.selectionPicker.reloadAllComponents()
            pickerView.hidden = false
            viewOfPicker = pickerView
            self.editingBegan(txtGender)
        }
        else if(sender.tag == globalConstants.openPicker.country)
        {
            self.selectionType = "2"
            self.selectionPicker.reloadAllComponents()
            pickerView.hidden = false
            viewOfPicker = pickerView
            self.editingBegan(txtCountry)
        }
        else if(sender.tag == globalConstants.openPicker.timezone)
        {
            self.selectionType = "3"
            self.selectionPicker.reloadAllComponents()
            pickerView.hidden = false
            viewOfPicker = pickerView
            self.editingBegan(txtTimeZone)
        }
        else if(sender.tag == globalConstants.openPicker.education)
        {
            self.selectionType = "4"
            self.selectionPicker.reloadAllComponents()
            pickerView.hidden = false
            viewOfPicker = pickerView
            self.editingBegan(txtEducationLevel)
        }
        else
        {
            pickerView.hidden = true
            datePickerView.hidden = false
            viewOfPicker = pickerView
            self.editingBegan(txtBirthDate)
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
        self.txtBirthDate.text = strDate
        self.profileObj.user.birth_year = strDate
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        var rows:Int = 0
        
        if(self.selectionType == globalConstants.selectionType.gender)
        {
            rows = self.arrGender.count
        }
        else if (self.selectionType == globalConstants.selectionType.country)
        {
            rows = self.arrCountries.count
        }
        else if (self.selectionType == globalConstants.selectionType.timezone)
        {
            rows = self.arrTimeZone.count
        }
        else if (self.selectionType == globalConstants.selectionType.education)
        {
            rows = self.arrEducationLevel.count
        }
        
        return rows
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var value:String = ""
        var obj:PickerData = PickerData()
        if(self.selectionType == globalConstants.selectionType.gender)
        {
            obj = self.arrGender[row]
            value = obj.name
        }
        else if (self.selectionType == globalConstants.selectionType.country)
        {
            obj = self.arrCountries[row]
            value = obj.name
        }
        else if (self.selectionType == globalConstants.selectionType.timezone)
        {
            obj = self.arrTimeZone[row]
            value = obj.name
        }
        else if (self.selectionType == globalConstants.selectionType.education)
        {
            obj = self.arrEducationLevel[row]
            value = obj.name
        }
        
        
        
        return value
        
        
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        var obj:PickerData = PickerData()
        if(self.selectionType == globalConstants.selectionType.gender)
        {
            obj = self.arrGender[row]
           txtGender.text = obj.name
            self.profileObj.user.sex = obj.code
        }
        else if (self.selectionType == globalConstants.selectionType.country)
        {
            obj = self.arrCountries[row]
            txtCountry.text = obj.name
            self.profileObj.user.country = obj.code
        }
        else if (self.selectionType == globalConstants.selectionType.timezone)
        {
            obj = self.arrTimeZone[row]
            txtTimeZone.text = obj.name
            self.profileObj.user.timezone = obj.code
        }
        else if (self.selectionType == globalConstants.selectionType.education)
        {
            obj = self.arrEducationLevel[row]
            txtEducationLevel.text = obj.name
            self.profileObj.user.education_level = obj.code
        }
        
        
        
        
    }
    
    func editingBegan(sender: UITextField) {
        activeField = sender
    }
    
    
    func keyboardOnScreen(notification: NSNotification)
    {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            //let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
            //print("Width :- %@",  keyboardSize.width)
            //print("Height :- %@",  keyboardSize.height)
            
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
    
    func keyboardOffScreen(notification: NSNotification)
    {
        let contentInsets:UIEdgeInsets = UIEdgeInsetsZero
        scrollView.contentInset = contentInsets
       scrollView.scrollIndicatorInsets = contentInsets
    }
    
    func setScrollViewToInitialPosition ()
    {
        let contentInsets:UIEdgeInsets  = UIEdgeInsetsMake(0.0, 0.0, 20, 0.0)
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
        
        
        if(textField == txtName)
        {
            self.profileObj.user.user_name = txtName.text
            txtSurname.becomeFirstResponder()
        }
        else if(textField == txtSurname)
        {
            self.profileObj.user.user_surname = txtSurname.text
            txtPhone.becomeFirstResponder()
        }
        /*else if(textField == txtEmail)
        {
            self.profileObj.user.user_email = txtEmail.text
            txtPassword.becomeFirstResponder()
        }
        else if(textField == txtPassword)
        {
            self.profileObj.user.user_pass = txtPassword.text
            txtConfirmPassword.becomeFirstResponder()
        }
        else if(textField == txtConfirmPassword)
        {
            self.profileObj.user.confirm_password = txtConfirmPassword.text
            txtPhone.becomeFirstResponder()
        }*/
        else if(textField == txtPhone)
        {
           
            self.profileObj.user.phone = txtPhone.text
            txtFax.becomeFirstResponder()
        }
        else if(textField == txtFax)
        {
           
            self.profileObj.user.fax = txtFax.text
            txtAddress.becomeFirstResponder()
        }
        else if(textField == txtAddress)
        {
            self.profileObj.user.address = txtAddress.text
            txtPostCode.becomeFirstResponder()
        }
//        else if(textField == txtAreaLocation)
//        {
//            self.profileObj.user.address2 = txtAreaLocation.text
//            txtPostCode.becomeFirstResponder()
//        }
        else if(textField == txtPostCode)
        {
            self.profileObj.user.postcode = txtPostCode.text
            txtCity.becomeFirstResponder()
        }
        else if(textField == txtCity)
        {
            self.profileObj.user.city = txtCity.text
            txtArea.becomeFirstResponder()
        }
        else if(textField == txtArea)
        {
            self.profileObj.user.area = txtArea.text
            txtProfession.becomeFirstResponder()
        }
        else if(textField == txtProfession)
        {

            self.profileObj.user.profession = txtProfession.text
            txtPersonalID.becomeFirstResponder()
        }
        else if(textField == txtPersonalID)
        {
         
            self.profileObj.user.personal_ID = txtPersonalID.text
            txtYearOfExperience.becomeFirstResponder()
        }
        else if(textField == txtYearOfExperience)
        {
            self.profileObj.user.years_of_experience = txtYearOfExperience.text
            txtYearOfExperience.resignFirstResponder()
        }
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    func localizedFields(){
    
         self.name.text = LocalizedString("name", comment: "")
         self.surname.text = LocalizedString("SurnamePlaceholder", comment: "")
         self.gender.text = LocalizedString("SexPlaceholder", comment: "")
         self.bdate.text = LocalizedString("BirthDatePlaceholder", comment: "")
         self.phone.text = LocalizedString("PhonePlaceholder", comment: "")
         self.fax.text = LocalizedString("FaxPlaceholder", comment: "")
         self.address.text = LocalizedString("AddressPlaceholder", comment: "")
         self.postcode.text = LocalizedString("PostCodePlaceholder", comment: "")
         self.city.text = LocalizedString("CityPlaceholder", comment: "")
         self.area.text = LocalizedString("AreaPlaceholder", comment: "")
         self.personalID.text = LocalizedString("PersonalIDPlaceholder", comment: "")
         self.country.text = LocalizedString("CountryPlaceholder", comment: "")
         self.yearofexperience.text = LocalizedString("YearOfExperiencePlaceholder", comment: "")
         self.timezone.text = LocalizedString("TimeZonePlaceholder", comment: "")
         self.profession.text = LocalizedString("ProfessionPlaceholder", comment: "")
         self.educationlevel.text = LocalizedString("EducationLevelPlaceholder", comment: "")
         self.btnUpdateProfile.setTitle(LocalizedString("UpdateProfile", comment: ""), forState: UIControlState.Normal)
        
        
    
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
