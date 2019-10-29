//
//  UICollectionView+Register.swift
//  RandomColors
//
//  Created by Nischal Hada on 18/9/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit

extension UICollectionView {

    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView {
        register(UINib(nibName: String(describing: T.self), bundle: nil), forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T
            else { fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)") }
        return cell
    }
}
