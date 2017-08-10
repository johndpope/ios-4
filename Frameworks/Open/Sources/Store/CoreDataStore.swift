import Foundation
import CoreData

public class CoreDataStore {
    
    // MARK: - Attributes
    
    private let container: NSPersistentContainer
    
    // MARK: - Init
    
    public init() {
        let modelURL = Bundle(for: CoreDataStore.self).url(forResource: "Sourcer", withExtension: "momd")!
        let model = NSManagedObjectModel(contentsOf: modelURL)
        self.container = NSPersistentContainer(name: "sourcer", managedObjectModel: model)
    }
    
    // MARK: - Internal
    
    func makeBackgroundContext() -> NSManagedObjectContext {
        return self.container.newBackgroundContext()
    }
    
}
