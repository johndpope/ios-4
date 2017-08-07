import Foundation
import Crashlytics
import Open

class InstanceAnswers: Analytics {

    func logCustomEvent(withName: String, customAttributes: [String : Any]?) {
        Answers.logCustomEvent(withName: withName, customAttributes: customAttributes)
    }

}
