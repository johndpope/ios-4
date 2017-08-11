import Foundation
import XCTest

@testable import Open

final class ClientTests: XCTestCase {
    
    func test_baseURL_isCorrect() {
        XCTAssertEqual(Client.Constants.baseURL, "https://api.github.com")
    }
    
    func test_execute_addsTheCorrectHeaders() {
        var sentRequest: URLRequest?
        let client = Client(requestDispatcher: { (request, _) -> URLSessionDataTask in
            sentRequest = request
            return URLSession.shared.dataTask(with: request)
        }, requestAdapter: { $0 })
        let resource: Resource<Data> = Resource(request: { components in
            return URLRequest(url: components.url ?? URL(string: "test://")!)
        }, parse: { $0 })
        _ = client.execute(resource: resource) { (_) in }
        XCTAssertEqual(sentRequest?.allHTTPHeaderFields?["Accept"], "application/vnd.github.v3+json")
    }
    
}
