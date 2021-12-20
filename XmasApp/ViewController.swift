//
//  ViewController.swift
//  XmasApp
//
//  Created by Sehyeon An on 2021/12/19.
//

import UIKit
import MLKit
import MLImage

class ViewController: UIViewController {
    @IBOutlet weak var Nav: UINavigationBar!
    @IBOutlet weak var imageView: UIImageView!
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: "profile")
        
        
    }
    
    @IBAction func addAct(_ sender: Any) {
        let alert =  UIAlertController(title: "타이틀", message: "메세지", preferredStyle: .actionSheet)
        let library =  UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary()
        }

        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in
        self.openCamera()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func openLibrary(){
      picker.sourceType = .photoLibrary
      present(picker, animated: false, completion: nil)
    }
    func openCamera(){
        //      picker.sourceType = .camera
        //      present(picker, animated: false, completion: nil)
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        }
        else{
            print("Camera not available")
        }
    }
    
    @IBOutlet weak var resultBox: UITextView!
    @IBAction func button(_ sender: Any) {
        guard let image = imageView.image
        else {
            return
        }
        
         let options = ImageLabelerOptions()
         options.confidenceThreshold = 0.7
         let labeler = ImageLabeler.imageLabeler(options: options)
        
        let visionImage = VisionImage(image: image)
        visionImage.orientation = image.imageOrientation
        
        labeler.process(visionImage) { labels, error in
            guard error == nil, let labels = labels else {
                print("error")
                return }
            labels.forEach { label in
                print(label)
                
            }
            // Task succeeded.
            // ...
        }
    }
    
}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = image
            print(info)
        }
        dismiss(animated: true, completion: nil)
        
    }
}
