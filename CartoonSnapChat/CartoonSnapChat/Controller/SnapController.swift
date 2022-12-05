//
//  ViewController.swift
//  CartoonSnapChat
//
//  Created by Ali Eldeeb on 12/5/22.
//

import SwiftUI

private let reuseIdentifier = "cvId"
private let popularId = "popId"
private let headerId = "headerId"
private let incomingId = "comingsoon"

class SnapController: UICollectionViewController {
    //MARK: - Properties
    static let categoryId = "categoryId"
    private let stories = [#imageLiteral(resourceName: "nezuko"), #imageLiteral(resourceName: "madara"), #imageLiteral(resourceName: "zoro"), #imageLiteral(resourceName: "myhero"), #imageLiteral(resourceName: "anya"), #imageLiteral(resourceName: "onePunch"), #imageLiteral(resourceName: "slay"), #imageLiteral(resourceName: "chainsaw")]
    private let popularContent = [AnimeContent(label: "All For One 100%", image: #imageLiteral(resourceName: "myhero")), AnimeContent(label: "Tanjiro Fire Breathing Technique", image: #imageLiteral(resourceName: "slay")), AnimeContent(label: "Madara Rinnegan", image: #imageLiteral(resourceName: "madara"))]
    
    private let incomingContent = [AnimeContent(label: "Chainsaw Man", image: UIImage(named: "chainsaw")), AnimeContent(label: "Tokyo Ghoul", image: UIImage(named: "tokyo")), AnimeContent(label: "My Hero Academia", image: UIImage(named: "myhero")), AnimeContent(label: "Fire Force", image: UIImage(named: "fireforce"))]
    
    //MARK: - Init
    
    init(){
        let layout = SnapController.setupLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCV()
    }
    
    
    //MARK: - Helpers
    private func setupCV(){
        collectionView.backgroundColor = .white
        collectionView.register(StoryView.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(PopularView.self, forCellWithReuseIdentifier: popularId)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: SnapController.categoryId, withReuseIdentifier: headerId)
        collectionView.register(ComingSoonView.self, forCellWithReuseIdentifier: incomingId)
        navigationItem.title = "Cartoon SnapChat"
    }
    
    static func setupLayout() -> UICollectionViewCompositionalLayout{
        return UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, environment in
            if sectionIndex == 0{
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/5), heightDimension: .absolute(75)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(75)), subitems: [item])
                group.contentInsets.leading = 6
                group.interItemSpacing = .fixed(12)
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = -30
                section.orthogonalScrollingBehavior = .continuous
                section.boundarySupplementaryItems = [NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(45)), elementKind: SnapController.categoryId, alignment: .topLeading)]
                return section
            }else if sectionIndex == 1{
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(500)))
                item.contentInsets.top = 12
                item.contentInsets.leading = 12
                item.contentInsets.trailing = 12
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                section.boundarySupplementaryItems = [NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(45)), elementKind: SnapController.categoryId, alignment: .topLeading)]
                return section
            }else{
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/1.65), heightDimension: .absolute(85)))
                item.contentInsets.leading = 12
                item.contentInsets.trailing = 12
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = -135
                section.boundarySupplementaryItems = [NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(45)), elementKind: SnapController.categoryId, alignment: .topLeading)]
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                return section
            }
        })
    }
    
    //MARK: - Selectors


}

//MARK: - CollectionView Methods
extension SnapController{
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: SnapController.categoryId, withReuseIdentifier: headerId, for: indexPath) as! HeaderView
        view.sectionType = SectionType(rawValue: indexPath.section)
        return view
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! StoryView
            cell.story = stories[indexPath.item]
            cell.clipsToBounds = true
            cell.layer.cornerRadius = 40
            return cell
        }else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: popularId, for: indexPath) as! PopularView
            cell.popularContent = popularContent[indexPath.item]
            cell.clipsToBounds = true
            cell.layer.cornerRadius =  16
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: incomingId, for: indexPath) as! ComingSoonView
            cell.incomingContent = incomingContent[indexPath.item]
            cell.clipsToBounds = true
            cell.layer.cornerRadius = 12
            return cell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 8: section == 1 ? 3: 4
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
}


//MARK: - SwiftUI PreviewProvider
struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        Container().edgesIgnoringSafeArea(.all)
    }
    
    struct Container: UIViewControllerRepresentable{
        func makeUIViewController(context: Context) -> UIViewController {
            UINavigationController(rootViewController: SnapController())
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            
        }
        typealias UIViewControllerType = UIViewController
    }
}

struct ContentView: View{
    var body: some View{
        Text("Hello World")
    }
}
