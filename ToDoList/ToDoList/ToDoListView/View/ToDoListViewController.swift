//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by VTVH on 5/21/21.
//

import UIKit

class ToDoListViewController: UIViewController {
    @IBOutlet weak var toDoTBV: UITableView!
    let toDoListTableViewCell = "ToDoListTableViewCell"
    var toDoViewModel:ToDoViewModel!
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        configTableView()
        configRefeshControl()
        bindingData()
    }
    
    
    private func configTableView(){
        toDoTBV.delegate = self
        toDoTBV.dataSource = self
        toDoTBV.register(UINib(nibName: toDoListTableViewCell, bundle: nil), forCellReuseIdentifier: toDoListTableViewCell)
        
    }
    
    private func configRefeshControl(){
        // Setting up UIRefreshControl
        refreshControl.tintColor = UIColor.darkGray
        refreshControl.addTarget(self, action: #selector(handleRefresh(refreshControl:)), for: UIControl.Event.valueChanged)
        toDoTBV.addSubview(refreshControl)
    }
    
    func bindingData(){
        toDoViewModel = ToDoViewModel()
        fetchDataListView()
        toDoViewModel.needReloadTableView = {
            self.toDoTBV.reloadData()
        }
    }
    
    private func fetchDataListView(){
        toDoViewModel.getItemList()
    }
    
    @objc func handleRefresh(refreshControl: UIRefreshControl) {
        // Refresh the data here
        print("pull to refresh")
            fetchDataListView()
        DispatchQueue.main.async {
            if refreshControl.isRefreshing {
                refreshControl.endRefreshing()
            }
        }
    }
    
}

extension ToDoListViewController:UITableViewDelegate{
    
}

extension ToDoListViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoViewModel.numberOfRowsInSection()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: toDoListTableViewCell, for: indexPath) as! ToDoListTableViewCell
        cell.configCell(data: toDoViewModel.cellForRowAt(indexPath: indexPath))
        
        return cell
    }
    
}
