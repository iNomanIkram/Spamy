//
//  MainMenuTableViewController.swift
//  spamy-poc
//
//  Created by Noman Ikram on 13/07/2019.
//  Copyright © 2019 Noman Ikram. All rights reserved.
//

import UIKit

class MainMenuTVC: UITableViewController {

  
    @IBOutlet weak var stateBtn: UIButton!
    @IBOutlet weak var currentStateLabel: UILabel!
    @IBAction func stateButtonPressed(_ sender: Any) {
        if isStart == false {
            stateBtn.setTitle("Start Filter", for: .normal)
            stateBtn.backgroundColor = UIColor.materialColor.green
            currentStateLabel.text = "Not Running"
            currentStateLabel.textColor = UIColor.materialColor.red
            isStart = true
        }else{
            stateBtn.setTitle("Stop Filter", for: .normal)
            stateBtn.backgroundColor = UIColor.materialColor.red
            
          
            currentStateLabel.text = "Running"
            currentStateLabel.textColor = UIColor.materialColor.green
            isStart = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBasics()
//        presentShareSheet()
    }
    
    func presentShareSheet() {
        let message = "Check out Spammy, I use it to filter out spam and junk messages from my inbox. Get it free at"
        let url = URL(string: Constant.appUrl)
        let urlToShare = [message,url] as [Any]
        let sharesheet = UIActivityViewController(activityItems: urlToShare as! [Any], applicationActivities: nil)
        sharesheet.popoverPresentationController?.sourceView = self.view
        //        sharesheet.
        
        present(sharesheet,animated: true,completion: nil)
        print("Executed")
    }
    
    func setupBasics(){
        if isStart == false {
            stateBtn.setTitle("Start Filter", for: .normal)
            stateBtn.backgroundColor = UIColor.materialColor.green
            currentStateLabel.text = "Not Running"
            currentStateLabel.textColor = UIColor.materialColor.red
            isStart = true
        }else{
            stateBtn.setTitle("Stop Filter", for: .normal)
            stateBtn.backgroundColor = UIColor.materialColor.red
            
            
            currentStateLabel.text = "Running"
            currentStateLabel.textColor = UIColor.materialColor.green
            isStart = false
        }
    }

    // MARK: - Table view data source
    
    fileprivate func alertToDisplayHowToEnableSpammy() {
        print("hello")
        let alertController = UIAlertController(title: "Enable Spam Blocking", message: "Follow the steps as\nSetting -> Messages -> Unknown & Spam -> Enable Spammy", preferredStyle: .alert)
        
        
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        
        alertController.addAction(okayAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 12
    }
    
   

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 2 {
            
        }else if indexPath.row == 4 {
            performSegue(withIdentifier: "blocklist", sender: self)
        }else if indexPath.row == 5 {
            performSegue(withIdentifier: "whitelist", sender: self)
        }else if indexPath.row == 7 {
            alertToDisplayHowToEnableSpammy()
        }else if indexPath.row == 8 {
            presentShareSheet()
        }else if indexPath.row == 9 {
            //Rate your app
            do {
                try UIApplication.shared.openURL(URL(string:Constant.appUrl)! as URL)
            }catch{
                print("Wrong Url")
            }
        }
        else if indexPath.row == 11 {
            performSegue(withIdentifier: Constant.Segue.homeToPrivacy, sender: self)
        }
        
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
