//
//  ViewController.swift
//  XmasApp
//
//  Created by Sehyeon An on 2021/12/19.
//

import UIKit

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
      picker.sourceType = .camera
      present(picker, animated: false, completion: nil)
    }
   
}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
}
