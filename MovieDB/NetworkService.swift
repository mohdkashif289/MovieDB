//
//  NetworkService.swift
//  MovieDB
//
//  Created by Kashif Rizvi on 20/09/22.
//

import Foundation
import UIKit

enum RequestType : String {
    case get = "GET"
    case post = "POST"
}

struct APIConstants {
    static let basePath = "https://api.themoviedb.org/3/movie/now_playing?api_key=38a73d59546aa378980a88b645f487fc&language=en-US&page=1"
}

class NetworkService {
    
    static func fetchImage(url: String, imageView: UIImageView?) {
        guard let imageUrl = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            if let data = data, error == nil {
                let image = UIImage(data: data)
                imageView?.image = image
            }
        }
    }
    
    static func makeRequest(url: String,
                            requestMethod: String = RequestType.get.rawValue) -> URLRequest? {
        
        let getBaseURL = APIConstants.basePath
        guard let customURL = URL(string: getBaseURL) else { return nil }
        var request = URLRequest(url: customURL)
        request.httpMethod = requestMethod
        return request
    }
    
    
    static func executeRequest<T: Decodable>(_ modelType: T.Type,
                                                        request: URLRequest,
                                                        completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                if let model = try? decoder.decode(modelType, from: data) {
                    completion(.success(model))
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
