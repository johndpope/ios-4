import Foundation

public protocol Analytics {
    func logCustomEvent(withName: String, customAttributes: [String: Any]?)
}
