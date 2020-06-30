
import Foundation

struct APIEndPointConstant {
    
    static let endpoint =  "http://dummy.restapiexample.com"
    static let postEndpoint = "https://jsonplaceholder.typicode.com"
    
    //URLs
    static let baseURL = getBaseUrl()
    
    static func getBaseUrl() -> String {
        return endpoint
    }
}
