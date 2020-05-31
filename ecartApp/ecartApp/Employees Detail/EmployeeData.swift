//
//  Employee.swift
//  ecartApp
//
//  Created by Saket Kumar on 26/05/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import Foundation

struct EmployeeData: Codable {
    let status: String?
    let data: [DataEmp]?
}

struct DataEmp: Codable {
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
