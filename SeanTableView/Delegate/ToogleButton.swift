//
//  ToogleButton.swift
//  SeanTableView
//
//  Created by Filip Glavica on 07/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import Foundation

protocol ToogleButton: class {
    func watchedButtonTapped(with id: Int)
    func favouritedButtonTapped(with id: Int)
}
