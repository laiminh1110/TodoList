
//
//  ToDoViewModel.swift
//  ToDoList
//
//  Created by VTVH on 5/21/21.
//

import Foundation
import Alamofire
class ToDoViewModel {
    // Service call API
    let service: ToDoListService!
    // Callback to view
    var needReloadTableView: (() -> Void)?
    var needShowError: ((BaseError) -> Void)?
    // Datasource
    var listItem: [ItemModel] = []
    
    init() {
        // Turn on is test is true if you need test for API
        self.service = ToDoListService()
    }
    
    func getItemList()  {
        let header: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept-Language": "en"
        ]
        
        let link = "http://10.100.10.37:3001/todo/search"
        self.service.getListItem(link: link, header: header, parameters: nil, encoding: .httpBody) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result{
            case .success(let itemRes):
                strongSelf.listItem = itemRes.data.items ?? []
                strongSelf.needReloadTableView?()
            case .failure(let error):
                strongSelf.needShowError?(error)
                
            }
        }
    }
    
    func removeItemWith(id:Int, completion:@escaping (String)->Void )  {
        self.service.deleteItem(id: id) { [weak self] result in
            switch result{
            case .success(let data):
                completion(data.data.message)
            case .failure(let error):
                self?.needShowError?(error)
                
            }
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return listItem.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> ItemModel {
        return listItem[indexPath.row]
    }
}
