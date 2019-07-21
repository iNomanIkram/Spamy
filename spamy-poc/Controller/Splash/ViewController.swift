//
//  ViewController.swift
//  spamy-poc
//
//  Created by Noman Ikram on 13/07/2019.
//  Copyright © 2019 Noman Ikram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set timer to 2 seconds and then move to next screen
        setTimer(second: 2)
        
    }
    
    func setTimer(second:Double){
         let timer = Timer.scheduledTimer(timeInterval: second, target: self, selector: #selector(moveToNextScreen), userInfo: nil, repeats: false)
    }
    
    @objc func moveToNextScreen(){
        performSegue(withIdentifier: Constant.Segue.splashToMainMenu, sender: self)
    }
}

