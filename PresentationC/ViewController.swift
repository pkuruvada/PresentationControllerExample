//
//  ViewController.swift
//  PresentationC
//
//  Created by VENKATA KURUVADA on 9/7/15.
//  Copyright © 2015 VENKATA KURUVADA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func unwindToViewController(sender: UIStoryboardSegue) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage:UIImage(named: "weather.jpg")!)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

