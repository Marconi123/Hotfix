//
//  MenuCVC.swift
//  Hotfix
//
//  Created by Владислав on 28.10.22.
//

import Firebase
import UIKit

class MenuCVC: UICollectionViewController {
    // MARK: - Properties

    private let reuseIdentifier = "MenuCell"
    private var user: User!
    private var ref: DatabaseReference! = Database.database().reference(withPath: "coffee")
    private var coffees = [Coffee]()

    // MARK: - Life cycle

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
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // удаляем всех Observers
        ref.removeAllObservers()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coffees.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MenuCell
        cell.nameLabel.text = coffees[indexPath.row].name
        cell.priceLabel.text = coffees[indexPath.row].price
        cell.descriptionLabel.text = coffees[indexPath.row].description

        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
         return true
     }
     */

    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
         return true
     }
     */

    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
         return false
     }

     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
         return false
     }

     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {

     }
     */
}

extension MenuCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 20
        return CGSize(width: width, height: width / 2)
    }
}
