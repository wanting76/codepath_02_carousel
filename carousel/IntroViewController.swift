//
//  IntroViewController.swift
//  carousel
//
//  Created by Wanting Huang on 2/14/15.
//  Copyright (c) 2015 Wan-Ting Huang. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introImage: UIImageView!
   
    var xOffsets : [Float] = [-70, 25, 20, 80, -120, -85]
    var yOffsets : [Float] = [-275, -235, -400, -385, -480, -480]
    var scales : [Float] = [1, 2, 1.7, 1.7, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max-r1Min)
        return value * ratio + r2Min - r1Min * ratio
        
    }
        
    //func transformView(view : UIView!, atIndex index: Int, offset : Float {
    //}
        
    //func updateViewTransformsWithOffset(offset: Float) {
            
    //}
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        introScrollView.contentSize = introImage.frame.size
        
        introScrollView.delegate = self
        
        tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(xOffsets[0]), CGFloat(yOffsets[0]))
        tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(scales[0]), CGFloat(scales[0]))
        tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(rotations[0]) * M_PI / 180))
        
        tile2View.transform = CGAffineTransformMakeTranslation(CGFloat(xOffsets[1]), CGFloat(yOffsets[1]))
        tile2View.transform = CGAffineTransformScale(tile2View.transform, CGFloat(scales[1]), CGFloat(scales[1]))
        tile2View.transform = CGAffineTransformRotate(tile2View.transform, CGFloat(Double(rotations[1]) * M_PI / 180))
        
        tile3View.transform = CGAffineTransformMakeTranslation(CGFloat(xOffsets[2]), CGFloat(yOffsets[2]))
        tile3View.transform = CGAffineTransformScale(tile3View.transform, CGFloat(scales[2]), CGFloat(scales[2]))
        tile3View.transform = CGAffineTransformRotate(tile3View.transform, CGFloat(Double(rotations[2]) * M_PI / 180))
        
        tile4View.transform = CGAffineTransformMakeTranslation(CGFloat(xOffsets[3]), CGFloat(yOffsets[3]))
        tile4View.transform = CGAffineTransformScale(tile4View.transform, CGFloat(scales[3]), CGFloat(scales[3]))
        tile4View.transform = CGAffineTransformRotate(tile4View.transform, CGFloat(Double(rotations[3]) * M_PI / 180))
        
        tile5View.transform = CGAffineTransformMakeTranslation(CGFloat(xOffsets[4]), CGFloat(yOffsets[4]))
        tile5View.transform = CGAffineTransformScale(tile5View.transform, CGFloat(scales[4]), CGFloat(scales[4]))
        tile5View.transform = CGAffineTransformRotate(tile5View.transform, CGFloat(Double(rotations[4]) * M_PI / 180))
        
        tile6View.transform = CGAffineTransformMakeTranslation(CGFloat(xOffsets[5]), CGFloat(yOffsets[5]))
        tile6View.transform = CGAffineTransformScale(tile6View.transform, CGFloat(scales[5]), CGFloat(scales[5]))
        tile6View.transform = CGAffineTransformRotate(tile6View.transform, CGFloat(Double(rotations[5]) * M_PI / 180))
        
        //introScrollView.sendSubviewToBack(introImage)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = Float(scrollView.contentOffset.y)
        
        //tile1View: couple
        //content offset: 0->568
        //x offset: -30 -> 0
        //y offset: -285 -> 0
        var t1x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[0], r2Max: 0)
        var t1y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[0], r2Max: 0)
        var t1scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[0], r2Max: 1)
        var t1rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[0], r2Max: 0)
        tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(t1x), CGFloat(t1y))
        tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(t1scale), CGFloat(t1scale))
        tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(t1rotation) * M_PI / 180))
        
        //tile2View: deer
        var t2x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[1], r2Max: 0)
        var t2y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[1], r2Max: 0)
        var t2scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[1], r2Max: 1)
        var t2rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[1], r2Max: 0)
        tile2View.transform = CGAffineTransformMakeTranslation(CGFloat(t2x), CGFloat(t2y))
        tile2View.transform = CGAffineTransformScale(tile2View.transform, CGFloat(t2scale), CGFloat(t2scale))
        tile2View.transform = CGAffineTransformRotate(tile2View.transform, CGFloat(Double(t2rotation) * M_PI / 180))
        
        //tile3View: fish
        var t3x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[2], r2Max: 0)
        var t3y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[2], r2Max: 0)
        var t3scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[2], r2Max: 1)
        var t3rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[2], r2Max: 0)
        tile3View.transform = CGAffineTransformMakeTranslation(CGFloat(t3x), CGFloat(t3y))
        tile3View.transform = CGAffineTransformScale(tile3View.transform, CGFloat(t3scale), CGFloat(t3scale))
        tile3View.transform = CGAffineTransformRotate(tile3View.transform, CGFloat(Double(t3rotation) * M_PI / 180))
        
        //tile4View: mountain
        var t4x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[3], r2Max: 0)
        var t4y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[3], r2Max: 0)
        var t4scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[3], r2Max: 1)
        var t4rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[3], r2Max: 0)
        tile4View.transform = CGAffineTransformMakeTranslation(CGFloat(t4x), CGFloat(t4y))
        tile4View.transform = CGAffineTransformScale(tile4View.transform, CGFloat(t4scale), CGFloat(t4scale))
        tile4View.transform = CGAffineTransformRotate(tile4View.transform, CGFloat(Double(t4rotation) * M_PI / 180))
        
        //tile5View: house
        var t5x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[4], r2Max: 0)
        var t5y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[4], r2Max: 0)
        var t5scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[4], r2Max: 1)
        var t5rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[4], r2Max: 0)
        tile5View.transform = CGAffineTransformMakeTranslation(CGFloat(t5x), CGFloat(t5y))
        tile5View.transform = CGAffineTransformScale(tile5View.transform, CGFloat(t5scale), CGFloat(t5scale))
        tile5View.transform = CGAffineTransformRotate(tile5View.transform, CGFloat(Double(t5rotation) * M_PI / 180))
        
        //tile6View: dog
        var t6x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[5], r2Max: 0)
        var t6y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[5], r2Max: 0)
        var t6scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[5], r2Max: 1)
        var t6rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[5], r2Max: 0)
        tile6View.transform = CGAffineTransformMakeTranslation(CGFloat(t6x), CGFloat(t6y))
        tile6View.transform = CGAffineTransformScale(tile6View.transform, CGFloat(t6scale), CGFloat(t6scale))
        tile6View.transform = CGAffineTransformRotate(tile6View.transform, CGFloat(Double(t6rotation) * M_PI / 180))

    
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
