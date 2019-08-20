//
//  MovieInteractor.swift
//  VIPER-demo
//
//  Created by Tinh Vu on 8/20/19.
//  Copyright © 2019 Alatin. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class MovieInteractor: PresenterToInteractorMovieProtocol{

    var presenter: InteractorToPresenterMovieProtocol?

    func fetchMovie() {

        Alamofire.request(API_MOVIE_LIST).responseJSON { response in
            if (response.response?.statusCode == 200) {
                guard let json = response.result.value as AnyObject?,
                    let arrayResponse = json["movie_list"] as? [[String: Any]] else {
                        self.presenter?.movieFetchFailed()
                        return
                }

                let objects = arrayResponse.map{ Movie(JSON: $0) }
                self.presenter?.movieFetchSuccess(movies: Array.filterNils(from: objects))
            } else {
                self.presenter?.movieFetchFailed()
            }
        }

    }




}
