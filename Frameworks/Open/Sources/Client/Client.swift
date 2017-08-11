import Foundation

public class Client {
    
    struct Constants {
        static var baseURL: String = "https://api.github.com"
    }
    
    // MARK: - Attributes
    
    private let requestAdapter: (URLRequest) -> URLRequest
    private let requestDispatcher: (URLRequest, @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
    
    // MARK: - Init
    
    public init(session: URLSession = .shared,
                requestAdapter: @escaping (URLRequest) -> URLRequest = { $0 }) {
        self.requestAdapter = requestAdapter
        self.requestDispatcher = { (request, completionHandler) in
            session.dataTask(with: request, completionHandler: completionHandler)
        }
    }
    
    public init( requestDispatcher: @escaping (URLRequest, (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask,
                 requestAdapter: @escaping (URLRequest) -> URLRequest = { $0 }) {
        self.requestAdapter = requestAdapter
        self.requestDispatcher = requestDispatcher
    }
    
    // MARK: - Public
    
    public func execute<T>(resource: Resource<T>, completion: @escaping (Response<T>) -> Void) -> URLSessionDataTask {
        let components = URLComponents(string: Constants.baseURL)!
        var request = resource.request(components)
        request.allHTTPHeaderFields = request.allHTTPHeaderFields ?? [:]
        request.allHTTPHeaderFields?["Accept"] = "application/vnd.github.v3+json"
        request = requestAdapter(request)
        let task = requestDispatcher(request) { (_, _, _) in
            
        }
        //        let task = session.dataTask(with: request) { (data, response, error) in
        ////            var links: [Link] = []
        ////            var entity: T?
        ////            if let httpURLResponse = response as? HTTPURLResponse {
        ////                links = httpURLResponse.links
        ////            }
        ////            if let data = data {
        ////
        ////            }
        ////
        //        }
        task.resume()
        return task
    }
    
}
