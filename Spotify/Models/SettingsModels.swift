//
//  SettingsModels.swift
//  Spotify
//
//  Created by Andrei Harnashevich on 18.10.23.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
