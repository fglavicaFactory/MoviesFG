//
//  SerilizationManager.swift
//  SeanTableView
//
//  Created by Filip Glavica on 08/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import Foundation
public class SerializationManager {
    static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dataDecodingStrategy = .deferredToData
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    public static func parseData<T: Codable>(jsonData: Data) -> T?{
        let object: T?
        do {
            object = try jsonDecoder.decode(T.self, from: jsonData)
            
        }catch let error {
            debugPrint("Error while parsing data from server. Received dataClassType: \(T.self). More info: \(error)")
            object=nil
        }
        return object
    }
}
