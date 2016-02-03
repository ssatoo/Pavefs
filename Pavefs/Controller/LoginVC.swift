//
//  LoginVC.swift
//  Pavefs
//


import UIKit

class LoginVC: UIViewController, LoginServiceDelegate {

    @IBOutlet var txtUsername : NETextField!
    @IBOutlet var txtPassword : NETextField!
    
    let loginObj:LoginModel = LoginModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         self.navigationController?.navigationBarHidden = true;
        loginObj.delegate = self
        
        self.localizeUIElements()
        
        if(Settings.userLoggedIn() == true)
        {
            self.pushMenu()
        }
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        print(self.navigationController?.viewControllers)
    }
    
    func localizeUIElements ()
    {
        self.txtUsername!.placeholder = LocalizedString("UsernameLabel", comment:"")
        self.txtPassword!.placeholder = LocalizedString("PasswordLabel", comment:"")
    }
    
    
    @IBAction func login(sender:UIButton)
    {
        self.view.endEditing(true)
        
        loginObj.username = txtUsername.text
        loginObj.password = txtPassword.text
        
        if !loginObj.validateUsername()
        {
            showAlertWithMessage(loginObj.alertMessage)
        }
        else if !loginObj.validatePassword()
        {
            showAlertWithMessage(loginObj.alertMessage)
        }
        else
        {
           Settings.startLoader()
            loginObj.login()
        }
    }

    func showAlertWithMessage(alertMessage:String)
    {
        let alertController = UIAlertController(title:globalConstants.alertTitle.appName, message:alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title:LocalizedString("OkButton", comment:""), style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        
        
        if(textField == txtUsername)
        {
            loginObj.username = txtUsername.text
            txtPassword.becomeFirstResponder()
            
        }
        else
        {
            loginObj.password = txtPassword.text
            txtPassword.resignFirstResponder()
        }
        
        return true
    }
    
    func loginService(alertMessage:String, moveForward:Bool)
    {
        Settings.stopLoader()
        
        if(moveForward == true)
        {
            self.pushMenu()
            
        }
        else
        {
            self.showAlertWithMessage(alertMessage)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "SliderMenuViewSID"
        {

           
            

        }
    }
    
    func pushMenu()
    {
        print("pushing")
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let IndividualViewController = storyboard.instantiateViewControllerWithIdentifier("RetrieveIndividualViewSID") as! RetrieveIndividualVC
        let leftViewController = storyboard.instantiateViewControllerWithIdentifier("LeftMenuViewSID") as! LeftMenuVC
        //let rightViewController:UIViewController! = storyboard.instantiateViewControllerWithIdentifier("RightMenuViewSID") as! RightMenuVC
        
        
        let nvc: UINavigationController = UINavigationController (rootViewController: IndividualViewController)
        
        
        leftViewController.RetrieveIndividualVC = nvc
       
        
        let slideMenuController = SlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController)
        

        
        self.navigationController?.pushViewController(slideMenuController, animated:false)
        
    }
}
