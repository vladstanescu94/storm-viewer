//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Vlad Stanescu on 06.01.2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var selectedImageIndex = 0
    var totalImagesCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        setupNavigation()
        createImageFromPath()
    }
    
    private func createImageFromPath() {
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    private func setupNavigation() {
        title = "Image \(selectedImageIndex) of \(totalImagesCount)"
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
