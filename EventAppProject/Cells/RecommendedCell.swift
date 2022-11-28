//
//  RecommendedCell.swift
//  EventAppProject
//
//  Created by Mindy Douglas on 11/20/22.
//

import UIKit

class RecommendedCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        tileImage()
    }
    
//    func tileImage() {
//        let image = UIImage(named: "recommended-img")
//        imageView.image = image?.resizableImage(withCapInsets: .zero, resizingMode: .tile)
//    }
}
