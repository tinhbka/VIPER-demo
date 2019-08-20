//
//  MoviePresenter.swift
//  VIPER-demo
//
//  Created by Tinh Vu on 8/20/19.
//  Copyright © 2019 Alatin. All rights reserved.
//

import Foundation

class MoviePresenter:ViewToPresenterMovieProtocol{

    var view: PresenterToViewMovieProtocol?

    var interactor: PresenterToInteractorMovieProtocol?

    var router: PresenterToRouterMovieProtocol?

    func startFetchingMovie() {
        interactor?.fetchMovie()
    }

}

extension MoviePresenter:InteractorToPresenterMovieProtocol{

    func movieFetchSuccess(movies: [Movie]) {
        view?.onMovieResponseSuccess(movies: movies)
    }

    func movieFetchFailed() {
        view?.onMovieResponseFailed(error: "Some Error message from api response")
    }
}
