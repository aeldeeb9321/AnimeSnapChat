//
//  StoryView.swift
//  CartoonSnapChat
//
//  Created by Ali Eldeeb on 12/5/22.
//

import UIKit

class StoryView: UICollectionViewCell{
    //MARK: - Properties
    var story: UIImage?{
        didSet{
            guard let story = story else{ return }
            imageView.image = story
        }
    }
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Helpers
    private func configureCellUI(){
        addSubview(imageView)
        imageView.fillSuperView(inView: self)
    }
}
