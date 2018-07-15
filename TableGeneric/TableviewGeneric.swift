//
//  TableviewGeneric.swift
//  TableGeneric
//
//  Created by Kausik Jati on 15/07/18.
//  Copyright © 2018 Kausik Jati. All rights reserved.
//

import UIKit

protocol ReusealbeView : class {
    static var defaultReuseIdentifier : String { get }
}

extension ReusealbeView where Self : UIView {
    static var defaultReuseIdentifier : String {
        return NSStringFromClass(self)
    }
}

extension UITableViewCell : ReusealbeView {}
extension UITableView {
    func register<T: UITableViewCell>(CellClass _:T.Type) {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(type: T.Type , for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: type.defaultReuseIdentifier, for: indexPath) as? T  else {
            fatalError("notable To dequeueCell")
        }
        return cell
    }
}
