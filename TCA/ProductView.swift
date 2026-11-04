//
//  ProductView.swift
//  TCA
//
//  Created by takemoto on 2026/10/21.
//

import SwiftUI
import ComposableArchitecture

struct ProductView: View {
    let store: StoreOf<ProductFeature>

    var body: some View {
        VStack {
            Button("商品を取得") {
                store.send(.loadButtonTapped)
            }

            if store.isLoading {
                ProgressView()
            }

            if let error = store.errorMessage {
                Text(error)
                    .foregroundStyle(.red)
            }

            List(store.products) { product in
                HStack {
                    Text(product.name)
                    Spacer()
                    Text("¥\(product.price)")
                }
            }
        }
    }
}
