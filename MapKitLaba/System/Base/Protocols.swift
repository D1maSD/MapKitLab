//
//  Protocols.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 11.10.2022.
//

import Foundation


enum StartsFlow {
    case shedule
    case player
    case map
    case news
}

protocol StartsFlowProtocol {
    func didTapImageView(for flow: StartsFlow)
}

@objc protocol SomeProtocol {
    func didTapFlow(for cell: Cell)
}

//typealias Cells = UITableViewCell & CellConfiguration


@objc protocol TracsImageCellProtocol {
    func didTapImageView(for cell: TracsCell)
}

@objc protocol MainScreenCellProtocol {
    func didTapImageView(for cell: SheduleCellTwo)
}

@objc protocol MapCellProtocol {
    func didTapImageView(for cell: Cell)
}

@objc protocol PlayerCellProtocol {
    func didTapImageView(for cell: PlayerCell)
}

@objc protocol ContactsCellProtocol {
    func didTapImageView(for cell: ContactsCell)
}


protocol MapViewArray {
    associatedtype MapArray
    
    var places: [MapArray]? { get set }
}
