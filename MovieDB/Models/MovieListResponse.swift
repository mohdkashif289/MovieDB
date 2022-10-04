//
//  MovieListResponse.swift
//  MovieDB
//
//  Created by Kashif Rizvi on 20/09/22.
//

import Foundation

struct MovieListResponse: Codable {
    let page: String?
    let results: [MovieDataModel]?
    let total_pages: Int?
    let total_results: Int?
    let dates: DateFilter?
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case total_pages
        case total_results
        case dates
    }
}

struct DateFilter: Codable {
    let maximum: String?
    let minimum: String?
    
    enum CodingKeys: String, CodingKey {
        case maximum
        case minimum
    }
}
