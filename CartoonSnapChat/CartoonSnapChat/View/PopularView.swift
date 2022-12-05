//
//  PopularView.swift
//  CartoonSnapChat
//
//  Created by Ali Eldeeb on 12/5/22.
//

import UIKit

class PopularView: UICollectionViewCell{
    //MARK: - Properties
    var popularContent: AnimeContent?{
        didSet{
            guard let popularContent = popularContent else{ return }
            imageView.image = popularContent.image
            contentTitleLabel.text = popularContent.label
        }
    }
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.setDimensions(height: 45)
        view.backgroundColor = .label.withAlphaComponent(0.87)
        view.addSubview(contentTitleLabel)
        contentTitleLabel.centerY(inView: view)
        contentTitleLabel.anchor(leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
        return view
    }()
    
    private let contentTitleLabel: UILabel = {
        let label = UILabel().makeLabel(textColor: .white, withFont: UIFont.systemFont(ofSize: 18))
        return label
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
        addSubview(containerView)
        containerView.anchor(leading: safeAreaLayoutGuide.leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: safeAreaLayoutGuide.trailingAnchor)
        
        addSubview(imageView)
        imageView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: containerView.topAnchor, trailing: safeAreaLayoutGuide.trailingAnchor)
    }
}
