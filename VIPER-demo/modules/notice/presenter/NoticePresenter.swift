//
//  NoticePresenter.swift
//  VIPER-demo
//
//  Created by Tinh Vu on 8/20/19.
//  Copyright © 2019 Alatin. All rights reserved.
//

import Foundation
import UIKit

class NoticePresenter: ViewToPresenterProtocol {

    var view: PresenterToViewProtocol?

    var interactor: PresenterToInteractorProtocol?

    var router: PresenterToRouterProtocol?

    func startFetchingNotice() {
        interactor?.fetchNotice()
    }

    func showMovieController(navigationController: UINavigationController) {
        router?.pushToMovieScreen(navigationConroller: navigationController)
    }

}

extension NoticePresenter: InteractorToPresenterProtocol{

    func noticeFetchedSuccess(notices: [Notice]) {
        view?.showNotice(notices: notices)
    }

    func noticeFetchFailed() {
        view?.showError()
    }


}
