//
//  FillImage.swift
//  FillColorsToImageSelection
//
//  Created by Naresh on 29/07/18.
//  Copyright © 2018 Naresh. All rights reserved.
//

import UIKit

class FillImage: UIImageView {
    
    var tolorance:Int?
    var newColor:UIColor?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        let location = touch?.location(in: self)
        let newImage = self.image?.floodFillFromPoint(point: location!, tolerance: tolorance!, fillColor: newColor!)
        
        DispatchQueue.main.async {
            self.image = newImage
        }
    }
}

extension UIImage {

    func floodFillFromPoint(point:CGPoint, tolerance: Int, fillColor:UIColor) -> UIImage {
        let imageBuffer = ImageBuffer(image: self.cgImage!)
        let index = imageBuffer.indexFrom(Int(point.x), Int(point.y))

        let pixel = imageBuffer[index]

        let replacementPixel = Pixel(color: fillColor)

        imageBuffer.getIndicesAndColor(pixel, startingAtPoint: (Int(point.x), Int(point.y)), withColor: replacementPixel, tolerance: tolerance, antialias: true)
        
        return UIImage(cgImage: imageBuffer.image, scale: self.scale, orientation: UIImageOrientation.up)
    }
}


