//
//  AssetColor.swift
//  Nimbee
//
//  Created by iMac on 10/08/23.
//

import Foundation
import UIKit

enum AssetsColor {
    case hex00E676Color
    case hex1A1A1AColor
    case hex333333Color
    case hexBEBEBEColor
    case hexF77546Color
    case hex208EF6Color
    case hexFCB842Color
    case hexF0396EColor
    case hexDDDBDBColor
    case hexBABABAColor
    case hex013C2EColor
    case hex00BA88Color
    case hexC5E3FFColor
    case hexEF1B0DColor
    case hexF88A8AColor
    case hex452C4FColor
    case hexF9745FColor
    case hex40B6E6Color
    
}

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor? {
        switch name {
        case .hex00E676Color:
            return UIColor(named: "00E676Color")
        case .hex1A1A1AColor:
            return UIColor(named: "1A1A1AColor")
        case .hex333333Color:
            return UIColor(named: "333333Color")
        case .hexBEBEBEColor:
            return UIColor(named: "BEBEBEColor")
        case .hexF77546Color:
            return UIColor(named: "F77546Color")
        case .hex208EF6Color:
            return UIColor(named: "208EF6Color")
        case .hexFCB842Color:
            return UIColor(named: "FCB842Color")
        case .hexF0396EColor:
            return UIColor(named: "F0396EColor")
        case .hexDDDBDBColor:
            return UIColor(named: "DDDBDBColor")
        case .hexBABABAColor:
            return UIColor(named: "BABABAColor")
        case .hex013C2EColor:
            return UIColor(named: "013C2EColor")
        case .hex00BA88Color:
            return UIColor(named: "00BA88Color")
        case .hexC5E3FFColor:
            return UIColor(named: "C5E3FFColor")
        case .hexEF1B0DColor:
            return UIColor(named: "EF1B0DColor")
        case .hexF88A8AColor:
            return UIColor(named: "F88A8AColor")
        case .hex452C4FColor:
            return UIColor(named: "452C4FColor")
        case .hexF9745FColor:
            return UIColor(named: "F9745FColor")
        case .hex40B6E6Color:
            return UIColor(named: "40B6E6Color")
        }
    }
}

