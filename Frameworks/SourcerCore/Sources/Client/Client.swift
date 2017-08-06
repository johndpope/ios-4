import Foundation

public class Client {

    // MARK: - Attributes
    
    private let session: URLSession
    private let requestAdapter: (URLRequest) -> URLRequest
    
    // MARK: - Init
    
    public init(session: URLSession = .shared,
                requestAdapter: @escaping (URLRequest) -> URLRequest = { $0 }) {
        self.session = session
        self.requestAdapter = requestAdapter
    }
    
    // MARK: - Public
    
    public func execute<T>(resource: Resource<T>, completion: @escaping (Response<T>) -> Void) -> URLSessionDataTask {
        let components = URLComponents(string: "https://api.github.com")!
        var request = resource.request(components)
        request.allHTTPHeaderFields = request.allHTTPHeaderFields ?? [:]
        request.allHTTPHeaderFields?["Accept"] = "application/vnd.github.v3+json"
        request = requestAdapter(request)
        let task = session.dataTask(with: request) { (data, response, error) in
//            var links: [Link] = []
//            var entity: T?
//            if let httpURLResponse = response as? HTTPURLResponse {
//                links = httpURLResponse.links
//            }
//            if let data = data {
//                
//            }
//            
        }
        task.resume()
        return task
    }

}
