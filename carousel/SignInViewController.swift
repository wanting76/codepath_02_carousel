//
//  SignInViewController.swift
//  carousel
//
//  Created by Wanting Huang on 2/14/15.
//  Copyright (c) 2015 Wan-Ting Huang. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet var signInPage: UIView!
    @IBOutlet weak var loginContainer: UIView!
    @IBOutlet weak var signInButtonContainer: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressBackButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            self.loginContainer.center.y = self.loginContainer.center.y - kbSize.height / 2
            self.signInButtonContainer.center.y = self.signInButtonContainer.center.y - kbSize.height
            
            }, completion: nil)
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            self.loginContainer.center.y = self.loginContainer.center.y + kbSize.height / 2
            self.signInButtonContainer.center.y = self.signInButtonContainer.center.y + kbSize.height
            
            }, completion: nil)
        
        
    }

    @IBAction func didTapView(sender: AnyObject) {
        signInPage.endEditing(true)
    }
    
    @IBAction func didPressSignInButton(sender: AnyObject) {
        
        var alertViewEmail = UIAlertView(title: "Email Required", message: "Please enter your email address", delegate: self, cancelButtonTitle: "OK")
        var alertViewSigningIn = UIAlertView(title: "Signing in...", message:nil, delegate: self, cancelButtonTitle:nil)
        var alertViewSignInFailed = UIAlertView(title: "Sign In Failed", message: "Inccorrect email or password.", delegate: self, cancelButtonTitle: "OK")
        
        
        if (emailTextField.text.isEmpty && passwordTextField.text.isEmpty){
            
              alertViewEmail.show()
            
        } else if (emailTextField.text == "tim@thecodepath.com" && passwordTextField.text == "password"){
            
            alertViewSigningIn.show()
            delay(1, {()->() in
                alertViewSigningIn.dismissWithClickedButtonIndex(0, animated: true)
                self.performSegueWithIdentifier("loginSegue", sender: self)
            })
            
        } else {
            
            alertViewSigningIn.show()
            delay(1, {()->() in
                alertViewSigningIn.dismissWithClickedButtonIndex(0, animated: true)
                alertViewSignInFailed.show()
            })
        }
        
        
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
