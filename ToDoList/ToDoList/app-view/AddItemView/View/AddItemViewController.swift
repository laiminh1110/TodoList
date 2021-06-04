//
//  AddItemViewController.swift
//  ToDoList
//
//  Created by VTVH on 6/4/21.
//

import UIKit

protocol AddItemDelegate {
    func reloadTbv()
}

class AddItemViewController: UIViewController {
    @IBOutlet weak var addTitleTextField: UITextField!
    @IBOutlet weak var statusSegmentCnt: UISegmentedControl!
    var addItemViewModel:AddItemViewModel!
    var delegate:AddItemDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        setupTextField()
        setupSegment()
        bindingData()
    }
    
    private func bindingData(){
        addItemViewModel = AddItemViewModel()
        addItemViewModel.didCreateSuccess = { [weak self ] str in
            self?.delegate?.reloadTbv()
        }
    }
    
    private func setupTextField(){
        self.addTitleTextField.becomeFirstResponder()
    }
    
    private func setupSegment(){
        self.statusSegmentCnt = UISegmentedControl(items: ["TODO","DOING","DONE"])
//        statusSegmentCnt.
    }
    

    
    private func callAPICreateItem(name:String,status:Status){
        self.addItemViewModel.saveItem(name: name, status: status)
        
    }
    
    @IBAction func saveItemAction(_ sender: Any) {
        let textInput = addTitleTextField.text!
        if !textInput.isEmpty   {
            callAPICreateItem(name: textInput, status: .DONE)
        }
    }
}

