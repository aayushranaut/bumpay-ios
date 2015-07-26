//
//  ViewController.swift
//  Bumpay
//
//  Created by Aayush Ranaut on 7/25/15.
//  Copyright (c) 2015 Prathmesh Ranaut. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var currentPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Alamofire.request(.GET, "https://api.coinsecureis.cool/v0/noauth/ticker", parameters: nil)
            .responseJSON { _, _, JSONObject, _ in
                let json = JSON(JSONObject!)
                let path:[SubscriptType] = ["result", 3, 0, "lasttrade", 0, "bid", 0, 0, "rate"]
                let price = json[path]
                let p: Float = price.floatValue / 100.0
                let k = String(format: "%.2f", p)
                self.currentPriceLabel.text = "Current Price: INR \(k)"
        }
    }

    @IBAction func sendCash(sender: AnyObject) {
        performSegueWithIdentifier("sendCashSegue", sender: sender)
    }
    
    
    @IBAction func receiveCash(sender: AnyObject) {
        performSegueWithIdentifier("receiveCaseSegue", sender: sender)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

