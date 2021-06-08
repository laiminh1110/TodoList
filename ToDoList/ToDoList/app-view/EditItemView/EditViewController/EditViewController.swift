//
//  EditViewController.swift
//  ToDoList
//
//  Created by VTVH on 6/8/21.
//

import UIKit
protocol EditItemDelegate {
    func backToRootVC()
}
class EditViewController: UIViewController {
    var dataItem:ItemModel?
    var status:Status = .DONE
    var delegate:EditItemDelegate?
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    func setupUI()  {
        setupTextField()
        leftNavigationBtn()
        setupPickerView()
    }
    
    func leftNavigationBtn()  {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "UPDATE", style: .plain, target: self, action: #selector(updateAction))
    }
    
    
    private func setupPickerView(){
        guard let dataItem = dataItem else {return}
        pickerView.delegate = self
        pickerView.dataSource = self
        
//        self.status = dataItem.status
    }
    
    private func setupTextField() {
        guard let dataItem = dataItem else {return}
        textField.delegate = self
        textField.keyboardType = .default
        textField.isSecureTextEntry = false
        textField.becomeFirstResponder()
        textField.text = dataItem.name
    }
    
    @objc func updateAction(){
        // call update iem
    }
}

extension EditViewController:UITextFieldDelegate{
    
}

extension EditViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Status.allCases.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let item = Status.allValues
        return item[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let item = Status.allValues

        print("didSeletedItem:\(item[row].rawValue)")
    }
}
