//
//  CaptureViewController.swift
//  iSpy
//
//  Created by Macbook on 5/16/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import Foundation
import UIKit


class CaptureViewController: UIViewController {
    
    @IBOutlet weak var captureButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.bringSubview(toFront: captureButton)
    }
    @IBAction func capturePicture(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "WinnerViewController")
        self.navigationController!.pushViewController(controller!, animated: true)
    }
    
}
