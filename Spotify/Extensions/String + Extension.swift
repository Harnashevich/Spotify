//
//  String + Extension.swift
//  Spotify
//
//  Created by Andrei Harnashevich on 27.11.23.
//

import Foundation


extension String {
    
    static func formattedDate(string: String) -> String {
        guard let date = DateFormatter.dateFormatter.date(from: string) else {
            return string
        }
        return DateFormatter.displayDateFormatter.string(from: date)
    }
}
