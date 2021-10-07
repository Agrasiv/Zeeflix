//
//  PopularMovieDAO.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 07/10/2021.
//

import Foundation
import Alamofire

class PopularMovieDAO {
     static let shared = PopularMovieDAO()
     private init() {}
    
    func getPopularMovie(completion: @escaping ApiResult<PopularMovieResponse>) {
        let header = ApiService.getHeaders()
        
        AlamofireService.shared.request(PopularMovieResponse.self,
                                        at: Constants.API.apiporpularUrl + Constants.API.apiKey,
                                        headers: header,
                                        method: .post,
                                        encoding: JSONEncoding.default,
                                        completion: completion)
    }
}
