//
//  EmployeeViewModel.swift
//  MVVM DemoAPI
//
//  Created by Jenish Mistry on 24/03/20.
//  Copyright © 2020 Jenish Mistry. All rights reserved.
//

import Foundation

class EmployeeViewModel {
    
    private var employeeRepo = EmployeeRepository()
    var employeeData: [EmployeeCellViewModel]? {
        didSet {
            self.reloadTableViewClouser?()
        }
    }
    var reloadTableViewClouser: (()->Void)?
    var noOfRowCount: Int {
        self.employeeData?.count ?? 0
    }
    
    func getAllEmployees(completion: @escaping(Bool, EmployeeResponse?, String) -> Void) {
        if !Reachability.isConnectedToNetwork() {
            completion(false, nil, "No Internet Connection")
            return
        }
        employeeRepo.getAllEmployee { (status, response, message) in
            if status {
                self.employeeData = (response?.data?.map { EmployeeCellViewModel.init(data: $0)})!
                completion(true, response, message)
            } else {
                completion(false, response, message)
            }
        }
    }
}

class EmployeeCellViewModel {
    let id, employeeName, employeeSalary, employeeAge: String?
    let profileImage: String?
    
    init(data: EmployeeResponseData) {
        id = data.id
        employeeName = data.employeeName
        employeeSalary = data.employeeSalary
        employeeAge = data.employeeAge
        profileImage = data.profileImage
    }
}

class EmployeeIDViewModel {
    let id, employeeName, employeeSalary, employeeAge: String?
    let profileImage: String?
    
    init(data: EmployeeByIDResponseData) {
        id = data.id
        employeeName = data.employeeName
        employeeSalary = data.employeeSalary
        employeeAge = data.employeeAge
        profileImage = data.profileImage
    }
}
