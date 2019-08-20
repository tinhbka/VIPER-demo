//
//  MovieRouter.swift
//  VIPER-demo
//
//  Created by Tinh Vu on 8/20/19.
//  Copyright © 2019 Alatin. All rights reserved.
//

import Foundation
import UIKit

class MovieRouter: PresenterToRouterMovieProtocol{

    static func createMovieModule() -> MovieViewController {

        let view = MovieRouter.mainstoryboard.instantiateViewController(withIdentifier: "MovieViewController") as! MovieViewController

        let presenter: ViewToPresenterMovieProtocol & InteractorToPresenterMovieProtocol = MoviePresenter()
        let interactor: PresenterToInteractorMovieProtocol = MovieInteractor()
        let router:PresenterToRouterMovieProtocol = MovieRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view

    }

    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }

}
