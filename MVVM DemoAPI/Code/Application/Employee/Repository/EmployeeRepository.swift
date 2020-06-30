//
//  EmployeeRepository.swift
//  MVVM DemoAPI
//
//  Created by Jenish Mistry on 24/03/20.
//  Copyright © 2020 Jenish Mistry. All rights reserved.
//

import Foundation
import Moya

class EmployeeRepository {
    
    private let employeeProvider = RefreshbleMoyaProvider<EmployeeAPI>(session: WebService.sharedManager, plugins: [Plugins.activity, NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))])
    
    func getAllEmployee(completion: @escaping (Bool, EmployeeResponse?, String) -> Void) {
        employeeProvider.request(.getAllEmployees) { (result) in
            switch result {
            case .success(let response):
                do {
                    _ = try response.filterSuccessfulStatusCodes()
                    let getResponse = try response.map(EmployeeResponse.self)
                    if getResponse.data != nil {
                        completion(true, getResponse, "")
                    } else {
                        completion(false, nil, " ")
                    }
                } catch {
                    if let error = error as? MoyaError {
                        do {
                            _ = try error.response?.mapJSON()
                            let _ = try error.response?.map(EmployeeResponse.self)
                            completion(false, nil, "Error")
                        } catch {
                            completion(false, nil, "Error")
                        }
                    }
                }
            case .failure:
                print("Failure")
            }
        }
    }

}
