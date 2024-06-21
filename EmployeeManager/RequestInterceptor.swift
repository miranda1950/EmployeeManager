
import Foundation
import Alamofire

public protocol RequestInterceptor {
    
    func headers()-> [String: String]?
    func intercept(_ request: DataRequest)-> DataRequest
    func intercept<T>(_ response: DataResponse<T>)-> DataResponse<T>
    
}

public extension RequestInterceptor {
    
    func intercept<T>(_ response: DataResponse<T>)-> DataResponse<T> {
        return response
    }
    
    func headers()-> [String: String]? {
        return nil
    }
    
}
