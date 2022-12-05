//
//  HeaderView.swift
//  CartoonSnapChat
//
//  Created by Ali Eldeeb on 12/5/22.
//

import UIKit

class HeaderView: UICollectionReusableView{
    //MARK: - Properties
    var sectionType: SectionType?{
        didSet{
            guard let section = sectionType else{ return }
            self.titleLabel.text = section.description
        }
    }
    private let titleLabel: UILabel = {
        let label = UILabel().makeLabel(textColor: .lightGray, withFont: UIFont.boldSystemFont(ofSize: 14))
        return label
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCellComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Helpers
    private func configureCellComponents(){
        addSubview(titleLabel)
        titleLabel.anchor(leading: safeAreaLayoutGuide.leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, paddingLeading: 6, paddingBottom: 6)
    }
}
