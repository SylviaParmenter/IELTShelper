import Foundation
import UIKit
class Utl {
    static func getViewControllerWithStoryboard(_ storyboard: String, identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        return viewController
    }
    static func getScreenSize() -> Double {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHieght = UIScreen.main.bounds.size.height
        let screenMaxLength = max(screenWidth, screenHieght)
        var deviceScreenSize : Double = 0
        if (screenMaxLength < 568.0){
            deviceScreenSize = 3.5
        }else if (screenMaxLength == 568.0){
            deviceScreenSize = 4
        }else if (screenMaxLength == 667){
            deviceScreenSize = 4.7
        }else if (screenMaxLength == 736){
            deviceScreenSize = 5.5
        }else if (screenMaxLength == 812){
            deviceScreenSize = 5.8
        }else if (screenMaxLength == 896){
            deviceScreenSize = 6.1
        }
        return deviceScreenSize
    }
    static func fontSize(size:CGFloat) -> CGFloat {
        var fontSize : CGFloat = size
        let screenSize =  getScreenSize()
        switch screenSize {
        case 3.5:
            fontSize = size - 1
        case 4:
            fontSize = size - 1
        case 4.7:
            fontSize = size
        case 5.5:
            fontSize = size
        case 5.8:
            fontSize = size
        case 6.1:
            fontSize = size
        default:
            break
        }
        return fontSize
    }
    static func getLanguage()->String {
        let defs : UserDefaults = UserDefaults.standard
        let languages : NSArray? = defs.object(forKey: "AppleLanguages") as? NSArray
        if languages != nil {
            return  languages!.object(at: 0) as! String
        }
        return ""
    }
    static func getIosVersion()->String {
        return UIDevice.current.systemVersion
    }
    static func fixNSLocalizedString(_ key:String, comment:String)->String {
        let language = self.getLanguage()
        let ver = self.getIosVersion()
        let string = NSString(string: ver)
        let version = string.doubleValue
        if version >= 9.0 &&
            language.caseInsensitiveCompare("zh-TW") != .orderedSame &&
            language.caseInsensitiveCompare("zh-HK") != .orderedSame &&
            language.hasPrefix("zh-Han") != true {
            let path = Bundle.main.path(forResource: "Base", ofType:"lproj")
            let ret : String? = Bundle(path: path!)!.localizedString(forKey: key, value:comment, table:nil)
            if ret! == key {
                return NSLocalizedString(key, comment:comment)
            }
            return ret!
        }
        else {
            return NSLocalizedString(key, comment:comment)
        }
    }
    static func fixToEnglishString(_ key:String, comment:String)->String {
        let language = "en-US"
        let ver = self.getIosVersion()
        let string = NSString(string: ver)
        let version = string.doubleValue
        if version >= 9.0 &&
            language.caseInsensitiveCompare("zh-TW") != .orderedSame &&
            language.caseInsensitiveCompare("zh-HK") != .orderedSame &&
            language.hasPrefix("zh-Han") != true {
            let path = Bundle.main.path(forResource: "Base", ofType:"lproj")
            let ret : String? = Bundle(path: path!)!.localizedString(forKey: key, value:comment, table:nil)
            if ret! == key {
                return NSLocalizedString(key, comment:comment)
            }
            return ret!
        }
        else {
            return NSLocalizedString(key, comment:comment)
        }
    }
    static func alertMessage(_ view:UIViewController, title:String, message:String,closure: @escaping ((String)->())) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let yesButton = UIAlertAction(title: Utl.fixNSLocalizedString("ok", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
            closure(title)
            alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(yesButton)
        DispatchQueue.main.async {
            view.present(alert, animated: false, completion: nil)
        }
    }
    static func alertMessage(_ view:UIViewController, title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let yesButton = UIAlertAction(title: Utl.fixNSLocalizedString("ok", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
            alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(yesButton)
        DispatchQueue.main.async {
            view.present(alert, animated: false, completion: nil)
        }
    }
    static func alertMessage(_ view:UIViewController, title:String, message:String,messageAligment:NSTextAlignment) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let yesButton = UIAlertAction(title: Utl.fixNSLocalizedString("ok", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
            alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(yesButton)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = messageAligment
        let messageText = NSMutableAttributedString(
            string: message,
            attributes: [
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
            ]
        )
        alert.setValue(messageText, forKey: "attributedMessage")
        DispatchQueue.main.async {
            view.present(alert, animated: false, completion: nil)
        }
    }
    static func alertMessage(_ view:UIViewController, title:String, message:String,fontAdjust:Bool) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let yesButton = UIAlertAction(title: Utl.fixNSLocalizedString("ok", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
            alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(yesButton)
        if fontAdjust{
            var fontSize : CGFloat = 14
            let screenSize =  Utl.getScreenSize()
            switch screenSize {
            case 3.5:
                fontSize = 12
            case 4:
                fontSize = 12
            case 4.7:
                fontSize = 14
            case 5.5:
                fontSize = 14
            default:
                break
            }
            let messageText = NSMutableAttributedString(
                string: message,
                attributes: [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)]
            )
            alert.setValue(messageText, forKey: "attributedMessage")
        }
        DispatchQueue.main.async {
            view.present(alert, animated: false, completion: nil)
        }
    }
    static func alertMessage(_ viewController:UIViewController, title:String?, message:String?,leftButtonTitle:String?,centerButtonTitle:String?,rightButtonTitle:String,messageAligment:NSTextAlignment,closure: ((String)->())?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if leftButtonTitle != nil {
            let leftButton = UIAlertAction(title: leftButtonTitle, style: .default, handler: { (action: UIAlertAction!) in
                closure?(leftButtonTitle!)
                alert.dismiss(animated: true, completion: nil)
            })
            alert.addAction(leftButton)
        }
        if centerButtonTitle != nil {
            let centerButton = UIAlertAction(title: centerButtonTitle, style: .default , handler: { (action: UIAlertAction!) in
                closure?(centerButtonTitle!)
                alert.dismiss(animated: true, completion: nil)
            })
            alert.addAction(centerButton)
        }
        let rightButton = UIAlertAction(title: rightButtonTitle, style: .default, handler: { (action: UIAlertAction!) in
            closure?(rightButtonTitle)
            alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(rightButton)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = messageAligment
        DispatchQueue.main.async {
            viewController.present(alert, animated: false, completion: nil)
        }
    }
    static func autoDismissAlert(_ viewController:UIViewController,title:String){
        let alert = UIAlertController(title: title,message: nil, preferredStyle: .alert)
        DispatchQueue.main.async {
            viewController.present(alert, animated: true, completion: nil)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            viewController.presentedViewController?.dismiss(animated: false, completion: nil)
        }
    }
    static func autoDismissAlert(_ viewController:UIViewController,title:String,message:String,closure: ((String)->())?){
        let alert = UIAlertController(title: title,message: message, preferredStyle: .alert)
        DispatchQueue.main.async {
            viewController.present(alert, animated: true, completion: nil)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            viewController.presentedViewController?.dismiss(animated: false, completion: {
                closure?("finish")
            })
        }
    }
    static func rgbHexColor(_ rgbHex:Int, alpha : Int)->UIColor {
        let r : CGFloat = CGFloat(((rgbHex >> 16) & 0x000000FF)) / 0xff
        let g : CGFloat = CGFloat(((rgbHex >> 8) & 0x000000FF)) / 0xff
        let b : CGFloat = CGFloat((rgbHex & 0x000000FF)) / 0xff
        return UIColor(red: r, green: g, blue: b, alpha: CGFloat(alpha)/0xff)
    }
    static func hexStringToUIColor (_ hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString = String(describing: [cString.utf16.index(cString.startIndex, offsetBy: 1)...])
        }
        if ((cString.utf16.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    static func setRoundView(_ view:UIView, borderWidth:Float, borderColor:UIColor?) {
        view.clipsToBounds = true
        view.layer.cornerRadius = view.bounds.size.height/2
        if borderColor != nil {
            view.layer.borderColor = borderColor!.cgColor
            view.layer.borderWidth = CGFloat(borderWidth)
            view.layer.shadowColor = UIColor.black.cgColor
        }
    }
    static func isAppNeedsUpdate() -> ( isAppNeedsUpdate : Bool? , currentAppStroeVersion : String? ) {
        var infoDictionary = Bundle.main.infoDictionary!
        if !Reachability.isConnectedToNetwork() {
            print("No Network")
            return ( nil , nil )
        }
        guard let url = URL(string: "http://itunes.apple.com/lookup?id=1401854438") ,
            let data = try? Data(contentsOf: url) else{
                print("isAppNeedsUpdate Something Error")
                return ( nil , nil )
        }
        var lookup: [String:Any]?
        do{
            lookup = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
        }catch let error {
            print("isAppNeedsUpdate error: \(error)")
        }
        guard let
            currentVersion = infoDictionary["CFBundleShortVersionString"] as? String ,
            let resultCount = lookup?["resultCount"] as? Int ,
            let appStoreVersion = (lookup?["results"] as? [[String : Any]])?[0]["version"] as? String else{
                print("isAppNeedsUpdate Something Error")
                return ( nil , nil )
        }
        if resultCount == 1 {
            if appStoreVersion.compare(currentVersion, options: NSString.CompareOptions.numeric ) == .orderedDescending {
                print("Need to update [\(appStoreVersion) != \(currentVersion)]")
                return ( true , appStoreVersion )
            }else{
                return ( false , appStoreVersion )
            }
        }
        return ( nil , nil )
    }
    static func transformQueryStringToDictionary(_ query: String) -> [String : String] {
        var dic: [String : String] = [:]
        let parameterList = query.components(separatedBy: "&")
        for parameter in parameterList {
            let keyAndValue = parameter.components(separatedBy: "=")
            dic[keyAndValue[0]] = keyAndValue[1]
        }
        return dic
    }
    static func local(_ str:String) -> String{
        return Utl.fixNSLocalizedString(str, comment: "")
    }
}
