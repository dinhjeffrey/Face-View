//
//  EmotionsVC.swift
//  FaceView
//
//  Created by jeffrey dinh on 6/21/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
//

import UIKit

class EmotionsVC: UIViewController {
    
    private let emotionalFaces: Dictionary<String, FacialExpression> = [
        "angry": FacialExpression(eyes: .Closed, eyeBrows: .Furrowed, mouth: .Frown),
        "happy": FacialExpression(eyes: .Open, eyeBrows: .Normal, mouth: .Smile),
        "worried": FacialExpression(eyes: .Open, eyeBrows: .Relaxed, mouth: .Smirk),
        "mischievious": FacialExpression(eyes: .Open, eyeBrows: .Furrowed, mouth: .Grin)
    ]
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationVc = segue.destinationViewController
        if let navCon = destinationVc as? UINavigationController {
            destinationVc = navCon.visibleViewController ?? destinationVc
        }
        if let faceVc = destinationVc as? FaceVC {
            if let identifier = segue.identifier {
                if let expression = emotionalFaces[identifier] {
                    faceVc.expression = expression
                    destinationVc.title = identifier
                    if let sendingButton = sender as? UIButton {
                        faceVc.navigationItem.title = sendingButton.currentTitle
                    }
                }
            }
        }
    }
}
