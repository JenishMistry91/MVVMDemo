//
//  EmplpyeeTableCell.swift
//  MVVM DemoAPI
//
//  Created by Jenish Mistry on 24/03/20.
//  Copyright © 2020 Jenish Mistry. All rights reserved.
//

import UIKit

class EmplpyeeTableCell: UITableViewCell {

    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSalary: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: EmployeeCellViewModel) {
        self.lblAge.text = data.employeeAge
        self.lblName.text = data.employeeName
        self.lblSalary.text = data.employeeSalary
    }
    
}
