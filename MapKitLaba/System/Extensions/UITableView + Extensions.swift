//
//  UITableView + Extensions.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 27.09.2022.
//

import UIKit

extension UITableView {
  func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
    guard let cell = self.dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath) as? T
    else { fatalError("Can't configurate a cell") }
    return cell
  }
}
