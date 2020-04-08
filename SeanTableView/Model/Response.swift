//
//  Response.swift
//  SeanTableView
//
//  Created by Filip Glavica on 08/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//


import Foundation

public struct Response<T: Codable>: Codable {
    let results: T
}


