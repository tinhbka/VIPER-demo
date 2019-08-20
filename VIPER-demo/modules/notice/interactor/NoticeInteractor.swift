//
//  NoticeInteractor.swift
//  VIPER-demo
//
//  Created by Tinh Vu on 8/20/19.
//  Copyright © 2019 Alatin. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class NoticeInteractor: PresenterToInteractorProtocol{
    var presenter: InteractorToPresenterProtocol?

    func fetchNotice() {
        Alamofire.request(API_NOTICE_LIST).responseJSON { response in
            if (response.response?.statusCode == 200) {
                guard let json = response.result.value as AnyObject?,
                    let arrayResponse = json["notice_list"] as? [[String: Any]] else {
                        self.presenter?.noticeFetchFailed()
                        return
                }

                let objects = arrayResponse.map{ Notice(JSON: $0) }
                self.presenter?.noticeFetchedSuccess(notices: Array.filterNils(from: objects))
            } else {
                self.presenter?.noticeFetchFailed()
            }
        }
    }

}
