//
//  SideMenuViewController.swift
//  UrCal
//
//  Created by Feng Chang on 6/23/16.
//  Copyright © 2016 Feng Chang. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController, GuillotineMenu, GuillotineAnimationDelegate, UIPopoverPresentationControllerDelegate {
    

    var dismissButton: UIButton!
    @IBOutlet weak var myplanButton: UIButton!
    @IBOutlet weak var mystatsButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dismissButton = UIButton(frame: CGRectZero)
        dismissButton.setImage(UIImage(named: "home_menu_bar_button"), forState: .Normal)
        dismissButton.addTarget(self, action: #selector(dismissButtonTapped(_:)), forControlEvents: .TouchUpInside)
        //self.navigationItem.leftBarButtonItem?.buttonGroup = dismissButton
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissButtonTapped(sende: UIButton) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func toPopOverView(sender: UIButton) {
        switch sender {
        case myplanButton:
            self.performSegueWithIdentifier("showMyPlan", sender: myplanButton)
            
        case mystatsButton:
            self.performSegueWithIdentifier("showMyStats", sender: mystatsButton)
            
        case profileButton:
            self.performSegueWithIdentifier("showProfile", sender: profileButton)
            
        default:
            print("no this button")
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showMyPlan" {
            let vc = segue.destinationViewController as UIViewController
            let controller = vc.popoverPresentationController
            
            if controller != nil {
                controller?.delegate = self
            }
        } else if segue.identifier == "showMyStats" {
            let vc = segue.destinationViewController as UIViewController
            let controller = vc.popoverPresentationController
            
            if controller != nil {
                controller?.delegate = self
            }
        } else if segue.identifier == "showProfile" {
            let vc = segue.destinationViewController as UIViewController
            let controller = vc.popoverPresentationController
            
            if controller != nil {
                controller?.delegate = self
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
}
