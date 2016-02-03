//
//  ChangePasswordVC.swift
//  Pavefs
//


import UIKit

class ChangePasswordVC: UIViewController, PasswordServiceDelegate {
    
    @IBOutlet var txtEmail : NETextField!
    @IBOutlet var txtNewPassword : NETextField!
    @IBOutlet var txtConfirmPassword : NETextField!
    @IBOutlet var btnChangePassword : UIButton!

    let passwordObj:PasswordModel = PasswordModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setNavigationBarItem()
        self.title = LocalizedString("ChangePassword", comment:"")
        passwordObj.delegate = self
        self.localizeUIElements()
    }
    
   
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = false;
        
    }
    
    func localizeUIElements ()
    {
        self.txtEmail!.placeholder = LocalizedString("EmailLabel", comment:"")
        self.txtNewPassword!.placeholder = LocalizedString("NewPasswordLabel", comment:"")
        self.txtConfirmPassword!.placeholder = LocalizedString("ConfirmPasswordLabel", comment:"")
        
        self.btnChangePassword.setTitle(LocalizedString("ChangePassword", comment:""), forState: UIControlState.Normal)
    }
    
    @IBAction func changePassword (sender:UIButton)
    {
        self.view.endEditing(true)
        
        passwordObj.email = txtEmail.text
        passwordObj.newPassword = txtNewPassword.text
        passwordObj.confirmPassword = txtConfirmPassword.text
       
        
        if !passwordObj.validateEmail()
        {
            showAlertWithMessage(passwordObj.alertMessage)
        }
        else if !passwordObj.validatePassword()
        {
            showAlertWithMessage(passwordObj.alertMessage)
        }
        else
        {
            Settings.startLoader()
            passwordObj.changePassword()
        }

    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        
        
        if(textField == txtEmail)
        {
            passwordObj.email = txtEmail.text
            txtNewPassword.becomeFirstResponder()
            
        }
        else if(textField == txtNewPassword)
        {
            passwordObj.newPassword = txtNewPassword.text
            txtConfirmPassword.becomeFirstResponder()
        }
        else if(textField == txtConfirmPassword)
        {
            passwordObj.confirmPassword = txtConfirmPassword.text
            txtConfirmPassword.resignFirstResponder()
        }
        
        return true
    }
    
    func passwordService(alertMessage: String, moveForward: Bool)
    {
        Settings.stopLoader()
        self.showAlertWithMessage(alertMessage)
        
    }

    func showAlertWithMessage(alertMessage:String)
    {
        let alertController = UIAlertController(title:globalConstants.alertTitle.appName, message:alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title:LocalizedString("OkButton", comment:""), style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
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
