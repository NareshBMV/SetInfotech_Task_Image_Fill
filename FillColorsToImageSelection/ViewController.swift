//
//  ViewController.swift
//  FillColorsToImageSelection
//
//  Created by Naresh on 29/07/18.
//  Copyright © 2018 Naresh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fillImage: FillImage!
    @IBOutlet weak var clearButton: UIButton!
    
    var selectedImage:UIImage?
    
    let colorPalate:[UIColor] = [.darkGray, .lightGray, .gray, .red, .green, .blue, .cyan, .yellow, .magenta, .orange, .purple, .brown]
    
    override func viewDidLoad() {
        
        fillImage.tolorance = 200
        fillImage.newColor = .red
        selectedImage = fillImage.image
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func clearImageColor(_ sender: Any) {
        fillImage.image = selectedImage
        fillImage.newColor = .clear
    }
}

extension ViewController:UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorPalate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "palateCell", for: indexPath)
        cell.backgroundColor = colorPalate[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        fillImage.newColor = colorPalate[indexPath.row]
    }
}


