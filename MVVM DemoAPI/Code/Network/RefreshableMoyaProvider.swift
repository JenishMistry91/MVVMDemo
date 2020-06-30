

import Foundation
import Moya

struct Plugins {
    static let activity = NetworkActivityPlugin { change, _ in
        switch change {
        case .began : break
        case .ended : break
        }
    }
}

class RefreshbleMoyaProvider<T: TargetType>: MoyaProvider<T> {

    @discardableResult
    open override func request(_ target: T,
                               callbackQueue: DispatchQueue? = .none,
                               progress: ProgressBlock? = .none,
                               completion: @escaping Completion) -> Cancellable {

        return super.request(target, callbackQueue: callbackQueue, progress: progress, completion: { result in
            switch result {
            case .success:
                completion(result)
            case let .failure(error):
                let response = error.response
                let statusCode: Int? = response?.statusCode

                if statusCode == nil {
                    completion(result)
                }
            }
        })
    }
}
