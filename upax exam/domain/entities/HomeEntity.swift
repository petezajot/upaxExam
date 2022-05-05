//
//  HomeEntity.swift
//  upax exam
//
//  Created by Sergio García Vargas on 04/05/22.
//

import Foundation

struct HomeEntity: Codable {
    var total: Int?
    var total_pages: Int?
    var results: [Results?]
}

struct Results: Codable {
    var description: String?
    var user: User?
}

struct User: Codable {
    var id: String?
    var first_name: String?
    var last_name: String?
    var profile_image: ProfileImage?
}

struct ProfileImage: Codable {
    var small: String?
    var medium: String?
    var large: String?
}
