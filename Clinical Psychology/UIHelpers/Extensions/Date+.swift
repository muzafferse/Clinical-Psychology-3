//
//  Date+.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 9.02.2025.
//

import Foundation

extension Date {
    func toDateAndTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        return dateFormatter.string(from: self)
    }
}
