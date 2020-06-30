//
//  AllEmployeeViewController.swift
//  MVVM DemoAPI
//
//  Created by Jenish Mistry on 24/03/20.
//  Copyright © 2020 Jenish Mistry. All rights reserved.
//

import UIKit

class AllEmployeeViewController: BaseViewController {

    // MARK: - Attributes -
    @IBOutlet weak var tblView: UITableView!
    var viewModel = EmployeeViewModel()
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.employeeList()
    }
    
    // MARK: - Helper Methods -
    func setUpView() {
        self.tblView.dataSource = self
        self.tblView.delegate = self
        self.tblView.register(UINib.init(nibName: EmplpyeeTableCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: EmplpyeeTableCell.reuseIdentifier)
    }
    func reloadTableData() {
        DispatchQueue.main.async {
            self.tblView.reloadData()
        }
    }
    // MARK: - UIButton Action Methods -
    
    // MARK: - API Calling -
    func employeeList() {
        self.showHUDProcessView()
        viewModel.getAllEmployees { (status, _, message) in
            if !status {
                self.showToast(message: message, status: .error)
            }
            self.hideHUDProcessView()
        }
        viewModel.reloadTableViewClouser = { [weak self] in
            self?.hideHUDProcessView()
            self?.reloadTableData()
        }
    }

}

// MARK: - UITableView Datat Source -
extension AllEmployeeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.noOfRowCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmplpyeeTableCell.reuseIdentifier) as? EmplpyeeTableCell
        cell?.setData(data: viewModel.employeeData![indexPath.row])
        return cell!
    }
}
// MARK: - UITableView Delegate -
extension AllEmployeeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: EmployeeDetailViewController.identifier) as? EmployeeDetailViewController
        controller?.modelData = viewModel.employeeData![indexPath.row]
        self.navigationController?.pushViewController(controller!, animated: true)
    }
}
