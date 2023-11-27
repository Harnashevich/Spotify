//
//  DateFormatter + Extensions.swift
//  Spotify
//
//  Created by Andrei Harnashevich on 27.11.23.
//

import Foundation

extension DateFormatter {
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter
    }()
    
    static let displayDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
}
