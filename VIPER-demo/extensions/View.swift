//
//  View.swift
//  VIPER-demo
//
//  Created by Tinh Vu on 8/20/19.
//  Copyright © 2019 Alatin. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    /* Show Progress Indicator */
    func showProgressIndicator(){

        self.isUserInteractionEnabled = false

        // Create and add the view to the screen.
        let progressIndicator = ProgressIndicator(text: "Please wait..")
        progressIndicator.tag = PROGRESS_INDICATOR_VIEW_TAG
        self.addSubview(progressIndicator)

    }

    /* Hide progress Indicator */
    func hideProgressIndicator(){

        self.isUserInteractionEnabled = true

        if let viewWithTag = self.viewWithTag(PROGRESS_INDICATOR_VIEW_TAG) {
            viewWithTag.removeFromSuperview()
        }

    }
}
