//
//  Owner.swift
//  TesteIosModal
//
//  Created by VICTOR FELIPPE MAGDESIAN on 15/12/21.
//

import Foundation
import ObjectMapper

class Owner: Mappable{
    var name: String?
    var imageUrl: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["login"]
        imageUrl <- map["avatar_url"]
    }
}
