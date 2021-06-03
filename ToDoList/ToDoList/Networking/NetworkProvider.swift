//
//  NetworkProvider.swift
//  ToDoList
//
//  Created by VTVH on 5/21/21.
//

import Foundation
import Alamofire

class AlamofireRequest {
    static let shared = AlamofireRequest()
    private let manager = Session.default
    
    
    // Base request
    public  func request<T: Codable>(link: String, header:HTTPHeaders?, method:HTTPMethod, parameters: Parameters? , encoding:URLEncoding, completion: @escaping (Result<T, BaseError>) -> Void ) {
        let requestItem = manager.request(link,
                                          method: method,
                                          parameters: parameters,
                                          encoding: encoding,
                                          headers: header)
        
        requestItem.responseData { (responseAF) in
            if(responseAF.response?.statusCode == 500){
                print("A System Error Has Occurred: \(String(describing: responseAF.response?.statusCode))")
                return
            }
            print("curl:\(requestItem.cURLDescription())")
            switch responseAF.result{
            case .success(let value):
                guard let results = try? JSONDecoder().decode(T.self, from: value) else {
                    // Decode error
                    completion(.failure(BaseError.parseResponseDataFalse(title: "parse Response Data False \(link)")))
                    return
                }
                DispatchQueue.main.async {
                    completion(.success(results))
                }
            case .failure(let error):
                NSLog("error = \(error)")
//                let error = NSError(domain: error.localizedDescription, code: "404", userInfo: nil)
                completion(.failure(BaseError.requestError(title: "error.domain.error", message: error.localizedDescription)))
            }
            
        }
        
    }
}
