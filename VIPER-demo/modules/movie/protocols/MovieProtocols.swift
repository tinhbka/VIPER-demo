//
//  MovieProtocols.swift
//  VIPER-demo
//
//  Created by Tinh Vu on 8/20/19.
//  Copyright © 2019 Alatin. All rights reserved.
//

import Foundation

protocol ViewToPresenterMovieProtocol:class{

    var view: PresenterToViewMovieProtocol? {get set}
    var interactor: PresenterToInteractorMovieProtocol? {get set}
    var router: PresenterToRouterMovieProtocol? {get set}
    func startFetchingMovie()

}

protocol PresenterToViewMovieProtocol:class {

    func onMovieResponseSuccess(movies: [Movie])
    func onMovieResponseFailed(error: String)

}

protocol PresenterToRouterMovieProtocol:class {

    static func createMovieModule() -> MovieViewController

}

protocol PresenterToInteractorMovieProtocol:class {

    var presenter:InteractorToPresenterMovieProtocol? {get set}
    func fetchMovie()

}

protocol InteractorToPresenterMovieProtocol:class {

    func movieFetchSuccess(movies: [Movie])
    func movieFetchFailed()

}
