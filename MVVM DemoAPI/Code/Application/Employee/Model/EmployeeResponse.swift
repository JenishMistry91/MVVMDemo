//
//  EmployeeResponse.swift
//  MVVM DemoAPI
//
//  Created by Jenish Mistry on 24/03/20.
//  Copyright © 2020 Jenish Mistry. All rights reserved.
//

import Foundation
import UIKit

// MARK: - EmployeeResponse
struct EmployeeResponse: Codable {
    let status: String?
    let data: [EmployeeResponseData]?
}

// MARK: - Datum
struct EmployeeResponseData: Codable {
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
