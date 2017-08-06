import Foundation
import SourcerCore
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
