
import Foundation
import UIKit

struct CurrentDevice {
    static let isIphone = (UIDevice.current.model as NSString).isEqual(to: "iPhone") ? true : false
    static let isIpad = (UIDevice.current.model as NSString).isEqual(to: "iPad") ? true : false
    static let isIPod = (UIDevice.current.model as NSString).isEqual(to: "iPod touch") ? true : false
    static let isIPhoneX =  (UIScreen.main.bounds.size.height).isEqual(to: 812) ? true : false
    static let isIphoneXS =  (UIScreen.main.bounds.size.height).isEqual(to: 812) ? true : false
    static let isIphoneXSMax =  (UIScreen.main.bounds.size.height).isEqual(to: 896) ? true : false
    static let isIphoneXR =  (UIScreen.main.bounds.size.height).isEqual(to: 896) ? true : false
    static let isIphone6sPlus =  (UIScreen.main.bounds.size.height).isEqual(to: 736) ? true : false
    static let isIphone6s =  (UIScreen.main.bounds.size.height).isEqual(to: 667) ? true : false
    static let isIPhone5 =  (UIScreen.main.bounds.size.height).isEqual(to: 568) ? true : false


    static func isNotchFeaturedIPhone() -> Bool {
        if #available(iOS 11, *) {
            if UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0 > CGFloat(0) {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    func getLocalLanguage() -> String {
        var local: String! =  Locale.preferredLanguages[0]
        if local.contains("en") {
            local = "en"
        } else if local.contains("es") {
            local = "es"
        } else {
            local = "en"
        }
        return local
    }
}
