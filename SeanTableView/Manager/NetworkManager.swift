//
//  NetworkManager.swift
//  SeanTableView
//
//  Created by Filip Glavica on 08/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import Foundation

class NetworkManager{
    let apiKey = "?api_key=685a0618138480343c0f7e7217246735"

    func getData(from url: String, _ completed: @escaping ([MovieList]?) -> Void){
            guard let safeUrl = URL(string: url + apiKey) else {return}
            URLSession.shared.dataTask(with: safeUrl){ data, urlResponse, error in
                guard let safeData = data, error == nil, urlResponse != nil else {
                    #warning("HANDLATI ERROR")
                    completed(nil)
                    return
                }
                do{
                    if let decodedObject: Response<[MovieList]> = SerializationManager.parseData(jsonData: safeData){
                        DispatchQueue.main.async {
                            completed(decodedObject.results)
                        }
                    }else{
                        print("ERROR: palo parsanje")
                        completed(nil)
                    }
                }catch let error{
                    print("Error: \(error.localizedDescription)")
                    completed(nil)
                }
            }.resume()
        }
    }
