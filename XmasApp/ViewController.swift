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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: "profile")
    }
    @IBAction func addAct(_ sender: Any) {
        let alert =  UIAlertController(title: "타이틀", message: "메세지", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}

