//
//  APIClient.swift
//  TesteIosModal
//
//  Created by VICTOR FELIPPE MAGDESIAN on 14/12/21.
//

import Foundation
import Alamofire

class APIClient{
    func execute(_ url:URL){
        AF.request(url).responseJSON { response in
            print(response)
        }
    }
}
