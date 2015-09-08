//
//  MessageViewController.swift
//  PresentationC
//
//  Created by VENKATA KURUVADA on 9/7/15.
//  Copyright © 2015 VENKATA KURUVADA. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    var transitionManagerDelegate = TransitionManager();
    
    override func loadView() {
        self.view = MyView();
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        
        self.setTransitions();
    }

    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder);
        
        self.setTransitions();
    }
    
    func setTransitions() {
        
        self.modalPresentationStyle = UIModalPresentationStyle.Custom;
        transitionManagerDelegate.sourceController = self;
        self.transitioningDelegate = transitionManagerDelegate;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
