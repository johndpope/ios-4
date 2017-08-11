import Cocoa
import Fabric
import Crashlytics

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        Fabric.with([Crashlytics.self, Answers.self])
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}
