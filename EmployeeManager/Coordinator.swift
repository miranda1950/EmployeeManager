//
//  Coordinator.swift
//  EmployeeManager
//
//  Created by Miran on 08.06.2024..
//

import UIKit

public protocol Coordinator: AnyObject {
    @discardableResult func start() -> UIViewController
}
