//
//  AddItemViewController.swift
//  ToDoList
//
//  Created by VTVH on 6/4/21.
//

import UIKit

class AddItemViewController: UIViewController {
    @IBOutlet weak var addTitleTextField: UITextField!
    @IBOutlet weak var statusSegmentCnt: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI(){
        setupTextField()
        setupSegment()
        configBarBtnItem()
    }
    
    
    private func setupTextField(){
        self.addTitleTextField.delegate = self
    }
    
    private func setupSegment(){
        
    }
    
    private func configBarBtnItem(){
        let saveBarBtn = UIBarButtonItem(title: "SAVE", style: .done , target: self, action: #selector(addTapped(barBtnItem:)))
        saveBarBtn.tintColor = .systemRed
        navigationItem.rightBarButtonItem = saveBarBtn
        

    }
    
    @objc func addTapped(barBtnItem:UIBarButtonItem){
        print("show view controller add item")

    }
}

extension AddItemViewController:UITextFieldDelegate{
    
}
