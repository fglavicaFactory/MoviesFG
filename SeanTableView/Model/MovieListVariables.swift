//
//  Constants.swift
//  SeanTableView
//
//  Created by Filip Glavica on 07/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import Foundation

struct Fonts {
    static let bold = "Quicksand-Bold"
    static let regular = "Quicksand-Regular"
    static let medium = "Quicksand-Medium"
}

public struct MovieList: Codable{
    let id: Int
    let overview: String
    let releaseDate: String
    let genreIds: [Int]
    let originalTitle: String
    let originalLanguage: String
    let posterPath: String
    let title: String
    let adult: Bool
    let backdropPath: String
    let video: Bool
    let voteAverage: Float
}
