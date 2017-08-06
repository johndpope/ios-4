import Foundation

public protocol Dependencies {
    func makeTechLogger() -> TechLogging
    func makeAnalytics() -> Analytics
}
