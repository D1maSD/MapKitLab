//
//  MapKitLabaRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.10.2022.
//  
//

import Foundation
import UIKit

class MapKitLabaRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> MapKitLabaViewController {
        let viewController = UIStoryboard.loadViewController() as MapKitLabaViewController
        let presenter = MapKitLabaPresenter()
        let router = MapKitLabaRouter()
        let interactor = MapKitLabaInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension MapKitLabaRouter: MapKitLabaWireframe {
    // TODO: Implement wireframe methods
}
