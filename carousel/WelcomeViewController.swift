//
//  WelcomeViewController.swift
//  carousel
//
//  Created by Wanting Huang on 2/15/15.
//  Copyright (c) 2015 Wan-Ting Huang. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {


    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var welcomeScrollView: UIScrollView!
    @IBOutlet weak var backContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        welcomeScrollView.contentSize = CGSize(width: 1280, height: 568)
        welcomeScrollView.delegate = self
        backContainer.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        println(welcomeScrollView.contentOffset.x)
        var page : Int = Int (round(welcomeScrollView.contentOffset.x / 320) )
        pageControl.currentPage = page
        
        if (page == 3){
            UIView.animateWithDuration(0.5, animations: {
                self.backContainer.alpha = 1
                self.pageControl.alpha = 0
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
