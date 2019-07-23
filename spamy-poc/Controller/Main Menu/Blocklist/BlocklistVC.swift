//
//  BlocklistVC.swift
//  spamy-poc
//
//  Created by Noman Ikram on 14/07/2019.
//  Copyright © 2019 Noman Ikram. All rights reserved.
//

import UIKit

class BlocklistVC: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    @IBAction func segmentedControlChanged(_ sender: Any) {
        tableview.reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 0 {
            alertWithNumberTextField()
        }else if segmentedControl.selectedSegmentIndex == 1{
            alertWithKeywordTextField()
        }
    }
    
    
    func alertWithNumberTextField(){
        let alertController = UIAlertController(title: "Add new name", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter number"
        }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            
            blockNumberList.append(firstTextField.text!)
            self.tableview.reloadData()
            
            saveBlockNumberList()
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertWithKeywordTextField(){
        let alertController = UIAlertController(title: "Add new name", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter keyword"
        }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            
            blockKeywordList.append(firstTextField.text!)
            self.tableview.reloadData()
            
            saveBlockKeywordList()
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertControllerForEditing(indexPath:IndexPath)  {
        let alertController = UIAlertController(title: "Edit Number", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Number"
            if self.segmentedControl.selectedSegmentIndex == 0{
                textField.text = blockNumberList[indexPath.row]
            }else{
                textField.text = blockKeywordList[indexPath.row]
            }
//            textField.text = whiteNumberList[indexPath.row]
        }
        
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            
            if self.segmentedControl.selectedSegmentIndex == 0 {
                blockNumberList[indexPath.row] = firstTextField.text!
            }else{
                 blockKeywordList[indexPath.row] = firstTextField.text!
            }
//            whiteNumberList[indexPath.row] = firstTextField.text!
            self.tableview.reloadData()
            
            saveWhiteNumberList()
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

extension BlocklistVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return blockNumberList.count
        }else {
            return blockKeywordList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")  as! UITableViewCell
            cell.textLabel?.text = blockNumberList[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
            cell.textLabel?.text = blockKeywordList[indexPath.row]
            return cell
        }
    
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "delete") { (action, indexPath) in
            // delete item at indexPath
//            whiteNumberList.remove(at: indexPath.row)
            
            if self.segmentedControl.selectedSegmentIndex == 0 {
                blockNumberList.remove(at: indexPath.row)
            }else{
                blockKeywordList.remove(at: indexPath.row)
            }
            
            tableView.reloadData()
            
        }
        
        let edit = UITableViewRowAction(style: .normal, title: "edit") { (action, indexPath) in
            // action2 item at indexPath
//            whiteNumberList.remove(at: indexPath.row)
           self.alertControllerForEditing(indexPath: indexPath)
            tableView.reloadData()
        }
        
        return [delete, edit]
    }
  
    
    
}
