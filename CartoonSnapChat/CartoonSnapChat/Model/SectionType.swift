//
//  SectionType.swift
//  CartoonSnapChat
//
//  Created by Ali Eldeeb on 12/5/22.
//

import UIKit

enum SectionType: Int, CaseIterable, CustomStringConvertible{
    case Stories
    case Popular
    case ComingSoon
    
    var description: String{
        switch self{
        case .Stories:
            return "Stories"
        case .Popular:
            return "Popular"
        case .ComingSoon:
            return "Coming Soon"
        }
    }
    
}

struct AnimeContent{
    let label: String
    let image: UIImage?
}
