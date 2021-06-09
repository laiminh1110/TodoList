//
//  AddItemViewModel.swift
//  ToDoList
//
//  Created by VTVH on 6/4/21.
//

import Foundation

class AddItemViewModel {
    let service: ToDoListService
    var didCreateSuccess: ((String) -> Void)?
    var needShowError: ((BaseError) -> Void)?
    
    init() {
        service = ToDoListService()
    }
    
    func saveItem(name:String,status:Status) {
        let link = "http://10.100.10.37:3001/todo/create"
        service.createNewItem(link: link, name: name, status: status) { [weak self] result in

            switch result{
            case .success(let itemRes):
                self?.didCreateSuccess?(itemRes.data.message)
            case .failure(let error):
                self?.needShowError?(error)

            }
        }
    }
    
}
