//
//  ViewController.swift
//  TipApp
//
//  Created by Bharath D N on 3/2/17.
//  Copyright © 2017 Bharath D N. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipValueLabel: UILabel!
    @IBOutlet weak var billValue: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!
    var localeCurrencySymbol: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIView.animate(withDuration: 1, animations: {
            self.billValue.alpha = 1
            self.billValue.becomeFirstResponder()
         })
        
        let defaults = UserDefaults.standard
        let lastAppCloseTime = defaults.object(forKey: "lastAppCloseTime") as? NSDate ?? NSDate.distantFuture as NSDate
        let timeDiff = NSDate().timeIntervalSince(lastAppCloseTime as Date)
        
        // show the previous bill amount if app restarted time < 10 min
        if(Int(timeDiff) < 600) {
            billValue.text = defaults.string(forKey: "lastBillValue")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipControlIndex")
        
        localeCurrencySymbol = Locale.current.currencySymbol
        billValue.placeholder = localeCurrencySymbol

        // If there was a billValue before navigating to settings
        // and if the tip% changed, then recompute the tip and total
        if(!(billValue.text?.isEmpty)!) {
            calculateTip((Any).self)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        self.billValue.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let defaults = UserDefaults.standard
        defaults.set(NSDate.init(), forKey: "lastAppCloseTime")
        defaults.set(billValue.text, forKey: "lastBillValue")
        defaults.synchronize()
        
        print("settings saved before terminate")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        toggleElements(1)
        let tipPercentages = [0.15, 0.20, 0.25]
        let bill = Double(billValue.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        tipValueLabel.text = formatter.string(from: tip as NSNumber)
        totalValueLabel.text = formatter.string(from: total as NSNumber)
    }
    
    func toggleElements(_ value: CGFloat) {
        UIView.animate(withDuration: 1, animations: {
            self.totalLabel.alpha = value
            self.tipValueLabel.alpha = value
            self.totalValueLabel.alpha = value
            self.tipControl.alpha = value
            self.tipLabel.alpha = value
        });
    }
}

