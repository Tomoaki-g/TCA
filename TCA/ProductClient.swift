//
//  ProductClient.swift
//  TCA
//
//  Created by takemoto on 2026/10/21.
//

import Foundation
import ComposableArchitecture

struct ProductClient: Sendable {
    var fetchProducts:
        @Sendable () async throws -> [Product]
}

extension ProductClient: DependencyKey {
    static let liveValue = Self(
        fetchProducts: {
            [
                Product(
                    id: 1,
                    name: "Apple",
                    price: 150
                ),
                Product(
                    id: 2,
                    name: "Banana",
                    price: 100
                )
            ]
        }
    )
}

extension DependencyValues {
    var productClient: ProductClient {
        get { self[ProductClient.self] }
        set { self[ProductClient.self] = newValue }
    }
}
