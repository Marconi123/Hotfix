//
//  MenuCollectionVC.swift
//  Hotfix
//
//  Created by Владислав on 21.11.22.
//

import Firebase
import UIKit

final class MenuCollectionVC: UICollectionViewController {
    // MARK: - Properties
    
    private var coffees = [Coffee]()
    private let ref = Database.database().reference(withPath: "coffee")
    
    // MARK: - Life cycle
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: "MenuCVCell", bundle: nil), forCellWithReuseIdentifier: "MenuCVCell")
    }
    
    // viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.ref.observe(.value) { [weak self] snapshot in
                var coffees = [Coffee]()
                for item in snapshot.children {
                    guard let snapshot = item as? DataSnapshot,
                          let coffee = Coffee(snapshot: snapshot)
                    else {
                        continue
                    }
                    coffees.append(coffee)
                }
                self?.coffees = coffees
                self?.collectionView.reloadData()
            }
        }
    }
    
    // viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // удаляем всех Observers
        ref.removeAllObservers()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        coffees.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCVCell", for: indexPath) as! MenuCVCell
        
        let set = URL(string: coffees[indexPath.row].photoURL)
        cell.coffeeImage.load(url: set!)
        cell.coffeeName.text = coffees[indexPath.row].name
        cell.coffeePrice.text = coffees[indexPath.row].price
        cell.coffeeDescription.text = coffees[indexPath.row].description
        return cell
    }
    
   private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 20
        return CGSize(width: width, height: width / 4)
    }
}

// MARK: - Extensions

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
