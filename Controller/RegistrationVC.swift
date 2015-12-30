//
//  RegistrationVC.swift
//  Pavefs
//


import UIKit

class RegistrationVC: UIViewController, RegistrationServiceDelegate {
    
    @IBOutlet var txtEmail : NETextField!
    @IBOutlet var txtPassword : NETextField!
    @IBOutlet var txtConfirmPassword : NETextField!
    @IBOutlet var txtCategory: NETextField!
    @IBOutlet var lblTermsOfUse : UILabel!
    @IBOutlet var btnRegister : UIButton!
    @IBOutlet var pickerView: UIView!
    @IBOutlet var categoryPicker: UIPickerView!
   
    
    let registrationObj:RegistrationModel = RegistrationModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBarHidden = false;
        Utility.prepareNavBarForControllerWithTitleAndBackButton(self, title:"registration")
        self.txtCategory.userInteractionEnabled = false
        self.localizeUIElements()
        pickerView.hidden = true
        registrationObj.delegate = self
       
    }
    
    func localizeUIElements ()
    {
        self.txtEmail!.placeholder = LocalizedString("EmailLabel", comment:"")
        self.txtPassword!.placeholder = LocalizedString("PasswordLabel", comment:"")
        self.txtConfirmPassword!.placeholder = LocalizedString("ConfirmPasswordLabel", comment:"")
        self.txtCategory!.placeholder = LocalizedString("SelectUserCategory", comment:"")
        self.lblTermsOfUse.text = LocalizedString("Terms", comment:"")
        self.btnRegister.setTitle(LocalizedString("register", comment:""), forState: UIControlState.Normal)
    }


    func popToPreviousController(sender:UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func checkBoxClicked(sender:UIButton)
    {
        if sender.currentImage == UIImage(named: "checkbox_check")
        {
            sender.setImage(UIImage(named: "checkbox_uncheck"), forState:UIControlState.Normal)
            self.registrationObj.agreedTerms = false
        }
        else
        {
            sender.setImage(UIImage(named: "checkbox_check"), forState:UIControlState.Normal)
            self.registrationObj.agreedTerms = true
        }
    }
    
    @IBAction func register(sender:UIButton)
    {
        self.view.endEditing(true)
        
        registrationObj.email = txtEmail.text
        registrationObj.password = txtPassword.text
        registrationObj.confirmPassword = txtConfirmPassword.text
        registrationObj.userCategory = txtCategory.text
        
        if !registrationObj.validateEmail()
        {
            showAlertWithMessage(registrationObj.alertMessage, withAction:false)
        }
        else if !registrationObj.validatePassword()
        {
            showAlertWithMessage(registrationObj.alertMessage, withAction:false)
        }
        else if !registrationObj.validateUserCategory()
        {
            showAlertWithMessage(registrationObj.alertMessage, withAction:false)
        }
        else if !registrationObj.userAgreedToTerms()
        {
            showAlertWithMessage(registrationObj.alertMessage, withAction:false)
        }
        else
        {
            PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
            PKHUD.sharedHUD.show()
            registrationObj.register()
        }

    }
    
    @IBAction func selectCategory(sender:UIButton)
    {
        pickerView.hidden = false
    }
    
    func showAlertWithMessage(alertMessage:String, withAction:Bool)
    {
        let alertController = UIAlertController(title:globalConstants.alertTitle.appName, message:alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        if(withAction == false)
        {
            alertController.addAction(UIAlertAction(title:LocalizedString("OkButton", comment:""), style: UIAlertActionStyle.Default, handler: nil))
        }
        else
        {
            let okAction = UIAlertAction(title:LocalizedString("OkButton", comment:""), style: UIAlertActionStyle.Default) {
                    UIAlertAction in
                    self.navigationController?.popToRootViewControllerAnimated(true)
            }
            
            alertController.addAction(okAction)
        }
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        
        
        if(textField == txtEmail)
        {
            registrationObj.email = txtEmail.text
            txtPassword.becomeFirstResponder()
            
        }
        else if(textField == txtPassword)
        {
            registrationObj.password = txtPassword.text
            txtConfirmPassword.becomeFirstResponder()
        }
        else
        {
            registrationObj.confirmPassword = txtConfirmPassword.text
            txtConfirmPassword.resignFirstResponder()
            
        }
        
        return true
    }
    
    //MARK: - Delegates and datasources
    //MARK: Data Sources
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return self.registrationObj.arrCategories.count
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        
        return self.registrationObj.arrCategories[row]
        
        
        
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int){
        
        txtCategory.text = self.registrationObj.arrCategories[row]
        self.registrationObj.userCategory = self.registrationObj.arrCategories[row]
       
        
    }
    
    @IBAction func doneButtonClicked (sender:UIButton)
    {
        pickerView.hidden = true
    }

    
    func registrationService(alertMessage:String, moveForward:Bool)
    {
        PKHUD.sharedHUD.hide()
        
        if(moveForward == true)
        {
            showAlertWithMessage(alertMessage, withAction:true)
        }
        else
        {
            showAlertWithMessage(alertMessage, withAction:false)
        }
    }

    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBarHidden = true;
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

}
