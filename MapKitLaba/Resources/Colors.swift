//
//  Colors.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 04.10.2022.
//

import UIKit

@objc public extension UIColor {

  static let pointColor = UIColor.color(named: "pointColor")
  static let pointSelectedColor = UIColor.color(named: "pointSelectedColor")
  static let blurColor = UIColor.color(named: "blurColor")
  static let buttonTextColor = UIColor.color(named: "buttonTextColor")
  static let darkRoundedButtonColor = UIColor.color(named: "darkRoundedButtonColor")
  static let defaultBackgroundColor = UIColor.color(named: "defaultBackgroundColor")
  static let defaultBlackColor = UIColor.color(named: "defaultBlackColor")
  static let defaultGrayTextFieldColor = UIColor.color(named: "defaultGrayTextFieldColor")
  static let outlineButtonColor = UIColor.color(named: "outlineButtonColor")
  static let subtitleTextColor = UIColor.color(named: "subtitleTextColor")
  static let titleTextColor = UIColor.color(named: "titleTextColor")
  static let allColors: [UIColor] = [
    pointColor,
    pointSelectedColor,
    blurColor,
    buttonTextColor,
    darkRoundedButtonColor,
    defaultBackgroundColor,
    defaultBlackColor,
    defaultGrayTextFieldColor,
    outlineButtonColor,
    subtitleTextColor,
    titleTextColor,
  ]

  static let allNames: [String] = [
    "pointColor",
    "pointSelectedColor",
    "blurColor",
    "buttonTextColor",
    "darkRoundedButtonColor",
    "defaultBackgroundColor",
    "defaultBlackColor",
    "defaultGrayTextFieldColor",
    "outlineButtonColor",
    "subtitleTextColor",
    "titleTextColor",
  ]

  private static func color(named: String) -> UIColor {
      return UIColor(named: named)!
  }
}
