//
//  Date + Extension.swift
//  Nimbee
//
//  Created by iMac on 31/07/23.
//

import Foundation
import UIKit

extension Date {
    func addHour(n: Int) -> Date {
        let cal = NSCalendar.current
        return cal.date(byAdding: .hour, value: n, to: self)!
    }
    
    func addDay(n: Int) -> Date {
        let cal = NSCalendar.current
        return cal.date(byAdding: .day, value: n, to: self)!
    }
    
    func addMonth(n: Int) -> Date {
        let cal = NSCalendar.current
        return cal.date(byAdding: .month, value: n, to: self)!
    }
    
    public var removeTimeStamp : Date {
        guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: self)) else {
            return Date()
        }
        return date
    }
    
}
