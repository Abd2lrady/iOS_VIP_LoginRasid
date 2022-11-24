//
//  ServerResponse.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import Foundation

struct ServerResponse<ResponseType: Codable>: Codable {
    let status: Bool?
    let message: String?
    let data: ResponseType?
    let meta: Meta?
}

struct Meta: Codable {
    let total, from, to, count: Int?
    let perPage, currentPage, lastPage: Int?

    enum CodingKeys: String, CodingKey {
        case total, from, to, count
        case perPage = "per_page"
        case currentPage = "current_page"
        case lastPage = "last_page"
    }
}
