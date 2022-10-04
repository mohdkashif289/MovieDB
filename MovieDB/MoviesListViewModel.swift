//
//  MoviesListViewModel.swift
//  MovieDB
//
//  Created by Kashif Rizvi on 20/09/22.
//

import Foundation

protocol MovieListViewModelDeletgate: AnyObject {
    func updateSuccess()
    func updateFailure()
}

class MovieListViewModel {
    
    weak var delegate: MovieListViewModelDeletgate?
    var responseModel: MovieListResponse?
    
    func getMovies() {
        
        guard let request = NetworkService.makeRequest(url: APIConstants.basePath) else {
            return
        }
        
        NetworkService.executeRequest(MovieListResponse.self,
                                                 request: request) { response in
            switch response {
            case .success(let modelData):
                self.responseModel = modelData
                DispatchQueue.main.async {
                    self.delegate?.updateSuccess()
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self.delegate?.updateFailure()
                }
            }
        }
    }
}
