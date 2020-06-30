
import Alamofire
import Moya

class WebService: Alamofire.Session {
    static let sharedManager: WebService = {
        let configuration = URLSessionConfiguration.default
        configuration.headers = HTTPHeaders.default
        configuration.timeoutIntervalForRequest = APIConstants.apiTimeOut // as seconds, you can set your request timeout
        configuration.timeoutIntervalForResource = APIConstants.apiTimeOut // as seconds, you can set your resource timeout
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return WebService(configuration: configuration)
    }()
}
