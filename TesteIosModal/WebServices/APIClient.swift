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
    
    

    public func getRepositories() -> DataRequest{
        //var repositories:[Repository]?
        AF.request(URL(string: "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=1")!)
//            .responseString{
//                response in
//
//                switch(response.result){
//
//                case.success(let responseString):
//                    let repos = ApiResponse(JSONString: "\(responseString)")
//                    repositories = repos?.repositories
//                    //print(self.repositories![0].owner?.name)
//
//                case.failure(let error):
//                    print(error)
//
//                }
//
//
//            }
//        return repositories ?? []
//        }
    
    
}

//    public func getRepositories() -> Promise<[Repository]>{
//        return Promise<[Repository]>{
//            fullfil,reject -> Void in
//            return AF.request(URL(string: "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=1")!).responseString{
//                response in
//
//                switch(response.result){
//
//                case.success(let responseString):
//                    let repos = ApiResponse(JSONString: "\(responseString)")
//                    fullfil(repos?.repositories)
//
//
//                case.failure(let error):
//                    print(error)
//                    reject(error)
//                }
//
//
//            }
//
//
//        }
//    }

}
