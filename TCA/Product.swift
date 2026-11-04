//
//  Product.swift
//  TCA
//
//  Created by takemoto on 2026/10/21.
//

import Foundation

struct Product: Equatable, Identifiable, Sendable {
    let id: Int
    let name: String
    let price: Int
}
