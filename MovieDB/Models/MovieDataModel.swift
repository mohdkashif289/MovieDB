//
//  MovieDataModel.swift
//  MovieDB
//
//  Created by Kashif Rizvi on 20/09/22.
//

import Foundation

struct MovieDataModel : Codable {
    
    let adult : Bool?
    let backdrop_path : String?
    let genre_ids : [Int]?
    let id : Int?
    let original_language : String?
    let original_title : String?
    let overview : String?
    let popularity : Double?
    let poster_path : String?
    let release_date : String?
    let title : String?
    let video : Bool?
    let vote_average : Double?
    let vote_count : Int?
    var playlistName: String?
    
    enum CodingKeys: CodingKey {
        case adult
        case backdrop_path
        case genre_ids
        case id
        case original_language
        case original_title
        case overview
        case popularity
        case poster_path
        case release_date
        case title
        case video
        case vote_average
        case vote_count
    }
    
    mutating func updatePlaylist(playList: String) {
        self.playlistName = playList
    }
}
