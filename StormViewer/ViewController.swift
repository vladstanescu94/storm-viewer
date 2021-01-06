//
//  ViewController.swift
//  StormViewer
//
//  Created by Vlad Stanescu on 06.01.2021.
//

import UIKit

class ViewController: UIViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        print(pictures)
    }


}

