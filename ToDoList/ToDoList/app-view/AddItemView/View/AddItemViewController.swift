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
    var statusItem:Status = .DONE
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
        self.statusSegmentCnt.selectedSegmentIndex = 0
        self.statusSegmentCnt.addTarget(self, action: #selector(onTapSegment2(_:)), for: .valueChanged)
        
    }
    
    
    
    private func createNewItem(name:String, status:Status){
        self.addItemViewModel.saveItem(name:name, status:status)
    }
    
    @IBAction func saveItemAction(_ sender: Any) {
        let textInput = addTitleTextField.text!
        if !textInput.isEmpty   {
            createNewItem(name: textInput, status: statusItem)
        }
    }
    
    @objc func onTapSegment2(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            statusItem = .DONE
            print("Segment 0 is selected")
        case 1:
            statusItem = .DOING
            print("Segment 1 is selected")
        case 2:
            statusItem = .TODO
            print("Segment 2 is selected")
        default:
            break
        }
    }
}

