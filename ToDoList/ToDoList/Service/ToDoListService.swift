//
//  ToDoListService.swift
//  ToDoList
//
//  Created by VTVH on 5/21/21.
//



import Foundation
import Alamofire

// cac dich du lien ket voi netwok
class ToDoListService {
    static var share = ToDoListService()
    private let request = AlamofireRequest.shared
    func getListItem(link:String, header:HTTPHeaders?, parameters:Parameters?, encoding:URLEncoding, completion:@escaping(Result<BaseModel, BaseError>)->Void){
        request.request(link: link, header: header, method: .post, parameters: parameters, encoding: encoding) { (result) in
            completion(result)
        }
    }
}
