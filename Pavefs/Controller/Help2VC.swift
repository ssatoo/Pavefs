//
//  Help2VC.swift
//  Pavefs
//


import UIKit

class Help2VC: UIViewController {

     @IBOutlet var txtViewHelp : UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setNavigationBarItem()
        self.title = LocalizedString("help", comment:"")
        self.localizeUIElements()
        self.txtViewHelp.editable = false
        self.txtViewHelp.scrollEnabled = true
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
          self.localizeUIElements()
    }
    
    func popToPreviousController(sender:UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func localizeUIElements ()
    {
         self.title = LocalizedString("help", comment:"")
        self.txtViewHelp.attributedText = self.convertText(LocalizedString("HelpText", comment:"") )
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func convertText(inputText: String) -> NSAttributedString {
        
        var attrString = NSMutableAttributedString(string: inputText)
        let boldFont = UIFont(name: "Helvetica-Bold", size: 12)
        let boldBigFont = UIFont(name: "Helvetica-Bold", size: 14)
        
        attrString = fixText(attrString, attributeName: NSFontAttributeName, attributeValue: boldFont!, propsIndicator: "<b>", propsEndIndicator: "</b>")
        attrString = fixText(attrString, attributeName: NSFontAttributeName, attributeValue: boldBigFont!, propsIndicator: "<a>", propsEndIndicator: "</a>")
        attrString = fixText(attrString, attributeName: NSUnderlineStyleAttributeName, attributeValue: NSUnderlineStyle.StyleDouble.rawValue, propsIndicator: "<u>", propsEndIndicator: "</u>")
        
        return attrString
    }
    
    func fixText(inputText:NSMutableAttributedString, attributeName:AnyObject, attributeValue:AnyObject, propsIndicator:String, propsEndIndicator:String)->NSMutableAttributedString{
        var r1 = (inputText.string as NSString).rangeOfString(propsIndicator)
        while r1.location != NSNotFound {
            let r2 = (inputText.string as NSString).rangeOfString(propsEndIndicator)
            if r2.location != NSNotFound  && r2.location > r1.location {
                let r3 = NSMakeRange(r1.location + r1.length, r2.location - r1.location - r1.length)
                inputText.addAttribute(attributeName as! String, value: attributeValue, range: r3)
                inputText.replaceCharactersInRange(r2, withString: "")
                inputText.replaceCharactersInRange(r1, withString: "")
            } else {
                break
            }
            r1 = (inputText.string as NSString).rangeOfString(propsIndicator)
        }
        return inputText
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
