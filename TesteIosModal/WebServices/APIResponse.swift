//
//  APIResponse.swift
//  TesteIosModal
//
//  Created by VICTOR FELIPPE MAGDESIAN on 15/12/21.
//

import Foundation
import ObjectMapper

class ApiResponse : Mappable {
    var repositories : [Repository]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        repositories <- map["items"]
    }
}

class PullsApiResponse : Mappable {
    var prs : [Pull]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        prs <- map["prs"]
    }
}

