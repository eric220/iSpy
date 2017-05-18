//
//  ResultViewController.swift
//  iSpy
//
//  Created by Macbook on 5/16/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox


class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultsStatement: UILabel!
    @IBOutlet weak var resultsImage: UIImageView!
    @IBOutlet weak var resultsInstructions: UILabel!
    
    enum Results: Int {
        case Win
        case Close
        case WayOff
    }
    
    override func viewDidLoad() {
        AudioServicesPlayAlertSound(1334)
        super.viewDidLoad()
        determineOutcome()
    }
    
    func determineOutcome() {
        //let ranNum = Int(arc4random_uniform(UInt32(2)))
        let result = Results.Win
        switch result {
        case .Win:
            print("Youve won")
        
        case .Close:
            print("Your Close")
            resultsStatement.text = "Close, But No Cigar"
            resultsInstructions.text = "Try Changing Your Position Slightly"
            
        case .WayOff:
            print("Youre Way Off")
            resultsStatement.text = "Are Your Even Looking"
            resultsInstructions.text = "Match The Images To Unlock the Key"
        }
    }
    
}
