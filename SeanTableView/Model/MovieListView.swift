//
//  MovieCellItem.swift
//  SeanTableView
//
//  Created by Filip Glavica on 08/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import Foundation

struct MovieListView {
    let id: Int
    let title: String
    let description: String
    let imageURL: String
    let year: String
    var watched: Bool
    var favourite: Bool
    
    init(id: Int, title: String, description: String, imageURL: String, year: String, watched: Bool, favourite: Bool){
        self.id = id
        self.title = title
        self.description = description
        self.imageURL = imageURL
        self.year = year
        self.watched = watched
        self.favourite = favourite
    }
}
