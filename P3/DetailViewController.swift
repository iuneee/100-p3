//
//  DetailViewController.swift
//  P3
//
//  Created by Erni Iun on 2021/08/08.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    
    var selectedImg: String?
    var imgCount = 0
    var imgPos = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Pic \(imgPos) of \(imgCount)"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharedTapped))
        navigationItem.largeTitleDisplayMode = .never
        
        if let imgToLoad = selectedImg {
            imgView.image = UIImage(named: imgToLoad)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func sharedTapped() {
        guard let img = imgView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        guard let imgName = selectedImg else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [img, imgName], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    

}
