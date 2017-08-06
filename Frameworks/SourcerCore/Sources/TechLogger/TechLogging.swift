import Foundation

public protocol TechLogging {
    func recordError(_ error: Error, withAdditionalUserInfo: [String: Any]?)
    func setUserName(_ name: String?)
    func setUserEmail(_ email: String?)
    func setUserIdentifier(_ identifier: String?)
}
