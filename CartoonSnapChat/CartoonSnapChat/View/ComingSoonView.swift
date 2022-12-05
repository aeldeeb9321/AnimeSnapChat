//
//  ComingSoonView.swift
//  CartoonSnapChat
//
//  Created by Ali Eldeeb on 12/5/22.
//

import UIKit

class ComingSoonView: UICollectionViewCell{
    //MARK: - Properties
    
    var incomingContent: AnimeContent?{
        didSet{
            guard let incomingContent = incomingContent else{ return }
            imageView.image = incomingContent.image
            contentTitleLabel.text = incomingContent.label
        }
    }
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.setDimensions(height: 85, width: 85)
        return iv
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
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
        addSubview(imageView)
        imageView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor)
        
        addSubview(containerView)
        containerView.anchor(top: safeAreaLayoutGuide.topAnchor,leading: centerXAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, paddingLeading: 10)
    }
}
