//
//  Pull.swift
//  TesteIosModal
//
//  Created by VICTOR FELIPPE MAGDESIAN on 16/12/21.
//

import Foundation
import ObjectMapper

class Pull: Mappable{
    var owner: Owner?
    var webViewUrl: String?
    var title: String?
    var body: String?
    var date: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        owner <- map["user"]
        webViewUrl <- map["html_url"]
        title <- map["title"]
        body <- map["body"]
        date <- map["created_at"]
    }
}
