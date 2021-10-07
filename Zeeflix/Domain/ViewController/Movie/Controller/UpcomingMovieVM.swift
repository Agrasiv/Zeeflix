//
//  UpcomingMovieVM.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 07/10/2021.
//

import Foundation

protocol UpcomingMovieVMProtocol {
    func loadUpcomingMovie()
}

class UpcomingMovieVM : BaseVM, UpcomingMovieVMProtocol {
    
    var upcomingMovieList : (([UpcomingMovieResponseData]) -> Void)?
    
    func loadUpcomingMovie() {
        self.loading?(true)
        UpcomingMovieDAO.shared.getUpcomingMovie { [weak self] (response, error) in
            guard let self = self else {return}
            self.loading?(false)
            if let data = response?.data {
                self.upcomingMovieList?(data)
            } else {
                self.error?(error!.localizedDescription)
                return
            }
        }
    }
}

    
