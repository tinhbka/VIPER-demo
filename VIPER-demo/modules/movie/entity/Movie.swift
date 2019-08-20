//
//  Movie.swift
//  VIPER-demo
//
//  Created by Tinh Vu on 8/20/19.
//  Copyright © 2019 Alatin. All rights reserved.
//

import Foundation
import ObjectMapper

private let ID = "id"
private let TITLE = "title"
private let BRIEF = "brief"
private let IMAGESOURCE = "image_url"

class Movie: Mappable{

    internal var id:String?
    internal var title:String?
    internal var brief:String?
    internal var imagesource:String?

    required init?(map:Map) {
        mapping(map: map)
    }

    func mapping(map:Map){
        id <- map[ID]
        title <- map[TITLE]
        brief <- map[BRIEF]
        imagesource <- map[IMAGESOURCE]
    }

}
