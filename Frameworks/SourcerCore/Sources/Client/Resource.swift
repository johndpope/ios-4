import Foundation

public struct Resource<T> {

    // MARK: - Attributes

    let request: (URLComponents) -> URLRequest
    let parse: (Data) throws -> T

    // MARK: - Init

    public init(request: @escaping (URLComponents) -> URLRequest,
                parse: @escaping (Data) throws -> T) {
        self.request = request
        self.parse = parse
    }

}
