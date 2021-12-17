//
//  APIClient.swift
//  TesteIosModal
//
//  Created by VICTOR FELIPPE MAGDESIAN on 14/12/21.
//

import Foundation
import Alamofire

class APIClient{
    
    private init (){
        
    }
    
    static let shared = APIClient()
    
    private(set) var page:Int = 1
    
    public func nextPage(){
        page+=1
    }

    public func getRepositories() -> DataRequest{
        //var repositories:[Repository]?
        AF.request(URL(string: "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=\(page)")!)

    }
    
    public func getPulls(repo:String) -> DataRequest{
        //var repositories:[Repository]?
        AF.request(URL(string:
    "https://api.github.com/repos/\(repo)/pulls")!)
    }
}
