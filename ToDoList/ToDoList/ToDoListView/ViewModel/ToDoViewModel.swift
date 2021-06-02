
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
        let link = "http://f78cf1d64d8329.localhost.run/todo/search"
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
    
    
    func numberOfRowsInSection() -> Int {
        return listItem.count

    }
    
    func cellForRowAt(indexPath: IndexPath) -> ItemModel {
        return listItem[indexPath.row]
    }
}
