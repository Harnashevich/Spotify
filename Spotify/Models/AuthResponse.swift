//
//  AuthResponse.swift
//  Spotify
//
//  Created by Andrei Harnashevich on 18.10.23.
//

import Foundation


struct AuthResponse: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String?
    let scope: String
    let token_type: String
}
