//
//  StoryAddViewController.swift
//  StoryCollector
//
//  Created by Matthew Oh on 5/25/17.
//  Copyright © 2017 BB Inc. All rights reserved.
//

import UIKit

class StoryAddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var storyImageView: UIImageView!
    
    @IBOutlet var storyTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
    }


    @IBAction func photosTapepd(_ sender: Any) {
    
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let userPickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        storyImageView.image = userPickedImage
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
  
    @IBAction func cameraTapped(_ sender: Any) {
    }
    

    @IBAction func addTapped(_ sender: Any) {
    }

    
}
