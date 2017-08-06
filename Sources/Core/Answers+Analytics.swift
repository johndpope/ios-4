import Foundation
import Crashlytics
import SourcerCore

class InstanceAnswers: Analytics {
    
    func logCustomEvent(withName: String, customAttributes: [String : Any]?) {
        Answers.logCustomEvent(withName: withName, customAttributes: customAttributes)
    }
    
}
