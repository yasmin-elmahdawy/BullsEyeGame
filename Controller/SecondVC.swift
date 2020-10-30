//
//  SecondVC.swift
//  MyBullsEyeApp
//
//  Created by G50 on 3/10/20.
//  Copyright © 2020 G50. All rights reserved.
//

import UIKit
import WebKit

class SecondVC: UIViewController {
    
//MARK:- IBOutlets
    
   @IBOutlet weak var webKitOutlet: WKWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        
    }
    
 //MARK:- IBActions

    @IBAction func closeBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
//MARK:-Helper Functions
    func setUpUI(){
        
   //how to import an HTML Page inside view controller
        
   //we handle this optional here because we are not sure that the path is existing or not
        
        guard let pagePath = Bundle.main.path(forResource: "BullsEye", ofType: "html") else { return }
        
        let pageURL = URL(fileURLWithPath: pagePath)
        
        let HTMLURLRequest = URLRequest(url: pageURL)
        
        webKitOutlet.load(HTMLURLRequest)
    }

}
