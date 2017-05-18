//
//  CaptureViewController.swift
//  iSpy
//
//  Created by Macbook on 5/16/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import Foundation
import UIKit


class CaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var captureButton: UIButton!
    @IBOutlet weak var captureImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exposeCamera() 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.view.bringSubview(toFront: captureButton)
    }
    
    @IBAction func capturePicture(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController")
        self.navigationController!.pushViewController(controller!, animated: true)
    }
    
    func exposeCamera(){
        let nextController = UIImagePickerController()
        nextController.delegate = self
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)){
            print("camera")
            nextController.sourceType = UIImagePickerControllerSourceType.camera
            present(nextController, animated: true, completion: nil)
        }else {
            print("no camera")
            nextController.sourceType = UIImagePickerControllerSourceType.photoLibrary
            present(nextController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            captureImage.image = image
            dismiss(animated: true, completion: nil)
        }
    }
    //cancel image picker
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
