//
//  MapKitLabaViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.10.2022.
//  
//

import Foundation
import UIKit

class MapKitLabaViewController: BaseViewController, StoryboardLoadable {

    // MARK: Properties

    var presenter: MapKitLabaPresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MapKitLabaViewController: MapKitLabaView {
    // TODO: implement view output methods
}
