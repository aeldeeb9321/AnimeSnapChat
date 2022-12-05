//
//  HeaderView.swift
//  CartoonSnapChat
//
//  Created by Ali Eldeeb on 12/5/22.
//

import UIKit

class HeaderView: UICollectionReusableView{
    //MARK: - Properties
    private let titleLabel: UILabel = {
        let label = UILabel().makeLabel(withText: "Stories",textColor: .lightGray, withFont: UIFont.boldSystemFont(ofSize: 14))
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
        titleLabel.centerY(inView: self)
        titleLabel.anchor(leading: safeAreaLayoutGuide.leadingAnchor, paddingLeading: 6)
    }
}
