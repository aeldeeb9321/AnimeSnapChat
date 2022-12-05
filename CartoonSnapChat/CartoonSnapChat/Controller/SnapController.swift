//
//  ViewController.swift
//  CartoonSnapChat
//
//  Created by Ali Eldeeb on 12/5/22.
//

import SwiftUI

private let reuseIdentifier = "cvId"
private let headerId = "headerId"
class SnapController: UICollectionViewController {
    //MARK: - Properties
    static let categoryId = "categoryId"
    
    //MARK: - Init
    
    init(){
        super.init(collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, environment in
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/5), heightDimension: .absolute(75)))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(75)), subitems: [item])
            group.contentInsets.leading = 6
            group.interItemSpacing = .fixed(15)
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = -10
            section.orthogonalScrollingBehavior = .continuous
            section.boundarySupplementaryItems = [NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(45)), elementKind: SnapController.categoryId, alignment: .topLeading)]
            return section
        }))
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
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: SnapController.categoryId, withReuseIdentifier: headerId)
    }
    
    //MARK: - Selectors


}

//MARK: - CollectionView Methods
extension SnapController{
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: SnapController.categoryId, withReuseIdentifier: headerId, for: indexPath) as! HeaderView
        return view
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .systemMint
        cell.layer.cornerRadius = 40
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
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
