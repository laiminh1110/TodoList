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
        configBarBtnItem()
        bindingData()
    }
    
    
    private func configTableView(){
        toDoTBV.delegate = self
        toDoTBV.dataSource = self
        toDoTBV.rowHeight = 44;

        toDoTBV.register(UINib(nibName: toDoListTableViewCell, bundle: nil), forCellReuseIdentifier: toDoListTableViewCell)
        
    }
    
    private func configBarBtnItem(){
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped(barBtnItem:)))
        add.tintColor = .red
        navigationItem.rightBarButtonItem = add
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
    
    @objc func addTapped(barBtnItem:UIBarButtonItem){
        let addVC = AddItemViewController(nibName: "AddItemViewController", bundle: nil)
        addVC.modalTransitionStyle = .coverVertical
        addVC.modalPresentationStyle = .popover
        addVC.delegate = self
        self.navigationController?.present(addVC, animated: true, completion: nil)
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


extension ToDoListViewController:AddItemDelegate{
    func reloadTbv() {
        fetchDataListView()
        self.dismiss(animated: true, completion: nil)
    }
    
}
