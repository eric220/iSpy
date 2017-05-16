//
//  LoginViewController.swift
//  iSpy
//
//  Created by Macbook on 5/9/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated:true, completion: nil)
    }
}
