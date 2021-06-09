//
//  EditViewModel.swift
//  ToDoList
//
//  Created by VTVH on 6/8/21.
//

import Foundation

class EditViewModel {
    // service call API
    let serviceToDoList:ToDoListService = ToDoListService.share
    // call back to viewcontroller
    var didEditSuccess: ((String) -> Void)?
    var needShowError: ((BaseError) -> Void)?
    
    init() {
        
    }
    
    
    func editItemTask(id:Int, title:String, status:Status) {
        serviceToDoList.editItemTask(id: id, title: title, status: status) {  [weak self] result in
            switch result{
            case .success(let itemRes):
                self?.didEditSuccess?(itemRes.data.message)
            case .failure(let error):
                self?.needShowError?(error)
                
            }
        }
    }
}





