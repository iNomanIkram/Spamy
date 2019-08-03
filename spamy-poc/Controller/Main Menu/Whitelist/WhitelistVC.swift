//
//  WhitelistVC.swift
//  spamy-poc
//
//  Created by Noman Ikram on 14/07/2019.
//  Copyright © 2019 Noman Ikram. All rights reserved.
//

import UIKit
import SVProgressHUD

class WhitelistVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    fileprivate func alertControllerForAddingWhiteNumber() {
        let alertController = UIAlertController(title: "Add New Number", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Number"
            textField.keyboardType = .phonePad
        }
        
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            
            whiteNumberList.append(firstTextField.text!)
            self.tableview.reloadData()
            
            saveWhiteNumberList()
            
            SVProgressHUD.showSuccess(withStatus: "Added Successfully")
            SVProgressHUD.dismiss(withDelay: 0.5)
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertControllerForEditingWhiteNumber(indexPath:IndexPath)  {
        let alertController = UIAlertController(title: "Edit number", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Number"
            textField.text = whiteNumberList[indexPath.row]
            textField.keyboardType = .phonePad
            
        }
        
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            
            whiteNumberList[indexPath.row] = firstTextField.text!
            self.tableview.reloadData()
            
            saveWhiteNumberList()
            
            SVProgressHUD.showSuccess(withStatus: "Editted Successfully")
            SVProgressHUD.dismiss(withDelay: 0.5)
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        alertControllerForAddingWhiteNumber()
        
    }
    
    
    
}

extension WhitelistVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return whiteNumberList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        cell.textLabel?.text = whiteNumberList[indexPath.row]
        saveWhiteNumberList()
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "delete") { (action, indexPath) in
            // delete item at indexPath
            whiteNumberList.remove(at: indexPath.row)
            saveWhiteNumberList()
            tableView.reloadData()
            
            SVProgressHUD.showSuccess(withStatus: "Deleted Successfully")
            SVProgressHUD.dismiss(withDelay: 0.5)
            
        }
        
        let edit = UITableViewRowAction(style: .normal, title: "edit") { (action, indexPath) in
            // action2 item at indexPath
            self.alertControllerForEditingWhiteNumber(indexPath: indexPath)
            tableView.reloadData()
            
            SVProgressHUD.showSuccess(withStatus: "Editted Successfully")
            SVProgressHUD.dismiss(withDelay: 0.5)
        }
        
        return [delete, edit]
    }
    
}
