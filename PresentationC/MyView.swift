//
//  MyView.swift
//  PresentationC
//
//  Created by VENKATA KURUVADA on 9/7/15.
//  Copyright © 2015 VENKATA KURUVADA. All rights reserved.
//

import UIKit

class MyView: UIView {

    var title: UILabel!;
    var button: UIButton!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        self.backgroundColor = UIColor.whiteColor();
        self.addViewItems();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    func addViewItems() {
        
        title = UILabel();
        title.text = "Custom created view!!";
        title.textAlignment = NSTextAlignment.Center;
        title.numberOfLines = 0;
        title.lineBreakMode = NSLineBreakMode.ByWordWrapping;
        self.addSubview(title);
        
        
        button = UIButton();
        button.setTitle("Hide", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.orangeColor();
        button.titleLabel?.textAlignment = NSTextAlignment.Center;
        button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchDown)
        self.addSubview(button);
        
        layoutItems();
        
    }
    
    func layoutItems() {
        
        let views: [String:AnyObject] = [
            "title" : self.title,
            "button":self.button
        ];
        
        
        self.title.translatesAutoresizingMaskIntoConstraints = false;
        self.button.translatesAutoresizingMaskIntoConstraints = false;
        
        let titleHorCons = NSLayoutConstraint.constraintsWithVisualFormat("H:|-5-[title]-5-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        let titleVerCons = NSLayoutConstraint.constraintsWithVisualFormat("V:|-100-[title]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        
        let buttonHorCons = NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[button]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        
        let buttonVerCons = NSLayoutConstraint.constraintsWithVisualFormat("V:[button]-100-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        
        self.addConstraints(titleHorCons);
        self.addConstraints(titleVerCons);
        self.addConstraints(buttonHorCons);
        self.addConstraints(buttonVerCons);
        
    }
    
    
    func buttonClicked(sender: UIButton) {
        
        if var topController = UIApplication.sharedApplication().keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
                topController.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
}
