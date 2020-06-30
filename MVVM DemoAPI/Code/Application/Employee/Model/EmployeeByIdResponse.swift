//
//  EmployeeByIdResponse.swift
//  MVVM DemoAPI
//
//  Created by Jenish Mistry on 25/03/20.
//  Copyright © 2020 Jenish Mistry. All rights reserved.
//

import Foundation

// MARK: - EmployeeByIDResponse
struct EmployeeByIDResponse: Codable {
    let status: String?
    let data: EmployeeByIDResponseData?
}

// MARK: - DataClass
struct EmployeeByIDResponseData: Codable {
    let id, employeeName, employeeSalary, employeeAge: String?
    let profileImage: String?

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
