//
//  MovieListCell.swift
//  MovieDB
//
//  Created by Kashif Rizvi on 20/09/22.
//

import Foundation
import UIKit

class MovieListCell: UITableViewCell {
    
    var movieTitle: UILabel?
    var movieDescription: UILabel?
    var movieBanner: UIImageView?
    
    func setupWithData(title: String, des: String, banner: String) {
        setupCell()
        movieTitle?.text = title
        movieDescription?.text = des
        let bannerURL = "https://image.tmdb.org/t/p/w500" + banner
        
        NetworkService.fetchImage(url: bannerURL, imageView: movieBanner)
    }
    
    func setupCell() {
        movieTitle = UILabel()
        movieDescription = UILabel()
        movieBanner = UIImageView()
        
        // Add constraints here for cell imageviews and star ratings
    }
}
