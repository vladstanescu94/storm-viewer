//
//  ViewController.swift
//  StormViewer
//
//  Created by Vlad Stanescu on 06.01.2021.
//

import UIKit

class HomeViewController: UITableViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        setupNavigation()
        loadImages()
    }
    
    private func setupNavigation() {
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func loadImages() {
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        pictures.sort()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            viewController.selectedImage = pictures[indexPath.row]
            viewController.selectedImageIndex = indexPath.row + 1
            viewController.totalImagesCount = pictures.count
            navigationController?.pushViewController(viewController, animated: true)
        }
    }

}

