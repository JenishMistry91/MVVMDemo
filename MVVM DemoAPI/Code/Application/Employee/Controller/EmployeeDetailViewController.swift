//
//  EmployeeDetailViewController.swift
//  MVVM DemoAPI
//
//  Created by Jenish Mistry on 25/03/20.
//  Copyright © 2020 Jenish Mistry. All rights reserved.
//

import UIKit

class EmployeeDetailViewController: BaseViewController {
    
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSalary: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    
    var modelData: EmployeeCellViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblID.text = "Employee ID is : " + (modelData?.id)!
        lblAge.text = "Employee Age is : " + (modelData?.employeeAge)!
        lblName.text = "Employee Name is : " + (modelData?.employeeName)!
        lblSalary.text = "Employee Salary is : " + (modelData?.employeeSalary)!
    }
}
