//
//  Array.swift
//  VIPER-demo
//
//  Created by Tinh Vu on 8/20/19.
//  Copyright © 2019 Alatin. All rights reserved.
//

import Foundation

extension Array {

    static func filterNils(from array: [Element?]) -> [Element] {
        return array.filter { $0 != nil }.map { $0! }
    }
    
}
