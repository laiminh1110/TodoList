//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by VTVH on 5/21/21.
//

import UIKit

class ToDoListViewController: UIViewController {
    @IBOutlet weak var toDoTBV: UITableView!
    var arrayItem:[ItemModel] = [ItemModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        configTableView()
    }
    
    
    private func configTableView(){
        toDoTBV.delegate = self
        toDoTBV.dataSource = self
        
    }
    
}

extension ToDoListViewController:UITableViewDelegate{
    
}

extension ToDoListViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // So luong
        return arrayItem.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        return cell
    }
    
}
