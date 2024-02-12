//
//  LibraryAlbumsResponse.swift
//  Spotify
//
//  Created by Andrei Harnashevich on 12.02.24.
//

import Foundation

struct LibraryAlbumsResponse: Codable {
    let items: [SavedAlbum]
}

struct SavedAlbum: Codable {
    let added_at: String
    let album: Album
}
