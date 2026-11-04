//
//  ProductFeature.swift
//  TCA
//
//  Created by takemoto on 2026/10/21.
//

import ComposableArchitecture
import Foundation

@Reducer
struct ProductFeature {

    @ObservableState
    struct State: Equatable {
        var products: [Product] = []
        var isLoading = false
        var errorMessage: String?
    }

    enum Action {
        case loadButtonTapped
        case productsResponse(Result<[Product], Error>)
    }
    
    nonisolated enum CancelID {
        case search
    }

    @Dependency(\.productClient)
    var productClient

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {

            case .loadButtonTapped:
                guard !state.isLoading else {
                    return .none
                }

                state.isLoading = true
                state.errorMessage = nil

                return .run { send in
                    do {
                        let products =
                            try await productClient.fetchProducts()

                        await send(
                            .productsResponse(.success(products))
                        )
                    } catch {
                        await send(
                            .productsResponse(.failure(error))
                        )
                    }
                }
                .cancellable(
                    id: CancelID.search,
                    cancelInFlight: true
                )

            case let .productsResponse(.success(products)):
                state.products = products
                state.isLoading = false
                return .none

            case let .productsResponse(.failure(error)):
                state.errorMessage =
                    error.localizedDescription
                state.isLoading = false
                return .none
            }
        }
    }
}
