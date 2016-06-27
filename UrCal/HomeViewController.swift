//
//  HomeViewController.swift
//  UrCal
//
//  Created by Feng Chang on 6/23/16.
//  Copyright © 2016 Feng Chang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIViewControllerTransitioningDelegate {

    // all buttons in Home page
    @IBOutlet weak var woButton: UIButton!
    @IBOutlet weak var mButton: UIButton!
    @IBOutlet weak var begButton: UIButton!
    @IBOutlet weak var intButton: UIButton!
    @IBOutlet weak var buiButton: UIButton!
    @IBOutlet weak var tranButton: UIButton!
    @IBOutlet weak var findbutton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    
    private lazy var presentationAnimator = GuillotineTransitionAnimation()
    var choiseButtons = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        disNavAppear()
        frameButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showSideMenu(sender: UIButton) {
        let menuVC = storyboard!.instantiateViewControllerWithIdentifier("SideMenuViewController")
        menuVC.modalPresentationStyle = .Custom
        menuVC.transitioningDelegate = self
        if menuVC is GuillotineAnimationDelegate {
            presentationAnimator.animationDelegate = menuVC as? GuillotineAnimationDelegate
        }
        presentationAnimator.supportView = self.navigationController?.navigationBar
        presentationAnimator.presentButton = self.menuButton
        presentationAnimator.duration = 0.6
        self.presentViewController(menuVC, animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
    }

    func disNavAppear() {
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    func frameButtons() {
        self.choiseButtons = [woButton,mButton,begButton,intButton,buiButton,tranButton,findbutton]
        for button in choiseButtons {
            button.layer.cornerRadius = 2.5
            button.layer.borderWidth = 0.5
        }
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presentationAnimator.mode = .Presentation
        return presentationAnimator
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presentationAnimator.mode = .Dismissal
        return presentationAnimator
    }
    
}
