//
//  NoticeProtocols.swift
//  VIPER-demo
//
//  Created by Tinh Vu on 8/20/19.
//  Copyright © 2019 Alatin. All rights reserved.
//

import Foundation
import UIKit

protocol InteractorToPresenterProtocol: class {
    func noticeFetchedSuccess(notices: [Notice])
    func noticeFetchFailed()
}

protocol PresenterToInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? {get set}
    func fetchNotice()
}

protocol PresenterToViewProtocol: class{
    func showNotice(notices: [Notice])
    func showError()
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> NoticeViewController
    func pushToMovieScreen(navigationConroller: UINavigationController)
}

protocol ViewToPresenterProtocol: class{

    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingNotice()
    func showMovieController(navigationController: UINavigationController)

}
