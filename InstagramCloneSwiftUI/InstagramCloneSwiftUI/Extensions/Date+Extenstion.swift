//
//  Date+Extenstion.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 13.05.2024.
//

import Foundation

extension Date {
    func timeToString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.locale = Locale.current
        return formatter.string(from: self)
    }
}
