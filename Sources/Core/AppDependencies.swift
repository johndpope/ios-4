import Foundation
import Open
import Crashlytics

public class AppDependencies: Dependencies {

    var sharedInstance: AppDependencies = AppDependencies()

    public func makeAnalytics() -> Analytics {
        return InstanceAnswers()
    }
    public func makeTechLogger() -> TechLogging {
        return Crashlytics.sharedInstance()
    }

}
