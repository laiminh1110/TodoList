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
    
    func deleteItem(id:Int, completion:@escaping(Result<RemoveBaseModel, BaseError>)->Void){
        let link = "http://10.100.10.37:3001/todo/delete/" + "\(id)"
        let header: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept-Language": "en"
        ]
        
        request.request(link: link, header: header, method: .delete, parameters: nil, encoding: .default) { (result) in
            completion(result)
        }
    }
    
    func createNewItem(link:String, name:String, status:Status, completion:@escaping(Result<AddModel, BaseError>)->Void){
        let header: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept-Language": "en"
        ]
        
        let paramsBody = [
            "name": name,
            "status": status.result,
        ] as [String : Any]
        
        request.request(link: link, header: header, method: .post, parameters: paramsBody, encoding: .httpBody) { (result) in
            completion(result)
        }
    }
}
