//
//  ColoursViewController.swift
//  RandomColors
//
//  Created by Nischal Hada on 7/6/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

class ColoursViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView?
    fileprivate let sectionInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
    fileprivate let itemsPerRow: CGFloat = 3
    var activityIndicator : ActivityIndicator? = ActivityIndicator()
    let dataSource = ColoursViewDataSource()
    lazy var viewModel : ColoursViewModel = {
        let viewModel = ColoursViewModel(dataSource: dataSource)
        return viewModel
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupViewModel()
        self.setupCollectionView()
    }
    
    func setupUI() {
        self.title = "Random Colours"
        self.view.backgroundColor = UIColor.white
    }
    
    func setupViewModel() {
       // self.collectionView?.dataSource = self.dataSource
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.collectionView?.reloadData()
        }
        self.viewModel.onErrorHandling = { [weak self] error in
            self?.showAlert(title: "An error occured", message: "Oops, something went wrong!")
        }
    }
    
    func methodViewModelService() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        self.activityIndicator?.start()
        self.viewModel.fetchServiceCall(){ result in
            DispatchQueue.main.async {
                self.activityIndicator?.stop()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.collectionView?.reloadData()
            }
        }
    }
}

// MARK: UICollectionViewDataSource
extension ColoursViewController: UICollectionViewDataSource {
    func setupCollectionView() -> Void{
        guard let layout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        self.collectionView?.collectionViewLayout = layout
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        self.collectionView?.backgroundColor = UIColor.white
        self.collectionView?.showsHorizontalScrollIndicator = false
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000 //Int.max
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColoursViewCell", for: indexPath) as! ColoursViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelect Item")
    }
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension ColoursViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
}

