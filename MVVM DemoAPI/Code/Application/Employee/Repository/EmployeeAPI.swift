//
//  EmployeeAPI.swift
//  MVVM DemoAPI
//
//  Created by Jenish Mistry on 24/03/20.
//  Copyright © 2020 Jenish Mistry. All rights reserved.
//

import Foundation
import Moya

internal enum EmployeeAPI {
    case getAllEmployees
    case getAllPosts
}

extension EmployeeAPI: TargetType {
    public var baseURL: URL {
        switch self {
        case .getAllEmployees:
            return URL(string: APIEndPointConstant.baseURL)!
        default:
            return URL(string: APIEndPointConstant.postEndpoint)!
        }
        
    }
    public var path: String {
        switch self {
        case .getAllEmployees:
            return "/api/v1/employees"
        case .getAllPosts:
            return "/posts"
        }
    }
    public var method: Moya.Method {
        switch self {
        case .getAllEmployees: return .get
        case .getAllPosts: return .get
            
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getAllEmployees:
            return .requestPlain
        case .getAllPosts:
            return .requestPlain
        }
    }
    
    public var headers: [String: String]? {
        switch self {
        case .getAllEmployees:
            return nil
        case .getAllPosts:
            return nil
        }
    }
    // 7
    public var validationType: ValidationType {
        return .customCodes([200, 201, 400, 403, 404, 500])
    }
    
    public var parameterEncoding: ParameterEncoding {
        switch self {
        case .getAllEmployees:
            return URLEncoding.default
        case .getAllPosts:
            return URLEncoding.default
        }
    }
}
