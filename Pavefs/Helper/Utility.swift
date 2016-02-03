//
//  Utility.swift
//  Pavefs
//


import UIKit

class Utility: NSObject
{
    
    static func prepareNavBarForControllerWithTitleAndBackButton (controller: UIViewController, title: String)
    {
        
        controller.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navbar"), forBarMetrics: UIBarMetrics.Default)
        
        controller.title =  LocalizedString(title, comment:"") as String
        let titleColor: NSDictionary = [NSForegroundColorAttributeName: UIColor.blackColor()]
        controller.navigationController!.navigationBar.titleTextAttributes = (titleColor as! [String : AnyObject])
        
        
        let backButton:UIButton = UIButton(type: UIButtonType.Custom)
        backButton.addTarget(controller, action: "popToPreviousController:", forControlEvents: UIControlEvents.TouchUpInside)
        backButton.setTitle( LocalizedString("back", comment:""), forState: UIControlState.Normal)
        backButton.titleLabel?.font = UIFont(name: "TrebuchetMS-bold", size:15.0)
        backButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        backButton.sizeToFit()
        let backButtonItem:UIBarButtonItem = UIBarButtonItem(customView: backButton)
        controller.navigationItem.leftBarButtonItem  = backButtonItem
    }
    
    static func prepareNavBarForControllerWithTitle (controller: UIViewController, title: String)
    {
        
        controller.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navbar"), forBarMetrics: UIBarMetrics.Default)
        
        controller.title = title as String
        let titleColor: NSDictionary = [NSForegroundColorAttributeName: UIColor.blackColor()]
        controller.navigationController!.navigationBar.titleTextAttributes = (titleColor as! [String : AnyObject])
        
        controller.navigationItem.hidesBackButton = true
        
        
    }
    
    static func backButton(controller:UIViewController) -> UIBarButtonItem
    {
        let backButton:UIButton = UIButton(type: UIButtonType.Custom)
        backButton.addTarget(controller, action: "popToPreviousController:", forControlEvents: UIControlEvents.TouchUpInside)
        backButton.setTitle( LocalizedString("back", comment:""), forState: UIControlState.Normal)
        backButton.titleLabel?.font = UIFont(name: "TrebuchetMS-bold", size:15.0)
        backButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        backButton.sizeToFit()
        let backButtonItem:UIBarButtonItem = UIBarButtonItem(customView: backButton)
        
        return backButtonItem
    }
    
    static func isValidEmail(testStr:String) -> Bool
    {
        
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    
    static func responseStringToDictionary(response:String) -> Dictionary<String, String>
    {
        var responseDic = Dictionary<String, String>()
        
        
        
        let editedString = response.stringByReplacingOccurrencesOfString("{", withString: "")
        let finalString = editedString.stringByReplacingOccurrencesOfString("}", withString: "")
        
        
        let arr = finalString.componentsSeparatedByString(",")
        if(arr.count > 1)
        {
            for var i = 0; i<arr.count; i++
            {
                
                
                let separatedValue = arr[i]
                let keyValueArr = separatedValue.componentsSeparatedByString(":")
                let key = keyValueArr[0].componentsSeparatedByString("\"")
                
                
                
                
                let value = keyValueArr[1].componentsSeparatedByString("\"")
                if(value.count > 1)
                {
                    responseDic[key[1]] = value[1]
                }
                else
                {
                    responseDic[key[1]] = value[0]
                }
                
            }
        }
        else
        {
            let separatedValue = arr[0]
            let keyValueArr = separatedValue.componentsSeparatedByString(":")
            let key = keyValueArr[0].componentsSeparatedByString("\"")
            let value = keyValueArr[1].componentsSeparatedByString("\"")
            if(value.count > 1)
            {
                responseDic[key[1]] = value[1]
            }
            else
            {
                responseDic[key[1]] = value[0]
            }
        }
        
        return responseDic
    }
    
    
    static func addSlideMenuButtonAndSetTitle(controller: UIViewController, title: String)
    {
        controller.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navbar"), forBarMetrics: UIBarMetrics.Default)
        
        controller.title =  LocalizedString(title, comment:"") as String
        let titleColor: NSDictionary = [NSForegroundColorAttributeName: UIColor.blackColor()]
        controller.navigationController!.navigationBar.titleTextAttributes = (titleColor as! [String : AnyObject])
        
        
        let btnShowMenu = UIButton(type: UIButtonType.System)
        btnShowMenu.setImage(self.defaultMenuImage(), forState: UIControlState.Normal)
        btnShowMenu.frame = CGRectMake(0, 0, 30, 30)
        //btnShowMenu.addTarget(controller, action: "onSlideMenuButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        btnShowMenu.addTarget(controller, action: "presentLeftMenuViewController", forControlEvents: UIControlEvents.TouchUpInside)
        
        let customBarItem = UIBarButtonItem(customView: btnShowMenu)
        controller.navigationItem.leftBarButtonItem = customBarItem;
    }
    
    static func defaultMenuImage() -> UIImage {
        var defaultMenuImage = UIImage()
        
        struct Static {
            static var onceToken: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.onceToken, { () -> Void in
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(30, 22), false, 0.0)
            
            UIColor.blackColor().setFill()
            UIBezierPath(rect: CGRectMake(0, 3, 30, 1)).fill()
            UIBezierPath(rect: CGRectMake(0, 10, 30, 1)).fill()
            UIBezierPath(rect: CGRectMake(0, 17, 30, 1)).fill()
            
            UIColor.whiteColor().setFill()
            UIBezierPath(rect: CGRectMake(0, 4, 30, 1)).fill()
            UIBezierPath(rect: CGRectMake(0, 11,  30, 1)).fill()
            UIBezierPath(rect: CGRectMake(0, 18, 30, 1)).fill()
            
            defaultMenuImage = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
        })
        
        return defaultMenuImage;
    }
    
    
    
    
    static func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.dataUsingEncoding(NSUTF8StringEncoding) {
            
            
            do {
                
                let dic = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! [String:AnyObject]
                //print(dic)
                return dic
            }
            catch _
            {
                print("Json parse error")
                let dic:Dictionary <String, AnyObject> = ["success":0]
                return dic
            }
            
        }
        
        return nil
    }
    
    
    static func fileData (filename:String, keyValue:String) -> Array<PickerData>
    {
        var arrData: Array<PickerData>! = []
        
        let dataFilePath:String = Settings.getFile(filename)
        
        do {
            let content = try String(contentsOfFile:dataFilePath, encoding: NSUTF8StringEncoding)
            
            if let d = content.dataUsingEncoding(NSUTF8StringEncoding)
            {
                let a = XMLParser()
                
                let jsonData:NSData!
                do
                {
                    jsonData = try a.parse(d).jsonData()
                    //print(NSString(data:jsonData, encoding: NSUTF8StringEncoding) as! String)
                    let dic:NSDictionary = Utility.responseDictionary(jsonData)
                    let responseArray = dic["pavefs"] as! NSArray
                    
                    
                    
                    
                    let dataArray = responseArray[1].valueForKey(keyValue) as! NSArray
                    
                    if arrData.count > 0
                    {
                        arrData.removeAll()
                    }
                    
                    for var index = 1; index < dataArray.count; index = index + 2
                    {
                        let data:PickerData = PickerData()
                        
                        data.name = dataArray[index].valueForKey("attributes")?.valueForKey("name") as! String
                        data.code = dataArray[index].valueForKey("attributes")?.valueForKey("code") as! String
                        
                        
                        arrData.append(data)
                    }
                    
                    
                    
                    
                }
                catch _
                {
                    
                }
            }
        } catch _  {
            
        }
        
        
        return arrData
    }
    
    
    static func responseDictionary (responseData: NSData) -> NSDictionary
    {
        var responseDic: NSDictionary = NSDictionary()
        do
        {
            
            
            responseDic = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
        }
        catch _{
            
        }
        
        return responseDic as NSDictionary
    }
    
    
}
