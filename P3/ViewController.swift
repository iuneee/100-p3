//
//  ViewController.swift
//  P3
//
//  Created by Erni Iun on 2021/08/08.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for i in items {
            if i.hasPrefix("nssl") {
                pictures.append(i)
            }
        }
        pictures.sort()
    
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "detail") as? DetailViewController {
            vc.selectedImg = pictures[indexPath.row]
            vc.imgCount = pictures.count
            vc.imgPos = indexPath.row + 1
          
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

