//
//  SettingsViewController.swift
//  TipApp
//
//  Created by Bharath D N on 3/2/17.
//  Copyright © 2017 Bharath D N. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipPercentLabel: UILabel!
    @IBOutlet weak var defaultTipPercentSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDefaultTipValueChange(_ sender: Any) {
        defaultTipPercentLabel.text = String(Int(defaultTipPercentSlider.value)) + "%"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let defaultTipPercent = Float(defaults.integer(forKey: "defaultTipValue"))
        defaultTipPercentSlider.setValue(defaultTipPercent, animated: false)
        onDefaultTipValueChange(0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(Int(defaultTipPercentSlider.value), forKey: "defaultTipValue")
        defaults.synchronize()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
