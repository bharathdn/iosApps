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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIView.animate(withDuration: 1, animations: {
            self.billValue.alpha = 1
//            self.billValue.beginFloatingCursor(at: CGPoint(0))
            self.billValue.becomeFirstResponder()
         })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipControlIndex")
        
        // If there was a billValue before navigating to settings
        // and if the tip% changed, then recompute the tip and total
        if(!(billValue.text?.isEmpty)!) {
            calculateTip((Any).self)
        }
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        toggleElements(1)
        let tipPercentages = [0.15, 0.20, 0.25]
        let bill = Double(billValue.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        tipValueLabel.text = String(format: "$%.2f", tip)
        totalValueLabel.text = String(format: "$%.2f", tip + bill)
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

