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
    public  func request(link: String, header: HTTPHeaders?, method: HTTPMethod, parameters: Parameters?, encoder:ParameterEncoder, interceptor:RequestInterceptor?, encoding:ParameterEncoding,convertible:URLConvertible, requestModifier: @escaping Session.RequestModifier) -> DataRequest {

        let request = manager.request(link,
                                 method: method,
                                 parameters: parameters,
                                 encoding: encoding,
                                 headers: header,
                                 interceptor: interceptor)
    
        return request.responseData { (response) in
            if(response.response?.statusCode == 500){
                print("A System Error Has Occurred: \(String(describing: response.response?.statusCode))")
                return
            }
            
            switch response.result{
                case .success(let value):
                    print("request success: \(value)")

                case .failure(let error):
                    print("request failure: \(error.localizedDescription)")

            }
        }
    }
}
