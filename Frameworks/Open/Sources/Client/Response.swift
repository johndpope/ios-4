import Foundation

public struct Response<T> {
    
    // MARK: - Attributes
    
    public let statusCode: HTTPStatusCode
    public let rateLimitLimit: UInt
    public let rateLimitRemaining: UInt
    public let rateLimitReset: UInt
    public let entity: T?
    public let links: [Link]
    
    // MARK: - Init
    
    init(statusCode: HTTPStatusCode,
         rateLimitLimit: UInt,
         rateLimitRemaining: UInt,
         rateLimitReset: UInt,
         entity: T? = nil,
         links: [Link] = []) {
        self.statusCode = statusCode
        self.rateLimitLimit = rateLimitLimit
        self.rateLimitRemaining = rateLimitRemaining
        self.rateLimitReset = rateLimitReset
        self.entity = entity
        self.links = links
    }
    
}
